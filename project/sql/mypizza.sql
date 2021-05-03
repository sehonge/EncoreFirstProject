/*
04.27 수정사항
1. MENU 테이블에 PICTURE_URL 컬럼 추가(음식 이미지 상대경로 저장)
2. 컬럼 추가에 따른 INSERT문 수정
*/
​
###################################################################
/* pizza라는 스키마 생성*/
CREATE SCHEMA PIZZA;
​
/*pizza 스키마 사용*/
USE PIZZA;
​
############################ 테이블 생성 ##########################
​
CREATE TABLE CUSTOMER (
CUST_ID VARCHAR(20) NOT NULL,
CUST_PW VARCHAR(20) NOT NULL,
CUST_NAME VARCHAR(10) NOT NULL,
CUST_ADDR VARCHAR(100) NOT NULL,
CUST_CONTACT VARCHAR(15) NOT NULL,
CUST_EMAIL VARCHAR(50) NOT NULL,
CUST_TOTAL_PRICE INT NULL,
PRIMARY KEY (CUST_ID)
);
​
CREATE TABLE SHOP (
SHOP_ID int NOT NULL AUTO_INCREMENT,
SHOP_NAME VARCHAR(20) NOT NULL,
SHOP_ADDR VARCHAR(100) NOT NULL,
SHOP_CONTACT VARCHAR(15) NOT NULL,
PRIMARY KEY (SHOP_ID)
);
​
CREATE TABLE MENU(
MENU_ID VARCHAR(10) NOT NULL,
MENU_TYPE INT NOT NULL, # 피자 : 1, 사이드 : 2, 토핑 : 3 
MENU_NAME varchar(20) NOT NULL,
MENU_PRICE INT NOT NULL,
MENU_SIZE varchar(2) NULL,
MENU_DESC VARCHAR(200) NULL,
PICTURE_URL varchar(30) NOT NULL,
primary key (MENU_ID)
);
​
CREATE TABLE TB_ORDER(
ORDER_ID int NOT NULL AUTO_INCREMENT,
CUST_ID VARCHAR(20) NOT NULL,
SHOP_ID int NOT NULL,
ORDER_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
ORDER_ADDR VARCHAR(100) NOT NULL,
ORDER_PRICE int NOT NULL,
primary KEY (ORDER_ID),
foreign key (CUST_ID) references CUSTOMER(CUST_ID) ON DELETE cascade,
foreign key (SHOP_ID) references SHOP(SHOP_ID) ON DELETE  cascade,
foreign key (ORDER_ADDR) references ADDRESS(ORDER_ADDR) ON DELETE  cascade
);
​
CREATE TABLE ORDER_DESC(
ORDER_ID int NOT NULL,
MENU_ID VARCHAR(10) NOT NULL,
NUM INT NOT NULL,
foreign key (ORDER_ID) references TB_ORDER(ORDER_ID) ON DELETE cascade,
foreign key (MENU_ID) references MENU(MENU_ID) ON DELETE  cascade
);

CREATE TABLE ADDRESS(
ORDER_ADDR VARCHAR(100) NOT NULL,
CUST_ID VARCHAR(20) NOT NULL,
primary KEY (ORDER_ADDR),
foreign key (CUST_ID) references CUSTOMER(CUST_ID) ON DELETE cascade
);
​
​
############### 데이터 삽입 ################
# 1. 회원정보
INSERT INTO CUSTOMER (CUST_ID, CUST_PW, CUST_NAME, CUST_ADDR, CUST_CONTACT, CUST_EMAIL, CUST_TOTAL_PRICE) 
				VALUES('encore', '1234', 'James', '서울시', '010-1234-1234', 'encore@gmail.com', 10000);
INSERT INTO CUSTOMER (CUST_ID, CUST_PW, CUST_NAME, CUST_ADDR, CUST_CONTACT, CUST_EMAIL, CUST_TOTAL_PRICE) 
				VALUES('play', '1234', 'Tom', '경기도', '010-3333-1234', 'play@gmail.com', 50000);
INSERT INTO CUSTOMER (CUST_ID, CUST_PW, CUST_NAME, CUST_ADDR, CUST_CONTACT, CUST_EMAIL) 
				VALUES('date', '1234', 'jack', '경기도', '010-3333-5555', 'data@gmail.com');
                
           
