-- DEFINE 기능 끄기
SET DEFINE OFF;
-- 1. 아티스트
INSERT INTO Artist (ID, name, nation, birth_date, subscribed_num) VALUES
('ART_1', 'Beenzino', 'Korea', TO_DATE('1987-09-12', 'YYYY-MM-DD'), 1000000);
INSERT INTO Artist (ID, name, nation, birth_date, subscribed_num) VALUES
('ART_2', 'Kendrick Lamar', 'United States', TO_DATE('1987-06-17', 'YYYY-MM-DD'), 30000000);
INSERT INTO Artist (ID, name, nation, birth_date, subscribed_num) VALUES
('ART_3', 'Kanye West', 'United States', TO_DATE('1977-06-08', 'YYYY-MM-DD'), 25000000);
INSERT INTO Artist (ID, name, nation, birth_date, subscribed_num) VALUES
('ART_4', 'Coldplay', 'United Kingdom', TO_DATE('1998-05-18', 'YYYY-MM-DD'), 40000000);
INSERT INTO Artist (ID, name, nation, birth_date, subscribed_num) VALUES
('ART_5', 'CHANGMO', 'Korea', TO_DATE('1994-05-31', 'YYYY-MM-DD'), 950000);
-- 2. 앨범
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_1', '2 4 : 2 6', TO_DATE('2012-07-03', 'YYYY-MM-DD'), 9999, 'ART_1');
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_2', 'DAMN.', TO_DATE('2017-04-14', 'YYYY-MM-DD'), 5000000, 'ART_2');
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_3', 'Yeezus', TO_DATE('2017-04-14', 'YYYY-MM-DD'), 5000000, 'ART_3');
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_4', 'Viva la Vida or Death and All His Friends', TO_DATE('2008-06-12', 'YYYY-MM-DD'), 5000000, 'ART_4');
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_5', '12', TO_DATE('2016-05-31', 'YYYY-MM-DD'), 12000, 'ART_1');
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_6', 'My Beautiful Dark Twisted Fantasy', TO_DATE('2010-11-22', 'YYYY-MM-DD'), 5500000, 'ART_3');
INSERT INTO Album (ID, title, release_date, liked_num, artist_ID) VALUES
('ALB_7', '돈 벌 시간 3', TO_DATE('2016-12-15', 'YYYY-MM-DD'), 5500000, 'ART_5');

-- 3. 장르
INSERT INTO Genre (ID, name) VALUES
('K-HIPHOP', 'K-Hip Hop');
INSERT INTO Genre (ID, name) VALUES
('HIPHOP', 'Hip Hop');
INSERT INTO Genre (ID, name) VALUES
('ALTERNATIVE', 'Alternative Rock');

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
('S_09', 'Always Awake', 221, 1777, 'ALB_1', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_10', 'Time Travel', 241, 1371, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_11', '토요일의 끝에서', 264, 812, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_12', 'I Don''t Mind', 224, 694, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_13', 'Flexin', 258, 713, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_14', 'January', 229, 998, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_15', 'Being Myself', 241, 881, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_16', 'Break', 185, 987, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_17', 'Imagine Time', 350, 764, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_18', '젖고있어', 200, 677, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_19', 'Dali, Van, Picasso', 224, 909, 'ALB_5', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_20', 'We Are Going To', 322, 802, 'ALB_5', 'K-HIPHOP');

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
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y1', 'On Sight', 156, 563, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y2', 'Black Skinhead', 188, 612, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y3', 'I Am A God', 231, 477, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y4', 'New Slaves', 256, 588, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y5', 'Hold My Liquor', 326, 534, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y6', 'I''m In It', 234, 421, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y7', 'Blood On The Leaves', 360, 612, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y8', 'Guilt Trip', 243, 501, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y9', 'Send It Up', 178, 466, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Y10', 'Bound 2', 229, 987, 'ALB_3', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y11', 'Dark Fantasy', 281, 1904, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y12', 'Gorgeous', 358, 1544, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y13', 'POWER', 293, 1991, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y14', 'All Of The Lights (Interlude)', 63, 1022, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y15', 'All Of The Lights', 300, 2000, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y16', 'Monster', 379, 1833, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y17', 'So Appalled', 398, 1312, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y18', 'Devil In A New Dress', 352, 1877, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y19', 'Runaway', 548, 1999, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y20', 'Hell Of A Life', 328, 1432, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y21', 'Blame Game', 470, 1187, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y22', 'Lost In The World', 257, 1655, 'ALB_6', 'HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID)
VALUES ('S_Y23', 'Who Will Survive In America', 99, 1299, 'ALB_6', 'HIPHOP');

INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C1', 'Life in Technicolor', 149, 1423, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C2', 'Cemeteries of London', 201, 1102, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C3', 'Lost!', 235, 1843, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C4', '42', 237, 1678, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C5', 'Lovers in Japan / Reign of Love', 411, 1932, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C6', 'Yes', 426, 1219, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C7', 'Viva la Vida', 241, 9876, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C8', 'Violet Hill', 241, 2013, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C9', 'Strawberry Swing', 249, 1395, 'ALB_4', 'ALTERNATIVE');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_C10', 'Death and All His Friends', 378, 1724, 'ALB_4', 'ALTERNATIVE');

INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Ch1', 'Ambition', 217, 467, 'ALB_7', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Ch2', 'Rockstar', 203, 460, 'ALB_7', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Ch3', '아이야', 234, 1000, 'ALB_7', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Ch4', 'My Mate', 233, 364, 'ALB_7', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Ch5', 'Bling!', 252, 318, 'ALB_7', 'K-HIPHOP');
INSERT INTO Song (ID, title, song_length, liked_num, album_ID, genre_ID) VALUES
('S_Ch6', 'Jagger', 243, 454, 'ALB_7', 'K-HIPHOP');

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
('ART_1', 'S_10', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_11', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_12', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_13', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_14', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_15', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_16', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_17', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_18', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_19', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_20', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_1', 'S_Ch3', 'Featuring');

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

INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y1', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y2', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y3', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y4', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y5', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y6', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y7', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y8', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y9', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_3', 'S_Y10', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y11', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y12', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y13', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y14', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y15', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y16', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y17', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y18', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y19', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y20', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y21', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y22', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES 
('ART_3', 'S_Y23', 'Main');


INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C1', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C2', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C3', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C4', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C5', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C6', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C7', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C8', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C9', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_4', 'S_C10', 'Main');

INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_5', 'S_Ch1', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_5', 'S_Ch2', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_5', 'S_Ch3', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_5', 'S_Ch4', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_5', 'S_Ch5', 'Main');
INSERT INTO Artist_Song (artist_ID, song_ID, artist_role) VALUES
('ART_5', 'S_Ch6', 'Main');

--6. 차트
INSERT INTO Chart (ID, title, week_or_month, create_date) VALUES
('CHART_1', 'Beenzino 인기차트', 'Week', TO_DATE('2024-05-22', 'YYYY-MM-DD'));
INSERT INTO Chart (ID, title, week_or_month, create_date) VALUES
('CHART_2', 'Kendrick Lamar 인기차트', 'Month', TO_DATE('2024-05-22', 'YYYY-MM-DD'));
INSERT INTO Chart (ID, title, week_or_month, create_date) VALUES
('CHART_3', 'Kanye West 인기차트', 'Month', TO_DATE('2025-05-27', 'YYYY-MM-DD'));
-- 6-1. 상위 10곡을 liked_num 기준으로 Chart_Song에 넣기
INSERT INTO Chart_Song (chart_ID, song_ID, chart_rank)
SELECT
  'CHART_1',
  S.ID,
  RANK() OVER (ORDER BY S.liked_num DESC)
FROM Song S
JOIN Album A on S.album_ID = A.ID
WHERE A.artist_ID = 'ART_1'
FETCH FIRST 10 ROWS ONLY;

INSERT INTO Chart_Song (chart_ID, song_ID, chart_rank)
SELECT
  'CHART_2',
  S.ID,
  RANK() OVER (ORDER BY S.liked_num DESC)
FROM Song S
JOIN Album A on S.album_ID = A.ID
WHERE A.artist_ID = 'ART_2'
FETCH FIRST 10 ROWS ONLY;

INSERT INTO Chart_Song (chart_ID, song_ID, chart_rank)
SELECT
  'CHART_3',
  S.ID,
  RANK() OVER (ORDER BY S.liked_num DESC)
FROM Song S
JOIN Album A on S.album_ID = A.ID
WHERE A.artist_ID = 'ART_3'
FETCH FIRST 10 ROWS ONLY;

-- 7. 유저
INSERT INTO "USER" (ID, name, email, register_date, user_type) VALUES
('USER_1', 'UiamLife', 'songchan2293@naver.com', TO_DATE('2025-05-27', 'YYYY-MM-DD'), 'admin');
INSERT INTO "USER" (ID, name, email, register_date, user_type) VALUES
('USER_2', 'exampleUser', 'songchan2293@gmail.com', TO_DATE('2025-05-28', 'YYYY-MM-DD'), 'user');

-- 8. 플레이리스트
INSERT INTO Playlist (ID, title, description, create_date, USER_ID) VALUES
('PLAYLIST_1', '외국힙합 플레이리스트', '개인적인 감성으로 만든 플레이리스트입니다.', TO_DATE('2025-05-27', 'YYYY-MM-DD'), 'USER_1');

-- 9. 플레이리스트의 곡
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_D2', 1);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_D4', 2);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_D8', 3);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_D14', 4);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_Y2', 5);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_Y10', 6);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_Y11', 7);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_Y13', 8);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_Y15', 9);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_Y16', 10);
INSERT INTO Playlist_Song (playlist_ID, song_ID, order_num) VALUES
('PLAYLIST_1', 'S_Y18', 11);

-- cf) 곡 좋아요 수 업데이트
UPDATE Album
SET liked_num = 1800000
WHERE ID = 'ALB_5';

DELETE FROM Song
WHERE id = 'S_Ch3';

-- 커밋하기
commit;

