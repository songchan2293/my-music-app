-- User 테이블
DROP TABLE "USER";
CREATE TABLE "USER" (
    ID VARCHAR2(20) PRIMARY KEY, -- 유저 ID
    name VARCHAR2(100), -- 이름
    email VARCHAR2(100) UNIQUE, -- 이메일
    register_date DATE, -- 가입일자
    user_type VARCHAR2(20) -- 사용자(user) vs 관리자(admin)
);

-- Album 테이블
DROP TABLE ALBUM;
CREATE TABLE Album (
    ID VARCHAR2(20) PRIMARY KEY, -- Album ID
    title VARCHAR2(100), -- 앨범 이름
    release_date DATE, -- 앨범 발매일자
    liked_num NUMBER, -- 좋아요 수
    artist_ID VARCHAR2(20), -- 아티스트 ID
    CONSTRAINT fk_album_artist FOREIGN KEY (artist_ID) REFERENCES Artist(ID)
);

-- Artist 테이블
DROP TABLE ARTIST;
CREATE TABLE Artist (
    ID VARCHAR2(20) PRIMARY KEY, -- 아티스트 ID
    name VARCHAR2(100), -- 아티스트 이름
    birth_date DATE, -- 생년월일
    nation VARCHAR2(50), -- 국적
    subscribed_num NUMBER -- 구독자 수
);

-- Chart 테이블
DROP TABLE CHART;
CREATE TABLE Chart (
    ID VARCHAR2(20) PRIMARY KEY, -- chart ID
    title VARCHAR2(100), -- 차트 제목
    week_or_month VARCHAR2(10), -- 주간/월간 차트
    create_date DATE -- 차트 생성일자
);

-- Genre 테이블
DROP TABLE GENRE;
CREATE TABLE Genre (
    ID VARCHAR2(20) PRIMARY KEY, -- 장르 ID
    name VARCHAR2(100) -- 장르 이름
);

-- Playlist 테이블
DROP TABLE PLAYLIST;
CREATE TABLE Playlist (
    ID VARCHAR2(20) PRIMARY KEY, -- Playlist ID
    title VARCHAR2(100), -- 플레이리스트 제목
    description VARCHAR2(1000), -- 플레이리스트 설명
    create_date DATE, -- 플레이리스트 생성일자
    user_ID VARCHAR2(20), -- 만든 유저
    CONSTRAINT fk_playlist_user FOREIGN KEY (user_ID) REFERENCES "USER"(ID)
);

-- Song 테이블
DROP TABLE SONG;
CREATE TABLE Song (
    ID VARCHAR2(20) PRIMARY KEY, -- Song ID
    title VARCHAR2(100), -- 노래 제목
    song_length NUMBER, -- 노래 길이
    liked_num NUMBER, -- 좋아요 수
    album_ID VARCHAR2(20), -- 노래 앨범
    genre_ID VARCHAR2(20), -- 노래 장르
    CONSTRAINT fk_song_album FOREIGN KEY (album_ID) REFERENCES Album(ID),
    CONSTRAINT fk_song_genre FOREIGN KEY (genre_ID) REFERENCES Genre(ID)
);

-- Artist_Song 관계 테이블
DROP TABLE ARTIST_SONG;
CREATE TABLE Artist_Song (
    artist_ID VARCHAR2(20), -- 아티스트
    song_ID VARCHAR2(20), -- 노래
    artist_role VARCHAR2(50), -- 아티스트 역할 (메인, 피처링)
    CONSTRAINT pk_artist_song PRIMARY KEY (artist_ID, song_ID),
    CONSTRAINT fk_as_artist FOREIGN KEY (artist_ID) REFERENCES Artist(ID),
    CONSTRAINT fk_as_song FOREIGN KEY (song_ID) REFERENCES Song(ID)
);

-- Chart_Song 관계 테이블
DROP TABLE CHART_SONG;
CREATE TABLE Chart_Song (
    chart_ID VARCHAR2(20), -- 차트
    song_ID VARCHAR2(20), -- 노래
    chart_rank NUMBER, -- 순위
    CONSTRAINT pk_chart_song PRIMARY KEY (chart_ID, song_ID),
    CONSTRAINT fk_cs_chart FOREIGN KEY (chart_ID) REFERENCES Chart(ID),
    CONSTRAINT fk_cs_song FOREIGN KEY (song_ID) REFERENCES Song(ID)
);

-- Playlist_Song 관계 테이블
DROP TABLE PLAYLIST_SONG;
CREATE TABLE Playlist_Song (
    playlist_ID VARCHAR2(20), -- 플레이리스트
    song_ID VARCHAR2(20), -- 노래
    order_num NUMBER, -- 곡 순서
    CONSTRAINT pk_playlist_song PRIMARY KEY (playlist_ID, song_ID),
    CONSTRAINT fk_ps_playlist FOREIGN KEY (playlist_ID) REFERENCES Playlist(ID),
    CONSTRAINT fk_ps_song FOREIGN KEY (song_ID) REFERENCES Song(ID)
);