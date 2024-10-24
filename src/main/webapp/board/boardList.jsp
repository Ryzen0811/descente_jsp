<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<link rel="stylesheet" href="css/common.css?ofter">
<link rel="stylesheet" href="css/shopping.css">

<script type="text/javascript" src="script/board.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
<meta http-equiv="Content-Security-Policy"
	content="script-src 'self' https://www.googleadservices.com">

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
		<h1 id="font">게시판</h1>
		<table class="list">
			<tr>
				<td colspan="5" style="border: white; text-align: right"><c:choose>
						<c:when test="${loginUser.admin == 1}">
							<a href="product_list">관리자 페이지</a>
							<br>
							<a href="DescenteServlet?command=desc_write_form">게시글 등록</a>
						</c:when>

						<c:otherwise>
							<a href="DescenteServlet?command=desc_write_form">게시글 등록</a>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<%--
        		<c:choose>
            		<c:when test="${loginUser.admin == 1}">
            			<a href="product_list">관리자 페이지</a>
            		</c:when>
            	
            		<c:otherwise>
            		</c:otherwise>
            	</c:choose>
        	<a  href="DescenteServlet?command=desc_write_form">게시글 등록</a>
          <br>
          <a href="product_list"> 관리자 페이지</a>
        --%>


			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:forEach var="board" items="${boardList }">
				<tr class="record">
					<td>${board.num }</td>
					<td><a
						href="DescenteServlet?command=desc_view&num=${board.num}">
							${board.title } </a></td>
					<td>${board.username}</td>
					<td><fmt:formatDate value="${board.writedate }" /></td>
					<td>${board.readcount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script src="./script/main.js"></script>

	<div class="br"></div>
</body>
</html>