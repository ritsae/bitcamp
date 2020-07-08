<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="fix/meta.jsp"%>
<title>로그인</title>
</head>
<body>
<div class="container-fluid bg-sub" id="bg-sub">
	<div class="row justify-content-center">
		<h2>로그인</h2>
	</div>
</div>
<%@ include file="fix/header.jsp"%>
	<!-- <form action="login.do" method="post">
		아이디 : <input type="text" name="user_id"> <br>
		비밀번호 : <input type="password" name="user_pw"> <br>
		<input type="submit" value="로그인">
		goJoin
	</form> -->
	<div class="container formCont">
        <div class="form-row justify-content-center center-block">
            <form action="login.do" method="post" class="align-middle flex-column col-md-5">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="user_id" placeholder="아이디" autofocus>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control mr-2" name="user_pw" placeholder="비밀번호">
                </div>
                <p class="mb-5">아이디가 없으신가요? · <a href="goJoin">회원가입</a></p>
                <div class="input-group">
                    <input type="submit" class="btn btn-default w-100" id="join_btn" value="로그인">
                </div> 
            </form>
        </div>
    </div>
<%@ include file="fix/footer.jsp"%>
</body>
</html>