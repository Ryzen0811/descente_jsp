<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상품 목록</title>

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>

    <!-- CSS 파일 링크 -->
    <link rel="stylesheet" href="css/common.css" />
    <link rel="stylesheet" href="css/main.css" />

    <script type="text/javascript" src="script/main.js"></script>
  </head>
  <body>
    <div id="header">
      <!-- 로고 영역 -->
        <div id="logo">
            <a href="index.jsp"><img src="img/logo.jpg" alt="로고"></a>
        </div>

        <!-- 로그인 영역 -->
        <div id="login">
            <span>
            	<c:choose>
            		<c:when test="${empty loginUser.username}">
            			<a href="desc_login">로그인</a>
            		</c:when>
            	
            		<c:otherwise>
						<a href="desc_update">${loginUser.username} 님</a>
            		</c:otherwise>
            	</c:choose>
            </span>
        
            <span>
 				<c:choose>
        			<c:when test="${not empty loginUser.username}">
            			<a href="desc_logout">로그아웃</a>
        			</c:when>
        
        			<c:otherwise>
            			<a href="desc_join">회원가입</a>
        			</c:otherwise>
    			</c:choose>
			</span>
			
			<span>
            	<c:choose>
            		<c:when test="${not empty loginUser.username}">
            			<a href="board.jsp">게시판</a>
            		</c:when>
            		
            		<c:otherwise>
						<a href="desc_login" onclick="alert('로그인 후 이용이 가능합니다.')">게시판</a>
						<script>
						
					</script>
            		</c:otherwise>
            	</c:choose>
            </span>
        </div>

      <nav>
        <ul>
          <li><a href="#">MEN</a></li>
          <li><a href="#">WOMEN</a></li>
          <li><a href="#">JUNIOR</a></li>
          <li><a href="#">SHOES</a></li>
          <li><a href="#">ACC</a></li>
          <li><a href="#">기획전</a></li>
          <li><a href="#">코디네이션</a></li>
          <li><a href="#">우먼스 셋업</a></li>
          <li><a href="#">ICY쿨링아이템</a></li>
        </ul>
      </nav>
    </div>

    <!-- 슬라이드 영역 -->
    <div id="slider">
      <ul class="slidelist">
        <li>
          <a><img src="./img/slide/slide1.jpg" alt="슬라이드 1" /></a>
        </li>
        <li>
          <a><img src="./img/slide/slide2.jpg" alt="슬라이드 2" /></a>
        </li>
        <li>
          <a><img src="./img/slide/slide3.jpg" alt="슬라이드 3" /></a>
        </li>
        <li>
          <a><img src="./img/slide/slide4.jpg" alt="슬라이드 4" /></a>
        </li>
        <li>
          <a><img src="./img/slide/slide5.jpg" alt="슬라이드 5" /></a>
        </li>
        <li>
          <a><img src="./img/slide/slide6.jpg" alt="슬라이드 6" /></a>
        </li>
      </ul>
      <span class="prev">&lt;</span>
      <span class="next">&gt;</span>
    </div>

    <main>
      <section>
        <article>
          <h1>SHOES</h1>
          <div class="box"></div>
          <div class="box"></div>
          <div class="box"></div>
          <div class="box"></div>
          <div class="box"></div>
          <div class="box"></div>
          <div class="box"></div>
          <div class="box"></div>
        </article>
      </section>
    </main>

    <div id="footer">
      <div id="descente2">
        <div class="icon">
          <h4>멤버십혜택</h4>
        </div>

        <div class="icon">
          <img src="img/ft/delivery.png" alt="무료배송/반품" />
          <p>무료배송/반품</p>
        </div>

        <div class="icon">
          <img src="img/ft/point.png" alt="포인트 적립" />
          <p>포인트 적립</p>
        </div>

        <div class="icon">
          <img src="img/ft/coupon.png" alt="할인 쿠폰 제공" />
          <p>할인 쿠폰 제공</p>
        </div>
      </div>

      <div id="descente3">
        <div id="desc1">
          <span><a href="#">회사소개</a></span>
          <span><a href="#">개인정보 처리방침</a></span>
          <span><a href="#">윤리경영신고</a></span>
          <span><a href="#">파트너쉽</a></span>
          <span><a href="#">위치기반 서비스 이용약관</a></span>
          <span><a href="#">단체구매</a></span>
          <span><a href="#">이용약관</a></span>
          <span><a href="#">매장안내</a></span>
          <span><a href="#">매장개설</a></span>
          <span><a href="#">고객센터 :</a> 080-565-5600</span>
          <span
            >10:00 ~ 17:00 (Lunch 12:30~13:30) <br />1:1 채팅문의는 우측 하단
            아이콘 클릭
          </span>
        </div>

        <div id="desc2">
          <p>
            주소 : 서울시 송파구 올림픽로 300 롯데월드타워 32층<br />
            대표이사 : SHIMIZU MOTONARI<br />
            대표번호 : 080-565-5600<br />
            FAX: 02-2007-8899<br />
            상호명 : 데상트코리아 주식회사<br />
            사업자등록번호 : 220-86-01214
            <a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208601214"
              >사업장 확인</a
            ><br />
            통신판매신고번호 : 제2018-서울송파-0206<br />
            개인정보보호책임자 : 윤지현
          </p>
        </div>
      </div>
    </div>

    <script>
      // 슬라이드
      $(document).ready(function () {
        function prev() {
          $(".slidelist li:last").prependTo(".slidelist");
          $(".slidelist").css("margin-left", -1200);
          $(".slidelist").stop().animate({ marginLeft: 0 }, 1000);
        }

        function next() {
          $(".slidelist")
            .stop()
            .animate({ marginLeft: -1200 }, function () {
              $(".slidelist li:first").appendTo(".slidelist");
              $(".slidelist").css({ marginLeft: 0 });
            });
        }

        function slide() {
          $(".slidelist")
            .stop()
            .animate({ marginLeft: -1200 }, function () {
              $(".slidelist li:first").appendTo(".slidelist");
              $(".slidelist").css({ marginLeft: 0 });
            });
        }
        setInterval(slide, 3000);

        $(".prev").click(function () {
          prev();
        });

        $(".next").click(function () {
          next();
        });
      });
    </script>
  </body>
</html>
