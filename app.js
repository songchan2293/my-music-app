// app.js
const express = require('express');
const app = express();
const { getConnection } = require('./db');
require('dotenv').config();

app.set('view engine', 'ejs'); // view 엔진을 ejs로 사용
app.use(express.urlencoded({ extended: true })); //POST 폼 데이터 받을 수 있게 설정
app.use(express.static('public')); //public/ 폴더에 있는 정적 파일(CSS, 이미지)을 자동으로 서비스
app.use('/photo', express.static('photo'));

// home 라우트
app.get('/', async (req, res) => { //홈페이지로 접속하면 실행될 코드
  try {
    const {
      albumSort, albumMinLikes,
      artistSort, artistMinSubs,
      songSort, songMinLikes
    } = req.query;

    const conn = await getConnection(); // OracleDB에 연결
    // 1. 앨범 필터링
      let albumQuery = `SELECT ID, title, liked_num FROM Album WHERE 1=1`;
      const albumBinds = [];

      if (albumMinLikes) {
        albumQuery += ` AND liked_num >= :albumMinLikes`;
        albumBinds.push(Number(albumMinLikes));
      }
      if (albumSort === 'liked_desc') albumQuery += ` ORDER BY liked_num DESC`;
      else if (albumSort === 'liked_asc') albumQuery += ` ORDER BY liked_num ASC`;

      // 2. 아티스트 필터링
      let artistQuery = `SELECT ID, name, nation, subscribed_num FROM Artist WHERE 1=1`;
      const artistBinds = [];

      if (artistMinSubs) {
        artistQuery += ` AND subscribed_num >= :artistMinSubs`;
        artistBinds.push(Number(artistMinSubs));
      }
      if (artistSort === 'subs_desc') artistQuery += ` ORDER BY subscribed_num DESC`;
      else if (artistSort === 'subs_asc') artistQuery += ` ORDER BY subscribed_num ASC`;

      // 3. 인기 노래 필터링
      let songQuery = `SELECT ID, title, liked_num FROM Song WHERE 1=1`;
      const songBinds = [];

      if (songMinLikes) {
        songQuery += ` AND liked_num >= :songMinLikes`;
        songBinds.push(Number(songMinLikes));
      }
      if (songSort === 'song_desc') songQuery += ` ORDER BY liked_num DESC`;
      else if (songSort === 'song_asc') songQuery += ` ORDER BY liked_num ASC`;
      else songQuery += ` ORDER BY liked_num DESC`; // 기본

      songQuery += ` FETCH FIRST 10 ROWS ONLY`;

      // 4. 최신 차트
      const chartQuery = `
        SELECT ID, title, create_date FROM Chart ORDER BY create_date DESC
      `;

      // 5. 플레이리스트
      const playlistQuery = `
        SELECT ID, title, description
        FROM Playlist
        ORDER BY create_date DESC
      `;

      // Promise.all
      const [albumResult, artistResult, topSongsResult, chartResult, playlistResult] = await Promise.all([
        conn.execute(albumQuery, albumBinds),
        conn.execute(artistQuery, artistBinds),
        conn.execute(songQuery, songBinds),
        conn.execute(chartQuery),
        conn.execute(playlistQuery)
      ]);


    await conn.close(); // 연결 닫기
    res.render('home', {
      albums: albumResult.rows,
      artists: artistResult.rows,
      topSongs: topSongsResult.rows.map(row =>({
        id: row[0],
        title: row[1],
        liked_num: row[2]
      })),
      charts: chartResult.rows.map(row =>({
        id: row[0],
        title: row[1],
        date: row[2]
      })),
      playlists: playlistResult.rows.map(row =>({
        id: row[0],
        title: row[1],
        description: row[2]
      })),
      albumSort, albumMinLikes,
      artistSort, artistMinSubs,
      songSort, songMinLikes
    }); // albums라는 이름으로 데이터 넘겨서 화면 출력
  } catch (err) { // 예외 처리
    res.status(500).send("DB Error: " + err.message); // 500번 상태코드 : DB 에러
  }
});

// test-db
app.get('/test-db', async (req, res) => {
  try {
    const conn = await getConnection();
    const result = await conn.execute(`SELECT 'DB 연결 성공!' AS msg FROM DUAL`);
    await conn.close();
    res.send(result.rows[0][0]);
  } catch (err) {
    res.status(500).send("DB 연결 실패: " + err.message);
  }
});

