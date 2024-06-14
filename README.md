# 🥗🥪 밀키트 쇼핑몰 "밀리미터" 프로젝트 


### 작은차이에서 생기는 차별화된 밀키트 쇼핑몰 프로젝트 입니다.
쇼핑몰
</br>
</br>

 # 📃 프로젝트 정보
![후반전로고](https://github.com/beetnalhee/project_secondHalf/assets/151362604/1e685c84-4af4-4709-8588-57035c85c3d8)
 
> 1. 제작기간 : 2024.04.08 ~ 04.16.
> 2. 참여인원 2명
> 3. 개발한 부분 : DB구축, 게시판 리뷰작성 기능, 디자인 
</br>

# 📚 개발환경 및 사용기술

> * Development Environment</br>
> IntelliJ</br>
> VsCode</br>

> * Back-end : </br>
> Spring</br>
> SpringBoot</br>
> Juint</br>
> MyBatis<br />

> * Front-end : </br>
> HTML</br>
> CSS</br>
> JavaScript</br>
> React</br>
> KakaomapAPI</br>

> * DBMS :</br>
> Oracle<br />


<br />

# 📊 ERD & Structure
<details>
<summary>ERD</summary>
<div markdown="1">

<img src="https://github.com/beetnalhee/project_secondHalf/assets/151362604/98e01b43-01ff-4fc5-a91d-41c291b568ec" width="600" height="400"/></br>

</div>
</details>

<details>
<summary>Structure</summary>
<div markdown="1">

<img src="https://github.com/beetnalhee/project_secondHalf/assets/151362604/07f6fe74-5d69-45be-b1c1-8a3eefd2a913" width="600" height="350"/></br>

</div>
</details>

<details>
<summary>도메인 모델</summary>
<div markdown="1">

<img src="https://github.com/beetnalhee/project_secondHalf/assets/151362604/9aef6bc1-b82c-4dc4-996b-f925b088ae38" width="600" height="400"/></br>


</div>
</details>

# 🔑 핵심기능

### 1. 우리동네 
> * 노원구 주변 산책로, 병원, 노인정, 복지관 등 고령층의 편의를 위한 지도 서비스
> * 카카오 맵 open api를 활용한 지도 출력,지도 정보를 json으로 수신 및 출력
> * open api 내 정보를 mapDto에 담고, mapDto 객체를 model에 추가하여 장소 상세정보 출력
> * 장소 DB추가 및 리뷰 작성 기능</br>
> * [코드보기](https://github.com/beetnalhee/project_secondHalf/blob/main/src/main/java/com/ezen/springmvc/web/map/controller/MapController.java)
</br>

### 2. 일상공유 
> * 고령층을 위한 쉬운 인스타그램 
> * 태그, 검색어 유무에 따른 리스트 결과 출력,게시글 memberId를 통한 writer 정보 출력
> * categoryId, dailyArticleId를 통해 게시글 상세 출력
> * 좋아요, 다중파일 업로드 및 미리보기 기능
> * 프로필 클릭하면 1:1 대화하기 기능으로 연결</br>
> * [코드보기](https://github.com/beetnalhee/project_secondHalf/blob/main/src/main/java/com/ezen/springmvc/web/daily/controller/DailyController.java)
</br>

### 3. 동네친구
> * 동네 어르신들이 온/오프라인으로 만날 수 있는 소모임 기능
> * 짝궁, 취미, 건강 기타 카테고리중 선택하여 게시글 작성
> * 게시글 생성 시, MEET_ROOM 생성되고 참여하기 버튼 클릭 시 memberId를 해당 게시글에 추가하여 모임 참여자 명단을 LIST로 출력
> * 짝꿍 카테고리를 통해 1:1 대화창으로 이동</br>
> *  [코드보기](https://github.com/beetnalhee/project_secondHalf/blob/main/src/main/java/com/ezen/springmvc/web/meet/controller/MeetController.java)
</br>

### 4. 대화하기(채팅) 
> * 일상공유게시물을 통한 대화 또는 동네친구에서 짝꿍 카테고리를 통한 채팅기능
> * WebSocket을 활용한 양방향 서버통신
> * 접속 시, roomId에 대한 subscribe로 지속적인 메세지 수신 가능
> * 수신한 메세지를 DB에 저장, 채팅화면에 DOM처리</br>
> *  [코드보기](https://github.com/beetnalhee/project_secondHalf/blob/main/src/main/java/com/ezen/springmvc/web/chat/controller/ChatRoomController.java)
</br>

### 5. 회원관리 
> * 회원관리용 관리자 모드 
> * 등록한 이메일로 임시비밀번호 전송 및 DB변경 기능
> * 회원정보 업데이트(닉네임,대표사진)
> *  [코드보기](https://github.com/beetnalhee/project_secondHalf/blob/main/src/main/java/com/ezen/springmvc/web/member/controller/MemberController.java)
</br>


# 📘 자료
> [후반전_파이널 프로젝트 결과보고서](https://github.com/user-attachments/files/15816163/_._.pdf)



