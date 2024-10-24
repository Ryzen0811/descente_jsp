<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="css/product.css">
      </head>
      <body>
      <div class="br"></div>
      <div class="br"></div>
      <div class="br"></div>
        <div id="wrap" align="center">
          <h1>상품 삭제 - 관리자 페이지</h1>
          <div class="br"></div>
      
          <form action="product_delete" method="post">
            <table>
              <tr>
                <td>
                  <c:choose>
                    <c:when test="${empty product.pictureUrl}">
                      <img src="upload/noimage.gif">
                    </c:when>
                    <c:otherwise>
                      <img src="upload/${product.pictureUrl}">
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <table>
                    <tr>
                      <th style="width: 80px">상 품 명</th>
                      <td>${product.productName}</td>
                    </tr>
                    <tr>
                      <th>가 격</th>
                      <td>${product.price}원</td>
                    </tr>
                    <tr>
                      <th>설 명</th>
                      <td><div style="height: 220px; width: 100%">${product.description}</div></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <br> 
            <input type="hidden" name="code" value="${product.code}" class="btn">
            <input type="submit" value="삭제" class="btn"> 
            <input type="button" value="목록" onclick="location.href='product_list'" class="btn">
          </form>
        </div>
      </body>
    </html>