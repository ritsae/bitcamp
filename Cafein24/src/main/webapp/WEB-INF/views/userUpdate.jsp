<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="fix/meta.jsp"%>
<title>정보수정</title>
</head>
<body>
	<div class="container-fluid bg-sub" id="bg-sub">
		<div class="row justify-content-center">
			<h2>정보수정</h2>
		</div>
	</div>
	<%@ include file="fix/header.jsp"%>
	<div class="container formCont">
		<div class="form-row justify-content-center center-block">
			<form action="memberUpdate.do" method="POST"
				class="align-middle flex-column col-md-6">
				<label for="user_id">아이디</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="user_id"
						value="${user.user_id}" readonly>
				</div>
				<label for="user_nickName">닉네임</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="user_nickName"
						value="${user.user_nickName}" placeholder="닉네임">
				</div>
				<label for="user_pw">비밀번호</label>
				<div class="input-group mb-3">
					<input type="password" class="form-control mr-2" id="user_pw"
						name="user_pw" placeholder="비밀번호"> <input type="password"
						class="form-control" id="user_pw_confirm" placeholder="비밀번호 확인">
				</div>
				<label for="user_tel">전화번호</label>
				<div class="input-group mb-5">
					<input type="text" class="form-control" id="user_tel"
						name="user_tel" placeholder="전화번호" value="${user.user_tel}">
				</div>
				<div class="input-group">
					<input type="submit" id="user_update_btn"
						class="btn btn-default w-100" id="join_btn" value="수정하기">
				</div>
				<p class="mt-3 text-center">
					<a href="/myapp/userDelete.do" class="btn-delete"
						id="user_delete_btn">회원탈퇴</a>
				</p>
			</form>
		</div>
	</div>
	<%@ include file="fix/footer.jsp"%>
	<script>
		$(function() {
			$(function userUpdate() {
				$('#user_update_btn').on('click', function() {
					var isPw = userPwCheck();
					if (isPw == 'false') {
						alert('다시 입력해주세요');
						location.reload();
						return false;
					} else
						alert('수정이 완료되었습니다.');
				})
			})

			$(function userDelete() {
				$('#user_delete_btn').on('click', function(e) {
					var isPw = userPwCheck();
					if (isPw == 'false') {
						e.preventDefault();
						location.href = '';
						return false;
					} else {
						alert('탈퇴가 완료되었습니다.');
						location.href = '/myapp/userDelete.do';
					}
				})
			})
		})

		function userPwCheck() {
			var user_pw_input = $('#user_pw').val();
			var user_pw_confirm_input = $('#user_pw_confirm').val();
			var user_pw = '${user.user_pw}';
			var isUserPw = 'true';

			console.log('user_pw_input : ' + user_pw_input);
			console.log('user_pw_confirm_input : ' + user_pw_confirm_input);
			console.log('user_pw : ' + user_pw);

			if (user_pw_input == '') {
				alert('비밀번호 입력란이 비어있습니다.');
				isUserPw = 'false';
			}

			if (user_pw_confirm_input == '') {
				alert('비밀번호 확인 입력란이 비어있습니다.');
				isUserPw = 'false';
			}

			if (user_pw != user_pw_input) {
				alert('비밀번호가 틀렸습니다.');
				isUserPw = 'false';
			}

			if (user_pw_input != user_pw_confirm_input) {
				alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
				isUserPw = 'false';
			}

			return isUserPw;
		}
	</script>
</body>

</html>