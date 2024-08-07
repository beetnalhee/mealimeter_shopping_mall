# 🥗🥪 밀키트 쇼핑몰 "밀리미터"  


### 비슷한 밀키트 시장에서, 작은 차이로 차별화한 밀키트 쇼핑몰 프로젝트 입니다.
이 프로젝트는 밀키트 전문 쇼핑몰 '밀리미터'를 개발한 포트폴리오입니다. </br>
Java를 기반으로 한 **MVC(Model 1) 아키텍처**를 활용하여 개발하였으며, 서버 측 로직과 클라이언트 측 화면을 효과적으로 분리하여 설계했습니다.</br>

이 프로젝트는 사용자 경험을 최우선으로 고려하여 사용자 인터페이스(UI) 및 사용자 경험(UX)을 직접 디자인하였습니다.
각 기능은 효율적이고 안정적으로 작동하도록 설계되어, 실제 쇼핑몰 운영에 필요한 다양한 요구사항을 충족할 수 있도록 구현되었습니다.

</br>


 # 📃 프로젝트 정보

<img src="https://github.com/beetnalhee/mealimeter_shopping_mall/assets/151362604/b1647627-e132-4ddc-8e4d-947b76de83d3" width="600" height="330"/></br>

> 1. 제작기간 : 2024.04.08 ~ 04.16.
> 2. 참여인원 : 2명
> 3. 개발한 부분 : DB구축, 게시판 리뷰작성 기능, 화면 디자인 
</br>

# 📚 개발환경 및 사용기술

> * Development Environment</br>
> IntelliJ</br>
> VSCode</br>

> * Back-end : </br>
> Java</br>
> ApacheTomcat<br />
> JSP<br />
> Maven</br>

> * Front-end : </br>
> HTML</br>
> CSS</br>
> JavaScript</br>

> * DBMS :</br>
> Oracle<br />


<br />

# 📊 ERD & Structure
<details>
<summary>ERD</summary>
<div markdown="1">

<img src="https://github.com/beetnalhee/mealimeter_shopping_mall/assets/151362604/57117f5a-7658-4c8f-9a0e-3a2f2045dbcd" width="800" height="600"/></br>

</div>
</details>


# 🔑 주요기능

### 1. 회원가입, 로그인
> * 쇼핑몰 회원가입 및 로그인 기능
> * JDBC를 사용한 데이터베이스 연동(Oracle)
> * memberDao를 통해 회원정보에 access, 쿼리문 insert
> * 비회원일 경우 주문시에는 로그인 화면으로 redirect </br>
> * [코드보기](https://github.com/beetnalhee/mealimeter_shopping_mall/tree/main/src/main/java/com/ezen/mall/domain/member)
</br>

### 2. 제품정보 
> * 쇼핑몰 제품 리스트 게시 및, 상세보기
> * 쿼리문을 활용해 DB에서 product_id, product_type 등 출력하여 화면에 출력
> * prodId를 통해 제품 상세 정보 출력
> * JavaScript로 수량증감 함수 생성하여 동적으로 제품수량 변경시 변동되는 가격 실시간으로 반영</br>
> * [코드보기](https://github.com/beetnalhee/mealimeter_shopping_mall/tree/main/src/main/java/com/ezen/mall/domain/product)
</br>

### 3. 장바구니
> * ProdId, quantity 를 parameter로 받아 Product객체와 quantity를 CartList객체에 저장
> * 기존 장바구니 상품 여부에따라 CartList를 새로생성하거나 기존 CartList에 추가
> * session에 있는 CartList를 foreach를 통해 장바구니 리스트 동적 생성
> * 장바구니 리스트에 있는 수량 버튼마다 foreach의 varStatus옵션을 통해 버튼 별 index매칭 후 plus, minus 기능 구현</br>
> *  [코드보기](https://github.com/beetnalhee/mealimeter_shopping_mall/tree/main/src/main/java/com/ezen/mall/domain/cart)
</br>

### 4. 리뷰게시판
> * 제품 리뷰 게시판
> * 비회원은 조회만 가능하며, 리뷰등록은 회원만 가능
> * foreach의 varStatus옵션을 통해 리뷰할 상품을 선택
> * createReview dto로 DB에 리뷰를 저장하고 findreviewByAll dto로 저장된 리뷰를 화면에 출력</br>
> *  [코드보기](https://github.com/beetnalhee/mealimeter_shopping_mall/tree/main/src/main/java/com/ezen/mall/domain/review)
</br>

### 5. 핫딜, 베스트셀러 제품 보기
> * 쇼핑몰 제품 리스트 게시 및, 상세보기
> * 할인률 큰 순으로 정렬 및 제품 유통기한 짧은 순으로 정렬하는 쿼리문을 활용


# ⏳ 개발 후기
> [아쉬운점 & 개선점](https://www.notion.so/609028431e0343e29a17ddefd98098c2?pvs=4) 

# 📘 자료
> [밀리미터 프로젝트.pdf](https://github.com/user-attachments/files/15862822/default.pdf)




