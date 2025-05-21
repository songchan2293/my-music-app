-- DEFINE 기능 끄기
SET DEFINE OFF;
-- 1. 아티스트
INSERT INTO Artist (ID, name, nation, birth_date, subscribed_num) VALUES
('ART_1', 'Beenzino', 'Korea', TO_DATE('1987-09-12', 'YYYY-MM-DD'), 1000000);
INSERT INTO Artist (ID, name, nation, birth_date, subscribed_num) VALUES
('ART_2', 'Kendrick Lamar', 'United States', TO_DATE('1987-06-17', 'YYYY-MM-DD'), 30000000);

-- 2. 앨범
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_1', '2 4 : 2 6', TO_DATE('2012-07-03', 'YYYY-MM-DD'), 9999, 'ART_1');
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_2', 'DAMN.', TO_DATE('2017-04-14', 'YYYY-MM-DD'), 5000000, 'ART_2');

-- 3. 장르
INSERT INTO Genre (ID, name) VALUES 
('K-HIPHOP', 'K-Hip Hop');
INSERT INTO Genre (ID, name) VALUES
('HIPHOP', 'Hip Hop');

-- 4. 곡
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES 
('S_01', 'Nike Shoes', 272, 890, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES 
('S_02', '진절머리', 287, 853, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_03', 'Boogie On & On', 212, 921, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_04', 'Aqua Man', 227, 875, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_05', 'Summer Madness', 267, 643, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_06', 'I''ll Be Back', 254, 643, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_07', 'Profile', 289, 812, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_08', 'If I Die Tomorrow', 258, 987, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_09', 'Always Awake', 221, 777, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D1', 'BLOOD.', 118, 789, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D2', 'DNA.', 185, 1023, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D3', 'YAH.', 160, 841, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D4', 'ELEMENT.', 208, 910, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D5', 'FEEL.', 214, 899, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D6', 'LOYALTY.', 227, 1200, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D7', 'PRIDE.', 275, 880, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D8', 'HUMBLE.', 177, 1500, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D9', 'LUST.', 307, 783, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D10', 'LOVE.', 213, 1333, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D11', 'XXX.', 254, 975, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D12', 'FEAR.', 460, 1049, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D13', 'GOD.', 248, 867, 'ALB_2', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_D14', 'DUCKWORTH.', 248, 1122, 'ALB_2', 'HIPHOP');


-- 5. 아티스트의 곡
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_01', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_02', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_03', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_04', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_05', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_06', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_07', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_08', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_1', 'S_09', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D1', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D2', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D3', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D4', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D5', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D6', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D7', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D8', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D9', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D10', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D11', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D12', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D13', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_2', 'S_D14', 'Main');