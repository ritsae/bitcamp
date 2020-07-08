<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../fix/meta.jsp"%>
<title>카페 등록</title>
</head>
<body>
	<div class="container-fluid bg-sub bg-admin"
		style="background-color: #795548;">
		<div class="row justify-content-center">
			<h2>카페등록</h2>
		</div>
	</div>
	<%@ include file="../fix/headerAdmin.jsp"%>

	<div class="container">
		<div class="row page-space">
			<form name="form1" method="post"
				class="align-middle flex-column w-100" action="insert.do">
				<table class="table text-center">
					<tbody>
						<tr>
							<th class="thead-cafe align-middle">코드</th>
							<td><input type="text" class="form-control" id="cafe_code" name="cafe_code"></td>
						</tr>
						<tr>
							<th class="thead-cafe align-middle">카페명</th>
							<td><input type="text" class="form-control" id="cafe_name" name="cafe_name"></td>
						</tr>
						<tr>
							<th class="thead-cafe align-middle">주소</th>
							<td><input type="text" class="form-control" id="cafe_addr" name="cafe_addr"></td>
						</tr>
						<tr>
							<th class="thead-cafe align-middle">전화번호</th>
							<td><input type="text" class="form-control" id="cafe_tel" name="cafe_tel"></td>
						</tr>
						<tr>
							<th class="thead-cafe align-middle">이미지</th>
							<td><input type="file" class="form-control-file"
								id="cafe_img" name="cafe_img" value="${cafe.cafe_img}"></td>
						</tr>
						<tr style="border-bottom:none">
							<td colspan="2" align="center"><input class="btn btn-dark mr-2 pr-4 pl-4" id="cafe_insert_btn" type="submit"
								value="등록"> <input class="btn btn-light pr-4 pl-4" type="button"
								onclick="location.href='/myapp/admin/listCafe.do'" value="취소">
						</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../fix/footer.jsp"%>
	<script type="text/javascript">
		$(function(){
			$(function insertCafe(){
				$('#cafe_insert_btn').on('click', function(){
					var isCafe = cafeInsertCheck();
					if(isCafe == 'false') {
						alert('다시 입력해주세요');
						return false;
					} else alert('등록되었습니다.');
				})
			})
			
		})
		
		function cafeInsertCheck(){
			var isCafe = 'true';
			var cafe_code = $('#cafe_code').val();
			var cafe_name = $('#cafe_name').val();
			var cafe_addr = $('#cafe_addr').val();
			var cafe_tel = $('#cafe_tel').val();
			var cafe_img = $('#cafe_img').val();
			
			if(cafe_code == ""){
				isCafe = 'false'
				alert('카페코드란이 비어있습니다.');
			}
			
			if(cafe_name == ""){
				isCafe = 'false'
				alert('카페이름란이 비어있습니다.');
			}
			
			if(cafe_addr == ""){
				isCafe = 'false'
				alert('카페주소란이 비어있습니다.');
			}
			
			if(cafe_tel == ""){
				isCafe = 'false'
				alert('카페전화번호란이 비어있습니다.');
			}
			
			if(cafe_img == ""){
				isCafe = 'false'
				alert('카페이미지란이 비어있습니다.');
			}
			
			
			return isCafe;
		}
	</script>
</body>
</html>