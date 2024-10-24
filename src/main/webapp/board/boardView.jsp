<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/common.css?ofter">
<link rel="stylesheet" href="css/shopping.css">

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
		<h1 id="font">게시글</h1>
		<table>
			<tr>
				<th>작성자</th>
				<td>${board.username}</td>
				<th>이메일</th>
				<td>${board.email}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${board.writedate}" /></td>
				<th>조회수</th>
				<td>${board.readcount }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3" class="left">${board.title }</td>
			</tr>
			<tr>
				<th id="content">내용</th>
				<td colspan="3" class="left"><pre>${board.content }</pre></td>
			</tr>
		</table>
		<br> <br> <input type="button" value="수정" onclick="open_win('DescenteServlet?command=desc_check_pass_form&num=${board.num}', 'update')" class="btn">
      <input type="button" value="삭제"  onclick="open_win('DescenteServlet?command=desc_check_pass_form&num=${board.num}', 'delete')" class="btn">
      <input type="button" value="목록"  onclick="location.href='DescenteServlet?command=desc_list'" class="btn"> 
      <input type="button" value="등록"  onclick="location.href='DescenteServlet?command=desc_write_form'" class="btn">
	</div>
	<div class="br"></div>
</body>
</html>