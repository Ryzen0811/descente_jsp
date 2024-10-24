<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="css/productwrite.css?ofter">
        <script type="text/javascript" src="script/product.js"></script>
      </head>
      <body>
      <div class="br"></div>
      <div class="br"></div>
      <div class="br"></div>
        <div id="wrap" align="center">
          <h1>상품 수정 - 관리자 페이지</h1>
          <div class="br"></div>
     
          <form method="post" enctype="multipart/form-data" name="frm">
            <input type="hidden" name="code" value="${product.code}">
            <input type="hidden" name="nonmakeImg" value="${product.pictureUrl}">
            
            <table class="noen">
            
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
                      <th style="width:80px"> 상품명</th>
                      <td>
                        <input type="text" name="productname" value="${product.productName}" size="80">
                      </td>
                    </tr>
                    <tr>
                      <th>가격</th>
                      <td><input type="text" name="price" value="${product.price}"> 원</td>
                    </tr>
                    <tr>
                      <th>사진</th>
                      <td>
                        <input type="file" name="pictureUrl"><br>
                        (주의사항 : 이미지를 변경하고자 할때만 선택하시오)
                      </td>
                    </tr>
                    <tr>
                      <th>설명</th>
                      <td><textarea cols="90" rows="10" name="description">${product.description}</textarea></td>
                    </tr>
                  </table>
                  <br>
                  <input type="submit" value="수정" onclick="return productCheck()" class="btn">
                  <input type="reset" value="초기화" class="btn">
                  <input type="button" value="목록" onclick="location.href='product_list'" class="btn">
                </td>
              </tr>
            </table>
          </form>
        </div>
      </body>
    </html>