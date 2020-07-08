<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../fix/meta.jsp"%>
<title>카페 수정</title>
</head>
<body>
	<div class="container-fluid bg-sub bg-admin"
		style="background-color: #795548;">
		<div class="row justify-content-center">
			<h2>카페수정</h2>
		</div>
	</div>
	<%@ include file="../fix/headerAdmin.jsp"%>
	<div class="container">
		<div class="row page-space">
			<div class="page-title m-auto pb-3">
            <input type="button" value="메뉴등록"
					onclick="location.href='/myapp/ItemRegister/${cafe.cafe_code}'" class="btn btn-dark">
            </div>
			<form name="form1" method="post"
				class="align-middle flex-column w-100">
				<table class="table text-center table-b">
					<tbody>
						<tr>
							<th class="thead-cafe align-middle">카페코드</th>
							<td><input type="text" class="form-control" name="cafe_code"
								value="${cafe.cafe_code}" readonly></td>
						</tr>
						<tr>
							<th class="thead-cafe align-middle">카페명</th>
							<td><input type="text" class="form-control" name="cafe_name"
								value="${cafe.cafe_name}"></td>
						</tr>
						<tr>
							<th class="thead-cafe align-middle">주소</th>
							<td><input type="text" class="form-control" name="cafe_addr"
								value="${cafe.cafe_addr}"></td>
						</tr>
						<tr>
							<th class="thead-cafe align-middle">전화번호</th>
							<td><input type="text" class="form-control" name="cafe_tel"
								value="${cafe.cafe_tel}"></td>
						</tr>
						<%-- <tr>
							<th class="thead-cafe align-middle">이미지</th>
							<td><input type="file" class="form-control-file"
								id="cafe_img" name="cafe_img" value="${cafe.cafe_img}"></td>
						</tr> --%>
					</tbody>
				</table>
				<div class="row d-flex justify-content-center m-auto">
					<button class="btn btn-dark mr-2 pr-4 pl-4" type="submit" id="cafe_update_btn"
						onclick="javascript: form.action='/myapp/admin/modifyCafe.do'">등록</button>
					<button class="btn btn-light pr-4 pl-4"
						onclick="javascript: form.action='/myapp/admin/listCafe.do'"
						type="submit">취소</button>
				</div>
			</form>
		</div>
		<div class="row page-space">
			<div class="page-title m-auto pb-3">
				<h2>리뷰 목록</h2>
			</div>
			<table class="table table-hover text-center table-b">
				<thead class="thead-cafe">
					<tr>
						<th width="10%">No</th>
						<th width="10%">평점</th>
						<th width="15%">작성자</th>
						<th width="40%">내용</th>
						<th width="15%">작성일</th>
						<th width="10%">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${commentList}" var="comment" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${comment.user_star}</td>
							<td>${comment.user_id}</td>
							<td>${comment.content}</td>
							<td>${comment.comment_date}</td>
							<td><a href="/myapp/admin/commentDelete.do/${comment.cnum}" id="comment_delete_btn"
								class="btn-delete">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<%@ include file="../fix/footer.jsp"%>
	<script type="text/javascript">
		$(function(){
			updateCafe();
			deleteComment();
		})
		
		function updateCafe(){
			$('#cafe_update_btn').on('click', function(){
				alert('수정이 완료되었습니다.');
			})
		}
			
		function deleteComment(){
			$('#comment_delete_btn').on('click', function(){
				alert('후기가 삭제되었습니다.');
			})
		}
	</script>
</body>
</html>