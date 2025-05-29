-- 1. 아티스트
SELECT * FROM Artist;
DESC Artist;
-- 2. 앨범
SELECT * FROM Album;
-- 3. 장르
SELECT * FROM Genre;
-- 4. 곡
SELECT * FROM Song;

-- 5. 차트
SELECT * FROM Chart;

-- 6. 플레이리스트
SELECT * FROM Playlist;

-- 7. 유저
SELECT * FROM "USER";

-- 8. 아티스트의 곡
SELECT * FROM Artist_Song
WHERE artist_ID = 'ART_3';

-- 9. 차트 곡
SELECT * FROM Chart_Song
WHERE CHART_ID = 'CHART_3'
ORDER BY CHART_RANK;

SELECT * FROM Chart_Song
WHERE CHART_ID = 'CHART_1'
ORDER BY CHART_RANK;

DELETE FROM Chart_Song
WHERE chart_ID IN ('CHART_1', 'CHART_2', 'CHART_3');

DELETE FROM Chart
WHERE ID IN ('CHART_1', 'CHART_2', 'CHART_3');

-- 10. 플레이리스트 곡
SELECT * FROM Playlist_Song
WHERE playlist_ID = 'PLAYLIST_1'
ORDER BY order_num;

-- 코멘트 달기
-- 1. ALBUM
COMMENT ON TABLE Album IS '앨범 정보를 저장하는 테이블';
COMMENT ON COLUMN Album.ID IS '앨범 고유 ID';
COMMENT ON COLUMN Album.title IS '앨범 제목';
COMMENT ON COLUMN Album.release_date IS '앨범 발매 일자';
COMMENT ON COLUMN Album.liked_num IS '앨범 좋아요 수';
COMMENT ON COLUMN Album.artist_ID IS '아티스트 ID (FK)';

-- 2. Artist
COMMENT ON TABLE Artist IS '아티스트 정보를 저장하는 테이블';
COMMENT ON COLUMN Artist.ID IS '아티스트 고유 ID';
COMMENT ON COLUMN Artist.name IS '아티스트 이름';
COMMENT ON COLUMN Artist.birth_date IS '아티스트 생년월일';
COMMENT ON COLUMN Artist.nation IS '아티스트 국적';
COMMENT ON COLUMN Artist.subscribed_num IS '아티스트 구독자 수';

-- 3. Artist_Song
COMMENT ON TABLE Artist_Song IS '아티스트의 곡 정보를 저장하는 테이블';
COMMENT ON COLUMN Artist_Song.artist_ID IS '아티스트 고유 ID (FK)';
COMMENT ON COLUMN Artist_Song.song_ID IS '곡 고유 ID (FK)';
COMMENT ON COLUMN Artist_Song.artist_role IS '아티스트 역할 (Main, Featuring)';

-- 4. Chart
COMMENT ON TABLE Chart IS '차트를 저장하는 테이블';
COMMENT ON COLUMN Chart.ID IS '차트 ID';
COMMENT ON COLUMN Chart.title IS '차트 제목';
COMMENT ON COLUMN Chart.week_or_month IS '차트 월간/주간 설정';
COMMENT ON COLUMN Chart.create_date IS '차트 생성 날짜';

-- 5. Chart_Song
COMMENT ON TABLE Chart_Song IS '차트의 곡 정보를 저장하는 테이블';
COMMENT ON COLUMN Chart_Song.chart_ID IS '차트 ID (FK)';
COMMENT ON COLUMN Chart_Song.song_ID IS '곡 고유 ID (FK)';
COMMENT ON COLUMN Chart_Song.chart_rank IS '차트 곡 순위';

-- 6. Genre
COMMENT ON TABLE Genre IS '장르를 저장하는 테이블';
COMMENT ON COLUMN Genre.ID IS '장르 ID';
COMMENT ON COLUMN Genre.name IS '장르 제목';

-- 7. Playlist
COMMENT ON TABLE Playlist IS '플레이리스트를 저장하는 테이블';
COMMENT ON COLUMN Playlist.ID IS '플레이리스트 ID';
COMMENT ON COLUMN Playlist.title IS '플레이리스트 제목';
COMMENT ON COLUMN Playlist.description IS '플레이리스트 설명';
COMMENT ON COLUMN Playlist.create_date IS '플레이리스트 생성 날짜';
COMMENT ON COLUMN Playlist.user_ID IS '플레이리스트 생성 유저 고유 ID (FK)';

-- 8. Playlist_Song
COMMENT ON TABLE Playlist_Song IS '플레이리스트의 곡 정보를 저장하는 테이블';
COMMENT ON COLUMN Playlist_Song.playlist_ID IS '플레이리스트 ID (FK)';
COMMENT ON COLUMN Playlist_Song.song_ID IS '곡 고유 ID (FK)';
COMMENT ON COLUMN Playlist_Song.order_num IS '플레이리스트 곡 순서';

-- 9. Song
COMMENT ON TABLE Song IS '수록곡 정보를 저장하는 테이블';
COMMENT ON COLUMN Song.ID IS '곡 고유 ID';
COMMENT ON COLUMN Song.title IS '곡 제목';
COMMENT ON COLUMN Song.song_length IS '곡 길이 (초)';
COMMENT ON COLUMN Song.liked_num IS '곡 좋아요 수';
COMMENT ON COLUMN Song.album_ID IS '앨범 ID (FK)';
COMMENT ON COLUMN Song.genre_ID IS '장르 ID (FK)';

-- 10. User
COMMENT ON TABLE "USER" IS '유저를 저장하는 테이블';
COMMENT ON COLUMN "USER".ID IS '유저 ID';
COMMENT ON COLUMN "USER".name IS '유저 이름';
COMMENT ON COLUMN "USER".email IS '유저 이메일';
COMMENT ON COLUMN "USER".register_date IS '유저 가입 날짜';
COMMENT ON COLUMN "USER".user_type IS '유저 타입 (admin vs user)';

SELECT * FROM user_col_comments WHERE table_name = 'SONG';
