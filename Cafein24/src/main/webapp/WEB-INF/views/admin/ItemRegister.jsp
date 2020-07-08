<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../fix/meta.jsp"%>
<title>메뉴 수정/등록</title>
</head>
<body>
	<div class="container-fluid bg-sub bg-admin"
		style="background-color: #795548;">
		<div class="row justify-content-center">
			<h2>메뉴 수정/등록</h2>
		</div>
	</div>
	<%@ include file="../fix/headerAdmin.jsp"%>
	
	<div class="container">
		<div class="row page-space">
			<div class="page-title m-auto pb-3">
				<h2>메뉴 목록</h2>
			</div>
			<table class="table table-hover text-center table-b">
				<thead class="thead-cafe">
					<tr>
						<th>메뉴명</th>
						<th>가격</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="tblShow">
					<c:forEach items="${productList}" var="product">
						<tr>
							<td>${product.product_name}</td>
							<td>${product.product_price}</td>
							<td><a href="/myapp/deleteItem.do/${product.product_code}" id="item_delete_btn"
								class="btn-delete">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row page-space">
			<div class="page-title m-auto pb-3">
				<h2>메뉴 등록</h2>
			</div>
			<table class="table text-center table-b">
				<tbody>
					<tr>
						<th class="thead-cafe align-middle">상품코드</th>
						<td><input type="text" class="form-control" id="product_code" name="product_code"></td>
					</tr>
					<tr>
						<th class="thead-cafe align-middle">카페코드</th>
						<td><input type="text" class="form-control" id="cafe_code" name="cafe_code"
							value="${cafe_code}" readonly></td>
					</tr>
					<tr>
						<th class="thead-cafe align-middle">금액</th>
						<td><input type="text" class="form-control" id="product_price" name="product_price"></td>
					</tr>
					<tr>
						<th class="thead-cafe align-middle">상품명</th>
						<td><input type="text" class="form-control" id="product_name" name="product_name"></td>
					</tr>
					<tr>
						<th class="thead-cafe align-middle">종류</th>
						<td><select id="product_type" name="product_type"
							class="custom-select">
								<option value=0>HOT</option>
								<option value=1>ICE</option>
						</select></td>
					</tr>
				</tbody>
			</table>
			<div class="row d-flex justify-content-center m-auto">
				<button class="btn btn-dark pr-4 pl-4" type="button"
					id="productInsert_btn">등록</button>
			</div>
		</div>
	</div>
	<%@ include file="../fix/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
			insertProduct();
			$(function deleteItem() {
				$('#item_delete_btn').on('click', function(){
					alert('삭제되었습니다.');
				})
			})
		})
	
		function insertProduct() {
			$('#productInsert_btn').on('click', function() {
				// 버튼을 클릭했을 때 우리가 해야할 일 
				$.ajax({
					url : '/myapp/productInsert.do',
					type : 'POST',
					data : {
						product_code : $('#product_code').val(),
						cafe_code : $('#cafe_code').val(),
						product_price : $('#product_price').val(),
						product_name : $('#product_name').val(),
						product_type : $('#product_type').val()
					},
					dataType : 'text',
				}).done(function(data) {
					alert(data + ' : 등록이 완료되었습니다.');
					location.reload();
				}).fail(function(request, status, error) {
					console.log("code : " + request.status + "\n");
					console.log("msg : " + request.responseText + "\n");
					console.log("error : " + error + "\n");
					alert('product insert fail');
				})
	
			})
		}
	</script>
</body>



</html>