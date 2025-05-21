// app.js
const express = require('express');
const app = express();
const { getConnection } = require('./db');
require('dotenv').config();

app.set('view engine', 'ejs'); // view 엔진을 ejs로 사용
app.use(express.urlencoded({ extended: true })); //POST 폼 데이터 받을 수 있게 설정
app.use(express.static('public')); //public/ 폴더에 있는 정적 파일(CSS, 이미지)을 자동으로 서비스

// home 라우트
app.get('/', async (req, res) => { //홈페이지로 접속하면 실행될 코드
  try {
    const conn = await getConnection(); // OracleDB에 연결

    const [albumResult, artistResult, topSongsResult] = await Promise.all([
    conn.execute(`SELECT ID, title, liked_num FROM Album`),
    conn.execute(`SELECT ID, name, nation, subscribed_num FROM Artist`),
    conn.execute(`
      SELECT ID, title, liked_num
      FROM Song
      ORDER BY liked_num DESC
      FETCH FIRST 5 ROWS ONLY
    `)
  ]);
    await conn.close(); // 연결 닫기
    res.render('home', {
      albums: albumResult.rows,
      artists: artistResult.rows,
      topSongs: topSongsResult.rows.map(row =>({
        id: row[0],
        title: row[1],
        liked_num: row[2]
      }))
    }); // albums라는 이름으로 데이터 넘겨서 화면 출력
  } catch (err) { // 예외 처리
    res.status(500).send("DB Error: " + err.message); // 500번 상태코드 : DB 에러
  }
});
// album 라우트
app.get('/album/:id', async (req, res) => {
  const albumId = req.params.id;
  const conn = await getConnection();

  const [album, songs] = await Promise.all([
    conn.execute(`SELECT title, release_date, liked_num FROM Album WHERE ID = :id`, [albumId]),
    conn.execute(`SELECT title, song_length FROM Song WHERE album_ID = :id`, [albumId])
  ]);

  await conn.close();

  res.render('album', {
    album: {
      title: album.rows[0][0],
      release_date: album.rows[0][1].toISOString().slice(0, 10),
      liked_num: album.rows[0][2]
    },
    songs: songs.rows.map(row =>({
      title: row[0],
      song_length: row[1]
    }))
  });
});

// artist 라우트
app.get('/artist/:id', async (req, res) => {
  const artistId = req.params.id;
  const conn = await getConnection();

  const [artistResult, songsResult] = await Promise.all([
    conn.execute(`SELECT name, nation, birth_date, subscribed_num FROM Artist WHERE ID = :id`, [artistId]),
    conn.execute(`
      SELECT S.title, S.song_length, ASG.artist_role
      FROM Song S
      JOIN Artist_Song ASG ON S.ID = ASG.song_ID
      WHERE ASG.artist_ID = :id
    `, [artistId])
  ]);

  await conn.close();

  res.render('artist', {
    artist: {
      name: artistResult.rows[0][0],
      nation: artistResult.rows[0][1],
      birth_date: artistResult.rows[0][2],
      subscribed_num: artistResult.rows[0][3]
    },
    songs: songsResult.rows.map(row =>({
      title: row[0],
      song_length: row[1],
      role: row[2]
    }))
  });
});

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
      likes: song[2]
    },
    albumTitle: album?.[0] ?? 'Unknown Album',
    artistName: artist?.[0] ?? 'Unknown Artist'
  });
});

const PORT = process.env.PORT || 3000; // env의 PORT 사용 아니면 3000 Port
app.listen(PORT, () => {
  console.log(`서버 실행 중: http://localhost:${PORT}`); // 기본 콘솔 안내
});
