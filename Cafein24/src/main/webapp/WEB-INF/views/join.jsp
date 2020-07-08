<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="fix/meta.jsp"%>
<title>회원가입</title>
</head>
<body>
<div class="container-fluid bg-sub" id="bg-sub">
	<div class="row justify-content-center">
		<h2>회원가입</h2>
	</div>
</div>
<%@ include file="fix/header.jsp"%>
<!-- 	<form name="joinForm">
		<input type="text" id="user_id" name="user_id" placeholder="아이디">
		<button type="button" id="id_btn">중복체크</button> <br>
		<input type="password" id="user_pw" name="user_pw" placeholder="비밀번호"> <br>
		<input type="password" id="pw_confirm" placeholder="비밀번호 확인"> <br>
		<input type="text" id="user_nickName" name="user_nickName" placeholder="닉네임">
		<button type="button" id="nickName_btn">중복체크</button> <br>
		<input type="text" id="user_tel" name="user_tel" placeholder="전화번호"> <br>
		<button type="submit" id="join_btn">회원가입</button>
	</form> -->
	
	<div class="container formCont">
        <div class="form-row justify-content-center center-block">
            <form name="joinForm" class="align-middle flex-column col-md-6">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디" autofocus>
                    <div class="input-group-btn">
                      <button class="btn btn-form" type="submit" id="id_btn">
                        중복체크 <i class="fas fa-check fa-sm"></i>
                      </button>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control mr-2" id="user_pw" name="user_pw" placeholder="비밀번호">
                    <input type="password" class="form-control" id="pw_confirm" placeholder="비밀번호 확인">
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="user_nickName" name="user_nickName" placeholder="닉네임">
                    <div class="input-group-btn">
                      <button class="btn btn-form" type="submit" id="nickName_btn">
                        중복체크 <i class="fas fa-check fa-sm"></i>
                      </button>
                    </div>
                </div>
                <div class="input-group mb-5">
                    <input type="text" class="form-control" id="user_tel" name="user_tel" placeholder="전화번호">
                </div>
                <div class="input-group">
                    <button type="submit" class="btn btn-default w-100" id="join_btn">회원가입</button>
                </div> 
            </form>
        </div>
    </div>
	<%@ include file="fix/footer.jsp"%>
	<script type="text/javascript" src="resources/js/join.js"></script>
	

</body>

</html>