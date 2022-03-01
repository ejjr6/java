CREATE TABLE tbl_areaSi(
	nsi VARCHAR(50) NOT NULL,
	si VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_areaGu(
	ngu VARCHAR(50) NOT NULL,
    nsi VARCHAR(50) NOT NULL,
    gu VARCHAR(50) NOT NULL,
    si VARCHAR(50) NOT NULL
);

INSERT INTO tbl_areaSi(nsi, si) VALUES('S001','서울');
INSERT INTO tbl_areaSi(nsi, si) VALUES('G001','경기');
INSERT INTO tbl_areaSi(nsi, si) VALUES('B001','부산');

SELECT * FROM tbl_areaSi;

SELECT * FROM tbl_areaGu;

drop table tbl_areaGu;

INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('SG001','S001','강남구','서울');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('SG002','S001','서초구','서울');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('GG001','G001','용인시','경기');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('GG002','G001','김포시','경기');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('BG001','B001','해운대구','부산');
INSERT INTO tbl_areaGu(ngu, nsi, gu, si) VALUES('BG002','B001','동래구','부산');

SELECT ngu, gu FROM tbl_areaGu WHERE nsi = 'B001';

commit;

CREATE TABLE tbl_reserve(
	gu VARCHAR(50) NOT NULL,
	ngu VARCHAR(50) NOT NULL,
	nsi VARCHAR(50) NOT NULL,
	bno INT PRIMARY KEY auto_increment,	
    bname VARCHAR(100) NOT NULL,
	baddr LONGTEXT NOT NULL,
    bphone VARCHAR(100) NOT NULL,
    book char(1) default 'N',
    uno INT,
    cartype VARCHAR(100),
    si VARCHAR(50) NOT NULL
);

-- 로그인 회원 번호 , 예약한 회원 번호가 일치하고 book이 Y인 목록 찾아서 마이페이지에 띄우기.

-- 예약하기 버튼 클릭 시 DB에 등록/ 마이페이지에서 DB 불러오면 됨. 사용자 정보/ 차량 선택 / 지점 선택 정보 저장 /  

SELECT * FROM tbl_reserve;

commit;

drop table tbl_reserve;

INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('강남구','SG001','S001','압구정지점','서울특별시 강남구 압구정로 417','02-556-3933','서울');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('서초구','SG002','S001','남부지점','서울특별시 서초구 사평대로 334','02-2048-3017','서울');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('서초구','SG002','S001','남부2지점','서울특별시 서초구 양재대로 1161-19','02-522-5015','서울');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('용인시','GG001','G001','경기남부지점','경기도 용인시 기흥구 흥덕1로 13 타워동','031-370-1123','경기');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('용인시','GG001','G001','경기지점','경기도 용인시 기흥구 흥덕2로 87번길 18','031-206-0501','경기');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('김포시','GG002','G001','김포지점','경기도 김포시 양촌읍 김포대로 1763','031-989-5445','경기');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('해운대구','BG001','B001','해운대지점','부산광역시 해운대구 좌동순환로 503','051-747-7979','부산');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('동래구','BG002','B001','안락지점','부산광역시 동래구 충렬대로 302','051-531-6565','부산');
INSERT INTO tbl_reserve(gu,ngu, nsi,bname,baddr,bphone, si) VALUES('동래구','BG002','B001','명륜지점','부산광역시 동래구 명륜로 218-1','051-553-3373','부산');


commit;


SELECT * FROM tbl_reserve AS R NATURAL JOIN tbl_areaSi AS S WHERE si LIKE('%서울%') ORDER BY R.bname ASC; 

SELECT * FROM tbl_reserve AS R NATURAL JOIN tbl_areaGu AS G;

SELECT * FROM tbl_reserve AS R NATURAL JOIN tbl_areaGu AS G WHERE R.nsi = 'S001' LIMIT 0, 5;

SELECT * FROM tbl_reserve AS R NATURAL JOIN tbl_areaGu AS G WHERE R.ngu = 'SG002' LIMIT 0, 5;

SELECT * FROM tbl_reserve AS R NATURAL JOIN tbl_areaGu AS G WHERE R.nsi = 'S001' AND R.ngu = 'SG002' AND addr LIKE('%사평대로%') limit 0, 5;

SELECT * FROM tbl_reserve AS R NATURAL JOIN tbl_areaGu AS G WHERE R.nsi = 'S001' AND addr LIKE('%압구정%') limit 0, 5;


-- 회원번호랑 예약 정보 넘겨주기(차종, 지점)

SELECT * FROM tbl_reserve WHERE nsi = 'S001' AND bname LIKE('%압구정%');

CREATE TABLE tbl_car(
	cno INT PRIMARY KEY auto_increment,
	carType VARCHAR(100) NOT NULL,
    car LONGTEXT NOT NULL
);

INSERT INTO tbl_car(carType,car) VALUES('truck','뉴파워트럭');
INSERT INTO tbl_car(carType,car) VALUES('truck','엑시언트');
INSERT INTO tbl_car(carType,car) VALUES('truck','엑시언트 수소전기트럭');
INSERT INTO tbl_car(carType,car) VALUES('bus','쏠라티');
INSERT INTO tbl_car(carType,car) VALUES('bus','유니버스 모바일 오피스');
INSERT INTO tbl_car(carType,car) VALUES('bus','일렉시티 수소전기버스');

SELECT * FROM tbl_car;

drop table tbl_car;

commit;

DROP TABLE tbl_userIfm;

-- 예약 테이블
CREATE TABLE tbl_userIfm(
	uno INT PRIMARY KEY auto_increment,     -- 회원 번호
    uname VARCHAR(100) NOT NULL,            -- 회원 이름
    uphone VARCHAR(100) NOT NULL,           -- 회원 전화번호
    utext LONGTEXT,                        	-- 회원 신청내용(null이여도 됨.)
    car LONGTEXT NOT NULL,                  -- 차 이름
    bname VARCHAR(100) NOT NULL,            -- 지점 이름
    baddr VARCHAR(200) NOT NULL,            -- 지점 주소
    bphone VARCHAR(100) NOT NULL            -- 지점 전화번호    // 신청한 날짜 넣을까??
);

COMMIT;
SELECT * FROM tbl_userIfm;

-- VALUES(1,'id001','pw001','pw001','아이키','01012345678');
-- VALUES('트럭','엑시언트 수소전기트럭');
-- VALUES('동래구','BG002','B001','안락지점','부산광역시 동래구 충렬대로 302','051-531-6565','부산');
INSERT INTO tbl_userIfm 
VALUES(1,'아이키','01012345678','오후 6시에 방문 예정','엑시언트 수소전기트럭','안락지점','부산광역시 동래구 충렬대로 302','051-531-6565');



-- user

DROP table user_member;
DROP table user_member_auth;

CREATE TABLE user_member(
	u_no INT PRIMARY KEY auto_increment,
    u_id VARCHAR(100) NOT NULL UNIQUE,
    u_pw VARCHAR(200) NOT NULL,
    u_phone VARCHAR(20) NOT NULL,
    u_name VARCHAR(20) NOT NULL,
    u_birth VARCHAR(20) NOT NULL,
    u_withdraw char(1) DEFAULT 'n'
);

SELECT * FROM user_member;

-- 권한 테이블
CREATE TABLE user_member_auth(
	u_id VARCHAR(50) NOT NULL,
    u_auth VARCHAR(50) NOT NULL,
    CONSTRAINT fk_member_auth FOREIGN KEY(u_id)
    REFERENCES user_member(u_id)
);

select * from user_member_auth;

INSERT INTO user_member_auth(u_id,u_auth)
VALUES('id001','ROLE_MASTER');

INSERT INTO user_member_auth(u_id,u_auth)
VALUES('id001','ROLE_MEMBERSHIP');

SELECT user.*, u_auth FROM 
user_member AS user
LEFT OUTER JOIN 
user_member_auth AS mauth 
on user.u_id = mauth.u_id
WHERE user.u_id = 'id001' 
AND u_withdraw = 'n';

SELECT user.*, u_auth FROM 
user_member AS user
LEFT OUTER JOIN 
user_member_auth AS mauth 
on user.u_id = mauth.u_id
WHERE user.u_id = 'id002' 
AND u_withdraw = 'n';



commit;


