<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="css/product.css?ofter">
      </head>
      <body>
      <div class="br"></div>
      <div class="br"></div>
      <div class="br"></div>
        <div id="wrap" align="center">
          <h1>상품 리스트 - 관리자 페이지</h1>
          
          <div class="br"></div>
          
          <table class="list">
            <tr>
              <td colspan="5" style="border: white; text-align: right" class="text">
              	<a href="product_write">상품 등록</a>
              </td>
            </tr>
            <tr>
              <th>번호</th>
              <th>이름</th>
              <th>가격</th>
              <th>수정</th>
              <th>삭제</th>
            </tr>
            <c:forEach var="product" items="${productList}">
              <tr class="record">
                <td>${product.code}</td>
                <td>${product.productName}</td>
                <td>${product.price} 원</td>
                <td><a href="product_update?code=${product.code}">상품 수정</a>
                </td>
                <td><a href="product_delete?code=${product.code}">상품 삭제</a>
                </td>
              </tr>
            </c:forEach>
            <tr>
              <td colspan="5" style="border: white; text-align: right">
              	<input type="reset" value="메인 화면" onclick="location.href='index.jsp'" class="btn">
              </td>
            </tr>
          </table>
        </div>
      </body>
    </html>