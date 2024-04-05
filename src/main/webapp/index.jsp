<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 1조 쇼핑몰 프로젝트</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=IBM+Plex+Sans+KR&family=Nanum+Gothic&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="/css/index.css">
</head>

<body>
<!-- 헤더 시작 -->
<header>
  <div id="head-line">
    <div class="header-wrap">
      <ul>
          <li ><a href="/member/register.jsp">회원가입 </a></li>
          <li ><a href="/member/login.jsp"><span> ㅣ </span>로그인 </a></li>
          <li ><a href=""><span> ㅣ </span>고객센터</a></li>
      </ul>
    </div>
  </div>
</header>
<!-- 헤더 종료 -->

<div id="wrapper">
  <!-- 메인 시작 -->
  <main>
    <!-- Nav 시작 -->
    <div class="navi">
      <div class="nav-wrap">
      <div class="nav-logo">
        <a href="">로고</a>
      </div>
      <div class="nav-list">
      <ul>
        <li class="nav-list-text">
          <a href="">베스트</a>
        </li>
        <li class="nav-list-text">
          <a href="">신메뉴</a>
        </li>
        <li class="nav-list-text">
          <a href="">테스트</a>
        </li>
        <li class="nav-list-text">
          <a href="">테스트</a>
        </li>
        <li class="nav-list-text">
          <a href="">테스트</a>
        </li>
      </ul>
      </div>
      <div>
        <a>장바구니</a>
      </div>
      </div>
      <div class="nav-banner">
        <a href=""></a>
      </div>
      </div>
    <!-- Nav 종료 -->

    <!-- 메인 시작 -->
    <div id="container">
      <!-- aside 시작 -->

      <!-- aside 종료 -->

      <section id="section">
        <div id="index-wrap">
          <div class="product-list">
              <ul>
                <li>
                  <div>
                    <div class="product-img" style="background-image: url(/img/productEx.jpg); background-size: cover; " ></div>
                    <div><a href="">[피코크] 어메이징 부대찌개</a></div>
                    <div><span class="prgoduct-price">19,900</span> 9,900</div>
                  </div>
                </li>
              </ul>
          </div>
        </div>
      </section>
    </div>
  </main>
  <!-- 메인 종료 -->

  <!-- footer 시작 -->
  <footer>
    <div id="footer">
      <p>방문해주셔서 감사합니다. 이 곳은 chan999의 개발자 성장과정을 담은 페이지입니다.</p>
      <p>아직 페이지에 부족한 점이 많습니다. 자유게시판에 요청 기능을 넣어주시면, 최대한 반영해보겠습니다 :)</p>
    </div>
  </footer>
  <!-- footer 종료 -->
</div>
</body>

</html>