<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
    <link rel="stylesheet" href="css/common.css?ofter">
    <link rel="stylesheet" href="css/write.css?ofter">
	
    <script type="text/javascript" src="script/board.js"></script>
  </head>
  <body>
  
  <div id="header">


        <!-- 로고 영역 -->
		<div id="logo">
			<a href="index.jsp"><img src="img/logo.jpg" alt="로고" /></a>
		</div>

		<!-- 로그인 영역 -->
		<div id="login">
			<span> <c:choose>
					<c:when test="${empty loginUser.username}">
						<a href="desc_login">로그인</a>
					</c:when>

					<c:otherwise>
						<a href="desc_update">${loginUser.username}</a>
					</c:otherwise>
				</c:choose>
			</span> <span> <c:choose>
					<c:when test="${not empty loginUser.username}">
						<a href="desc_logout">로그아웃</a>
					</c:when>

					<c:otherwise>
						<a href="desc_join">회원가입</a>
					</c:otherwise>
				</c:choose>
			</span> <span><a href="board.jsp">게시판</a></span>
		</div>

		<!-- 내비게이션 영역 -->
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
  
    <div id="wrap" align="center">
    <br>
      <h1 id="title">게시글 등록</h1>
      <form name="frm" method="post" action="DescenteServlet">
        <input type="hidden" name="command" value="desc_write">
        <table>
          <tr>
            <th>작성자</th>
            <td><input type="text" name="username" value="${loginUser.username}" readonly></td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass"> * 필수 (게시물 수정
              삭제시 필요합니다.)</td>
          </tr>
          <tr>
            <th>이메일</th>
            <td><input type="text" name="email" value="${loginUser.email}" readonly></td>
          </tr>
          <tr>
            <th>제목</th>
            <td><input type="text" size="70" name="title"> * 필수 (70자 이하)</td>
          </tr>
          <tr>
            <th>내용</th>
            <td><textarea cols="72" rows="10" name="content"></textarea></td>
          </tr>
        </table>
        <br>
        <br> 
        <input type="submit" value="등록" onclick="return boardCheck()" class="btn">
        <input type="reset"  value="리셋" class="btn">
        <input type="button" value="목록"  onclick="location.href='DescenteServlet?command=desc_list'" class="btn">
      </form>
    </div>
    <div class="br"></div>
  </body>
</html>