-- 1. 아티스트
SELECT * FROM Artist;
DESC Artist;
-- 2. 앨범
SELECT * FROM Album;
-- 3. 장르
SELECT * FROM Genre;
-- 4. 곡
SELECT * FROM Song
WHERE album_ID = 'ALB_5';
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