# 2. 가게정보          
INSERT INTO SHOP (SHOP_NAME, SHOP_ADDR, SHOP_CONTACT) 
			VALUES('마포점', '서울시 마포구', '02-123-2333'); 
INSERT INTO SHOP (SHOP_NAME, SHOP_ADDR, SHOP_CONTACT) 
			VALUES('강남1호점', '서울시 강남구', '02-333-2222');
            
# 3. 메뉴
​
## 피자 추가
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P001-R', 1, '트러플 피자', '15000', 'R', '#바질페스토로 즐기는 스테이크의 진한 풍미!', "Menu/img/pizza_trouple.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P001-L', 1, '트러플 피자', '20000', 'L', '#바질페스토로 즐기는 스테이크의 진한 풍미!', "Menu/img/pizza_trouple.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P002-R', 1, '스테이크 피자', '18000', 'R', '#직화 스테이크와 통새우의 만남', "Menu/img/pizza_stake.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P002-L', 1, '스테이크 피자', '25000', 'L', '#직화 스테이크와 통새우의 만남', "Menu/img/pizza_stake.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P003-R', 1, '칠리크랩 피자', '17000', 'R', '#씨푸드부터 시리얼까지 언더더씨!', "Menu/img/pizza_chilicrab.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P003-L', 1, '칠리크랩 피자', '24000', 'L', '#씨푸드부터 시리얼까지 언더더씨!', "Menu/img/pizza_chilicrab.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P004-R', 1, '블랙킹 피자', '17000', 'R', '#새로운 레전드를 세우다', "Menu/img/pizza_blackking.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P004-L', 1, '블랙킹 피자', '24000', 'L', '#새로운 레전드를 세우다', "Menu/img/pizza_blackking.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P005-R', 1, '글로벌4 피자', '17000', 'R', '#한국,미국,호주,프랑스! 레전드의 만남', "Menu/img/pizza_global4.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P005-L', 1, '글로벌4 피자', '24000', 'L', '#한국,미국,호주,프랑스! 레전드의 만남', "Menu/img/pizza_global4.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P006-R', 1, '스타셰프 피자', '18000', 'R', '#드라이에이징 스테이크와 크림 소스의 조화!', "Menu/img/pizza_starchef.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P006-L', 1, '스타셰프 피자', '25000', 'L', '#드라이에이징 스테이크와 크림 소스의 조화!', "Menu/img/pizza_starchef.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P007-R', 1, '블랙 타이거 쉬림프 피자', '18000', 'R', '#바다와 육지의 대왕이 하나로', "Menu/img/pizza_blacktiger.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_SIZE, MENU_DESC, PICTURE_URL) 
			VALUES('P007-L', 1, '블랙 타이거 쉬림프 피자', '25000', 'L', '#바다와 육지의 대왕이 하나로', "Menu/img/pizza_blacktiger.jpg");
			
## 사이드 추가
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('S001', 2, '크림 스파게티', '2000',  '콜라 1.5L 입니다.', "Menu/img/cream_spaghetti.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('S002', 2, '토마토 스파게티', '5000', '토마토 파스타 입니다.', "Menu/img/tomato_spaghetti.jpg");    
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('S003', 2, '갈릭 윙', '5500', '갈릭 윙 입니다.', "Menu/img/garlic_wing.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('S004', 2, '콜라', '2000', '시원한 코카콜라 입니다.', "Menu/img/coke.jpg");
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('S005', 2, '사이다', '2000', '시원한 사이다 입니다.', "Menu/img/cider.jpg");
​
## 토핑 추가
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('T001', 3, '새우 토핑', '2000',  '새우 토핑 입니다.', "Menu/img/shrimp.jpg"); 
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('T002', 3, '옥수수 토핑', '2000', '옥수수 토핑 입니다.', "Menu/img/corn.jpg");    
INSERT INTO MENU (MENU_ID, MENU_TYPE, MENU_NAME, MENU_PRICE, MENU_DESC, PICTURE_URL) 
			VALUES('T003', 3, '베이컨 토핑', '2000', '베이컨 토핑 입니다.', "Menu/img/bacon.jpg");  
		