
DROP TABLE products CASCADE CONSTRAINTS;
DROP TABLE order_lists CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE article CASCADE CONSTRAINTS;

---------------- SEQ 시퀀스 ----------------

CREATE SEQUENCE products_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE order_lists_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE orders_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE admin_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE review_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE board_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE users_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE comments_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE article_seq
START WITH 100
INCREMENT BY 1;



select *
from user_sequences;

drop SEQUENCE products_seq;
drop sequence order_lists_seq;
drop sequence orders_seq;
drop sequence admin_seq;
drop sequence review_seq;
drop sequence board_seq;
drop sequence users_seq;
drop sequence comments_seq;
drop sequence article_seq;



DROP TABLE products;


CREATE TABLE products (
	product_id NUMBER(10)		NOT NULL,
	product_type VARCHAR2(100)	NULL,
	product_date DATE	NOT NULL,
	price	NUMBER(10) NOT NULL,
	brief VARCHAR2(400)	NOT NULL,
	product_img VARCHAR2(1000)	NOT NULL,
	product_name VARCHAR2(200)	NOT NULL,
	product_status CHAR(1)	NOT NULL,
	product_servings VARCHAR2(10),
	product_cookingtime VARCHAR2(30)
);


ALTER TABLE products
	ADD(
		CONSTRAINT PK_PRODUCT_ID PRIMARY KEY (product_id),
		CONSTRAINT product_status_ck CHECK(product_status IN('Y','N'))
);


INSERT INTO products (
            product_id,
            product_type,
            product_date,
            price, 
						brief,
            product_img, 
            product_name, 
            Product_status,
						product_servings,
						product_cookingtime
)
VALUES(products_seq.nextval,'냉장',TO_DATE('2024-03-14', 'YYYY-MM-DD'),11900,'통통한 미트볼과 방울토마토가 한가득','/img/prod109.jpg','[냉장]미트볼 토마토 파스타','Y', '2인분', '20분');

select *
from user_sequences;

--ORDERS (주문고객정보)
DROP TABLE orders;

CREATE TABLE orders (
	order_id NUMBER(10)	NOT NULL,
	user_id	VARCHAR2(100) NOT NULL,
	order_date DATE	NOT NULL,
	destination_name VARCHAR2(100)	NOT NULL,
	destination_zip_code	VARCHAR2(10) NOT NULL,
	destination_address VARCHAR2(500)	NOT NULL,
	destination_phonenumber	VARCHAR2(20) NOT NULL,
	payment	CHAR(4) NOT NULL,
	delivery_charge	NUMBER(10) NOT NULL,
	total_amount	NUMBER(10) NOT NULL
);

-- USERS (회원 정보)
DROP TABLE users;

CREATE TABLE users (
	user_id	VARCHAR2(50) NOT NULL,
	passwd	VARCHAR2(50) NOT NULL,
	user_name	VARCHAR2(50) NOT NULL,
	email	VARCHAR2(50) NOT NULL,
	phonenumber VARCHAR2(20) 	NOT NULL,
	zip_code VARCHAR2(10)	NOT NULL,
	user_address VARCHAR2(500)	NOT NULL,
	regdate	DATE NOT NULL,
	grade_rating	VARCHAR2(10) NOT NULL
);

ALTER TABLE users
	ADD(
		CONSTRAINT PK_USERS PRIMARY KEY (user_id),
		CONSTRAINT grade_rating_ck CHECK(grade_rating IN ('VVIP', 'VIP', 'GENERAL'))
);


INSERT INTO users(
            user_id,
            passwd,
            user_name,
            email,
            phonenumber,
            zip_code,
            user_address,
            regdate,
            grade_rating
)
VALUES('chan999', 12345, '김찬규', 'chan999@naver.com', 010-1234-4567, 01695,'서울특별시 노원구 동일로 1414',TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'VVIP');




ALTER TABLE orders
	ADD(
		CONSTRAINT PK_ORDERS PRIMARY KEY (order_id),
		CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES users (user_id),
		CONSTRAINT payment CHECK(payment IN ('CARD', 'CASH'))
);


INSERT INTO orders (
            order_id,
            user_id,
            order_date,
            destination_name,
            destination_zip_code,
            destination_address,
            destination_phonenumber,
            payment,
            delivery_charge,
            total_amount
)
VALUES(orders_seq.nextval ,'chan999',TO_DATE('2024-04-09', 'YYYY-MM-DD'),'김찬규', 01695, '서울시 노원구', 010-1234-4567, 'CARD', 3000, 33000 );




-- ORDER_LISTS (주문목록)

DROP TABLE order_lists;

CREATE TABLE order_lists (
	orderdetail_id	NUMBER(10) NOT NULL,
	order_id	NUMBER(10) NOT NULL,
	order_volume	NUMBER(10) NULL,
	product_id  NUMBER(10) NOT NULL
);