// album 라우트
app.get('/album/:id', async (req, res) => {
  const albumId = req.params.id;
  const { sort, albumMinLikes } = req.query;

  const conn = await getConnection();

  // 앨범 정보 그대로
  const albumQuery = `SELECT title, release_date, liked_num FROM Album WHERE ID = :id`;
  const albumResult = await conn.execute(albumQuery, [albumId]);

  // 곡 필터 조건 조립
  let songQuery = `
    SELECT ID, title, song_length, liked_num
    FROM Song
    WHERE album_ID = :id
  `;
  const binds = [albumId];

  if (albumMinLikes) {
    songQuery += ` AND liked_num >= :minLikes`;
    binds.push(Number(albumMinLikes));
  }

  if (sort === 'liked_desc') {
    songQuery += ' ORDER BY liked_num DESC';
  } else if (sort === 'liked_asc') {
    songQuery += ' ORDER BY liked_num ASC';
  } else {
    songQuery += ' ORDER BY ID ASC'; // 기본값: 등록순
  }

  const songsResult = await conn.execute(songQuery, binds);

  await conn.close();

  res.render('album', {
    albumId,
    album: {
      title: albumResult.rows[0][0],
      release_date: albumResult.rows[0][1].toISOString().slice(0, 10),
      liked_num: albumResult.rows[0][2]
    },
    songs: songsResult.rows.map(row =>({
      id : row[0],
      title: row[1],
      song_length: row[2],
      likes: row[3]
    })),
    sort: sort || '',
    albumMinLikes: albumMinLikes || ''
  });
});

// artist 라우트
app.get('/artist/:id', async (req, res) => {
  const artistId = req.params.id;
  const { sort, minLikes, role, albumSort, albumYear } = req.query;

  const conn = await getConnection();

  // 아티스트 정보
  const artistResult = await conn.execute(`
    SELECT name, nation, birth_date, subscribed_num FROM Artist WHERE ID = :id
  `, [artistId]);

  // 참여 곡 필터 조건 동적 쿼리 구성
  let songQuery = `
    SELECT S.ID, S.title, S.song_length, S.liked_num, ASG.artist_role
    FROM Song S
    JOIN Artist_Song ASG ON S.ID = ASG.song_ID
    WHERE ASG.artist_ID = :artistId
  `;
  const binds = { artistId };

  if (minLikes) {
    songQuery += ' AND S.liked_num >= :minLikes';
    binds.minLikes = parseInt(minLikes);
  }

  if (role === 'Main' || role === 'Featuring') {
    songQuery += ' AND ASG.artist_role = :role';
    binds.role = role;
  }

  if (sort === 'liked_desc') {
    songQuery += ' ORDER BY S.liked_num DESC';
  } else if (sort === 'liked_asc') {
    songQuery += ' ORDER BY S.liked_num ASC';
  } else {
    songQuery += ' ORDER BY S.ID ASC'; // 기본 정렬
  }

  const songsResult = await conn.execute(songQuery, binds);

  // 📀 앨범 필터 쿼리
  let albumQuery = `
    SELECT ID, title, release_date, liked_num
    FROM Album
    WHERE artist_ID = :artistId
  `;
  const albumBinds = { artistId };

  if (albumYear) {
    albumQuery += ` AND TO_CHAR(release_date, 'YYYY') = :albumYear`;
    albumBinds.albumYear = albumYear;
  }

  if (albumSort === 'liked_desc') {
    albumQuery += ` ORDER BY liked_num DESC`;
  } else if (albumSort === 'liked_asc') {
    albumQuery += ` ORDER BY liked_num ASC`;
  } else {
    albumQuery += ` ORDER BY release_date ASC`; // 기본값
  }

  const albumResult = await conn.execute(albumQuery, albumBinds);

  await conn.close();

  res.render('artist', {
    artistId,
    artist: {
      name: artistResult.rows[0][0],
      nation: artistResult.rows[0][1],
      birth_date: artistResult.rows[0][2],
      subscribed_num: artistResult.rows[0][3]
    },
    songs: songsResult.rows.map(row => ({
      id: row[0],
      title: row[1],
      song_length: row[2],
      liked_num: row[3],
      role: row[4]
    })),
    albums: albumResult.rows.map(row => ({
      id: row[0],
      title: row[1],
      release_date: row[2],
      liked_num: row[3]
    })),
    sort: sort || '',
    minLikes: minLikes || '',
    role: role || '',
    albumSort: albumSort || '',
    albumYear: albumYear || ''
  });
});
// ss
//song 라우트
app.get('/song/:id', async (req, res) => {
  const songId = req.params.id;
  const conn = await getConnection();

  const [songResult, albumResult, artistResult] = await Promise.all([
    conn.execute(`
      SELECT title, song_length, liked_num, album_ID
      FROM Song
      WHERE ID = :id
    `, [songId]),
    conn.execute(`
      SELECT A.title
      FROM Album A
      JOIN Song S ON A.ID = S.album_ID
      WHERE S.ID = :id
    `, [songId]),
    conn.execute(`
      SELECT AR.name
      FROM Artist AR
      JOIN Artist_Song ASG ON AR.ID = ASG.artist_ID
      WHERE ASG.song_ID = :id
      ORDER BY CASE ASG.artist_role
        WHEN 'Main' THEN 1
        ELSE 2
      END
    `, [songId])
  ]);

  await conn.close();

  const song = songResult.rows[0];
  const album = albumResult.rows[0];
  const artist = artistResult.rows[0];

  res.render('song', {
    song: {
      title: song[0],
      length: song[1],
      likes: song[2],
    },
    albumId: song[3],
    albumTitle: album?.[0] ?? 'Unknown Album',
    artistName: artist?.[0] ?? 'Unknown Artist'
  });
});

