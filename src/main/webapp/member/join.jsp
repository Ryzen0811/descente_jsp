<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
	<meta charset='utf-8'>
	<meta name="viewport"
		content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title>join</title>
	<link rel="stylesheet" href="css/join.css?ofter">
	
	<script type="text/javascript" src="script/member.js"></script>

</head>

<body>

	<%-- 회원가입 --%>
    
   <h2>데상트 코리아</h2>
      
			<div id="join_box">
     		<h3>회원 가입</h3>
     		
      			<form action="desc_join" method="post" name="frm" id="user_join_box">
     	    		<div id="user_join">
          				<div id="user_join_desc1">
            				<span >이&nbsp; 름&nbsp; &nbsp;</span>
            				<span ><input type="text" name="username" size="20">*</span>
         				</div>
         				
          				<div id="user_join_desc2">
            				<span >아이디&nbsp;&nbsp;</span>
            				<span >
              					<input type="text" name="userid" size="20" id="userid">*
             					<input type="hidden" name="reid" size="20"> 
             				</span>
             				<span id="btn">		
            					<input type="button" value="중복 체크" onclick="idCheck()">
          					</span>
          				</div>
          				
          				<div id="user_join_desc1">
            				<span >암&nbsp; 호&nbsp; &nbsp;</span>
            				<span ><input type="password" name="pwd" size="20">*</span>
          				</div>
          				
          				<div id="user_join_desc1">
            				<span >암호 확인</span>
            				<span ><input type="password" name="pwd_check" size="20">*</span>
          				</div>
          				
          				<div id="user_join_desc1">
           					<span >이메일&nbsp;&nbsp;</span>
            				<span ><input type="text" name="email" size="20"></span>
          				</div>
          				
          				<div id="user_join_desc1">
            				<span >전화번호</span>
            				<span ><input type="text" name="phone" size="20"></span>
          				</div>
          				
          				<div id="user_join_desc3">
            				<span>
              					<input type="radio" name="admin" value="0" checked="checked"> 일반회원
              				</span>
              				<span> 
               					<input type="radio" name="admin" value="1"> 관리자
            				</span>
          				</div>
          				
          				<div id="user_join_desc4">
            				<span>
               					<input type="submit" value="확인" onclick="return joinCheck()"> 	
               				</span>
               				<span>
               					<input type="reset" value="메인 화면" onclick="location.href='index.jsp'">
            				</span>
          				</div>
          				
          				<div id="user_join_desc5">
            				<span>${message }</span>
          				</div>
        			</div>
      		</form>
      </div>
</body>
</html>