ALTER TABLE order_lists
	ADD(
		CONSTRAINT PK_orderdetail_id PRIMARY KEY (orderdetail_id) ,
		CONSTRAINT product_id_fk FOREIGN KEY (product_id)  REFERENCES products (product_id),
		CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES orders (order_id)
);


INSERT INTO order_lists (
            orderdetail_id,
						order_id,
            product_id,
            order_volume
)
VALUES(order_lists_seq.nextval,100,100,1);

select *
from PRODUCTS;


-- ARTICLE (게시글 작성)
DROP TABLE article;

CREATE TABLE article (
	article_id	NUMBER(10) NOT NULL,
	subject	VARCHAR2(100) NOT NULL,
	content	VARCHAR2(2000) NOT NULL,
	regdate	DATE DEFAULT SYSDATE,
	hitcount	NUMBER(10) NULL,
	passwd	VARCHAR2(50) NULL,
	attach_file	VARCHAR2(100) NULL,
	group_no	NUMBER(10) DEFAULT 0,
	level_no	NUMBER(10) DEFAULT 0,
	order_no	NUMBER(10) DEFAULT 0,
	board_id	NUMBER(10) NOT NULL,
	user_id	 VARCHAR2(10) NOT NULL,
	admin_no	VARCHAR2(10) NOT NULL
);

ALTER TABLE article MODIFY attach_file NULL;
ALTER TABLE article MODIFY admin_no NULL;
ALTER TABLE article MODIFY passwd Default '0000';

SELecT *
FROM article;

-- ADMIN (관리자)
DROP TABLE admin;

CREATE TABLE admin (
	admin_no	VARCHAR2(50) NOT NULL,
	admin_id	VARCHAR2(50) NOT NULL,
	admin_passwd	VARCHAR2(50) NOT NULL,
	admin_name	VARCHAR2(50) NOT NULL,
	authorization	CHAR(1) NOT NULL
);

ALTER TABLE admin
	ADD(
		CONSTRAINT PK_ADMIN PRIMARY KEY (admin_no),
		CONSTRAINT authorization_ck CHECK(authorization IN ('S', 'M', 'I'))
);


INSERT INTO admin(
            admin_no,
            admin_id,
            admin_passwd,
            admin_name,
            authorization
)
VALUES(1,'BBBBB', 12345, '김철수', 'S');

-- BOARD (게시판)

DROP TABLE board;

CREATE TABLE board (
	board_id	NUMBER(10) NOT NULL,
	category	NUMBER(10) NOT NULL,
	board_title	VARCHAR2(100) NOT NULL,
	descriptions	VARCHAR2(200) NOT NULL
);

ALTER TABLE board
	ADD(
		CONSTRAINT PK_BOARD PRIMARY KEY (board_id)
);

INSERT INTO board(
            board_id,
            category,
            board_title,
            descriptions
)
VALUES(board_seq.nextval,100,'밀리소식','밀리터리에 궁금한 내용을 문의해보세요!');



ALTER TABLE article
	ADD(
		CONSTRAINT article_id_pk PRIMARY KEY (article_id),
		CONSTRAINT board_id_fk FOREIGN KEY (board_id) REFERENCES board (board_id),
		CONSTRAINT article_user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id),
		CONSTRAINT admin_no_fk FOREIGN KEY (admin_no) REFERENCES admin(admin_no)
);


INSERT INTO article (
            article_id,
            subject,
            content,
            regdate,
            hitcount,
            passwd,
            attach_file,
            group_no,
            level_no,
            order_no,
            board_id,
            user_id,
            admin_no
)
VALUES (ARTICLE_SEQ.nextval, '테스트', '테스트합니다', TO_DATE('2024-04-11', 'YYYY-MM-DD'),10, 1234, '첨부', 0, 0, 0, 100, 'chan999', 1);

select *
from board;

-- REVIEW (리뷰)
DROP TABLE review;

CREATE TABLE review (
	review_id	NUMBER(10) NOT NULL,
	subject	VARCHAR2(100) NOT NULL,
	content VARCHAR2(2000)	NOT NULL,
	regdate	DATE Default SYSDATE,
	attach_file	VARCHAR2(100) NULL,
	order_no	NUMBER(10) Default '0',
	order_id	NUMBER(10) NOT NULL,
	user_id	VARCHAR2(10) NOT NULL,
	board_id	NUMBER(10) Default '100',
	product_id	NUMBER(10) NOT NULL
);

ALTER TABLE review
	ADD(
		CONSTRAINT PK_REVIEW PRIMARY KEY (review_id),
		CONSTRAINT review_user_id_fk FOREIGN KEY (user_id) REFERENCES users (user_id),
		CONSTRAINT review_board_id_fk FOREIGN KEY (board_id) REFERENCES board (board_id),
		CONSTRAINT review_product_id_fk FOREIGN KEY (product_id) REFERENCES products (product_id)
);