// chart 라우트
app.get('/chart/:id', async (req, res) => {
  const chartId = req.params.id;
  const { minLikes, maxRank } = req.query;

  const conn = await getConnection();

  const [chartResult] = await Promise.all([
    conn.execute(`SELECT title, week_or_month, create_date FROM Chart WHERE ID = :id`, [chartId])
  ]);

  let songQuery = `
    SELECT S.ID, S.title, A.name, AL.title, S.liked_num, CS.chart_rank
    FROM Chart_Song CS
    JOIN Song S ON CS.song_ID = S.ID
    JOIN Album AL ON S.album_ID = AL.ID
    JOIN Artist_Song ASG ON S.ID = ASG.song_ID
    JOIN Artist A ON ASG.artist_ID = A.ID
    WHERE CS.chart_ID = :chartId
  `;
  const binds = { chartId };

  if (minLikes) {
    songQuery += ' AND S.liked_num >= :minLikes';
    binds.minLikes = parseInt(minLikes);
  }

  if (maxRank) {
    songQuery += ' AND CS.chart_rank <= :maxRank';
    binds.maxRank = parseInt(maxRank);
  }

  songQuery += ' ORDER BY CS.chart_rank';

  const songsResult = await conn.execute(songQuery, binds);
  await conn.close();

  res.render('chart', {
    chart: {
      id: chartId,
      title: chartResult.rows[0][0],
      period: chartResult.rows[0][1],
      date: chartResult.rows[0][2]
    },
    songs: songsResult.rows.map(row => ({
      id: row[0],
      title: row[1],
      artist: row[2],
      album: row[3],
      liked_num: row[4],
      rank: row[5]
    })),
    minLikes: minLikes || '',
    maxRank: maxRank || ''
  });
});

// playlist 라우트
app.get('/playlist/:id', async (req, res) => {
  const playlistId = req.params.id;
  const { maxOrder } = req.query;

  const conn = await getConnection();

  const playlistResult = await conn.execute(`
    SELECT P.title, P.description, P.create_date, U.name
    FROM Playlist P
    JOIN "USER" U ON P.user_ID = U.ID
    WHERE P.ID = :id
  `, [playlistId]);

  let songQuery = `
    SELECT S.ID, S.title, A.name, AL.title, S.liked_num, PS.order_num
    FROM Playlist_Song PS
    JOIN Song S ON PS.song_ID = S.ID
    JOIN Album AL ON S.album_ID = AL.ID
    JOIN Artist_Song ASG ON S.ID = ASG.song_ID
    JOIN Artist A ON ASG.artist_ID = A.ID
    WHERE PS.playlist_ID = :id
  `;
  const binds = [playlistId];

  if (maxOrder) {
    songQuery += ` AND PS.order_num <= :maxOrder`;
    binds.push(parseInt(maxOrder));
  }

  songQuery += ' ORDER BY PS.order_num';

  const songsResult = await conn.execute(songQuery, binds);
  await conn.close();

  res.render('playlist', {
    playlist: {
      id: playlistId,
      title: playlistResult.rows[0][0],
      description: playlistResult.rows[0][1],
      create_date: playlistResult.rows[0][2],
      creator_name: playlistResult.rows[0][3]
    },
    songs: songsResult.rows.map(row => ({
      id: row[0],
      title: row[1],
      artist: row[2],
      album: row[3],
      liked_num: row[4],
      order_num: row[5]
    })),
    maxOrder: maxOrder || ''
  });
});


const PORT = process.env.PORT || 3000; // env의 PORT 사용 아니면 3000 Port
app.listen(PORT, () => {
  console.log(`서버 실행 중: http://localhost:${PORT}`); // 기본 콘솔 안내
});
