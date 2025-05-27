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

-- 7. 아티스트의 곡
SELECT * FROM Artist_Song
WHERE artist_ID = 'ART_3';

-- 8. 차트 곡
SELECT * FROM Chart_Song
WHERE CHART_ID = 'CHART_3'
ORDER BY CHART_RANK;

SELECT * FROM Chart_Song
WHERE CHART_ID = 'CHART_1'
ORDER BY CHART_RANK;

DELETE FROM 

DELETE FROM Chart_Song
WHERE chart_ID IN ('CHART_1', 'CHART_2', 'CHART_3');

DELETE FROM Chart
WHERE ID IN ('CHART_1', 'CHART_2', 'CHART_3');

COMMENT ON TABLE Song IS '수록곡 정보를 저장하는 테이블';
COMMENT ON COLUMN Song.ID IS '곡 고유 ID';
COMMENT ON COLUMN Song.title IS '곡 제목';
COMMENT ON COLUMN Song.song_length IS '곡 길이 (초)';
COMMENT ON COLUMN Song.liked_num IS '곡 좋아요 수';
COMMENT ON COLUMN Song.album_ID IS '앨범 ID (FK)';
COMMENT ON COLUMN Song.genre_ID IS '장르 ID (FK)';

SELECT * FROM user_col_comments WHERE table_name = 'SONG';