INSERT INTO review (
            review_id,
            subject,
            content,
            regdate,
            attach_file,
            order_no,
            order_id,
            user_id,
            board_id,
            product_id
)
VALUES(review_seq.nextval,'리뷰제목','리뷰내용', TO_DATE('2024-04-11', 'YYYY-MM-DD'),'첨부파일', 1 , 1234, 'chan999', 100, 100);



select *
from products;

DROP TABLE comments;

CREATE TABLE comments (
	comment_no	NUMBER(10) NOT NULL,
	comments	 VARCHAR2(2000) NOT NULL,
	article_id	NUMBER(10) NOT NULL,
	user_id VARCHAR2(10)	NOT NULL
);


ALTER TABLE comments
	ADD(
		CONSTRAINT PK_COMMENT PRIMARY KEY (comment_no),
		CONSTRAINT comments_article_id_fk FOREIGN KEY (article_id) REFERENCES article(article_id),
		CONSTRAINT comments_user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- comments (댓글)
INSERT INTO comments(
            comment_no,
            comments,
            article_id,
            user_id
)
VALUES(comments_seq.nextval, '댓글내용', 100, 'chan999');


select *
from article;

commit;



INSERT INTO products (
            product_id,
            product_type,
            product_date,
            price, 
						brief,
            product_img, 
            product_name, 
            Product_status,
						product_servings,
						product_cookingtime
)
VALUES(products_seq.nextval,'냉동',TO_DATE('2024-04-09', 'YYYY-MM-DD'),16980,'마늘 풍미 가득 얼큰한 국물','/img/prod103.jpg','[냉동]얼큰버섯 소고기 샤브샤브 칼국수','Y', '2~3인분', '15분');

---------------------------------------------------------------
INSERT INTO products (
            product_id,
            product_type,
            product_date,
            price, 
						brief,
            product_img, 
            product_name, 
            Product_status,
						product_servings,
						product_cookingtime
)
VALUES(products_seq.nextval,'냉동',TO_DATE('2024-04-08', 'YYYY-MM-DD'),10500,'탱글탱글한 쭈꾸미와 쫄깃한 떡이 듬뿍!','/img/prod104.jpg','[냉동]쫄깃탱글 불쭈꾸미 볶음','Y', '1~2인분', '5분');


INSERT INTO products (
            product_id,
            product_type,
            product_date,
            price, 
						brief,
            product_img, 
            product_name, 
            Product_status,
						product_servings,
						product_cookingtime
)
VALUES(products_seq.nextval,'냉장',TO_DATE('2024-04-07', 'YYYY-MM-DD'),19900,'향긋한 달래로 맛을 낸 봄내음 가득','/img/prod105.jpg','[냉장]달래된장 전골','Y', '3인분', '15분');


INSERT INTO products (
            product_id,
            product_type,
            product_date,
            price, 
						brief,
            product_img, 
            product_name, 
            Product_status,
						product_servings,
						product_cookingtime
)
VALUES(products_seq.nextval,'냉장',TO_DATE('2024-04-10', 'YYYY-MM-DD'),16000,'프리미엄 후랑크와 노릇한 버섯구이','/img/prod106.jpg','[냉장]육공육 캠핑모둠후랑크','Y', '3~4인분', '9분');


INSERT INTO products (
            product_id,
            product_type,
            product_date,
            price, 
						brief,
            product_img, 
            product_name, 
            Product_status,
						product_servings,
						product_cookingtime
)
VALUES(products_seq.nextval,'냉장',TO_DATE('2024-04-10', 'YYYY-MM-DD'),11300,'통삼겹 바베큐와 매콤한 로제소스','/img/prod107.jpg','[냉장]통삼겹 로제 파스타','Y', '2인분', '30분');


INSERT INTO products (
            product_id,
            product_type,
            product_date,
            price, 
						brief,
            product_img, 
            product_name, 
            Product_status,
						product_servings,
						product_cookingtime
)
VALUES(products_seq.nextval,'냉동',TO_DATE('2024-04-11', 'YYYY-MM-DD'),12800,'퓨전 중식 레스토랑 맛 그대로!','/img/prod108.jpg','[냉동]꽈리고추 블랙페퍼치킨','Y', '2인분', '30분');


delete from PRODUCTS
WHERE PRODUCT_ID = 107;

UPDATE PRODUCTS 
SET product_img = '/img/prod109.jpg'
WHERE PRODUCTS.PRODUCT_ID=101;

SELect *
From PRODUCTS;

COMMIT;
ROLLBACK;



SELECT product_id, product_type, product_date, TO_CHAR(price, 'FM999,999') price, brief, product_img, product_name, product_status, product_servings, product_cookingtime
FROM PRODUCTS
WHERE product_id = 101;
