<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="fix/meta.jsp"%>
<title>${cafe.cafe_name}</title>
</head>
<body>
	<div class="container-fluid bg-sub" id="bg-sub">
		<div class="row justify-content-center">
			<h2>${cafe.cafe_name}</h2>
		</div>
	</div>
	<%@ include file="fix/header.jsp"%>


	<div class="container">
		<div class="row page-space">
			<c:set var="isWish" value="${isWish}" />
			<div class="col-md-6 pl-0">
				<div
					class="justify-content-center center-block input-group mb-3 w-100">
					<img src="/myapp/img/${cafe.cafe_img}" class="img-fluid">
				</div>
			</div>

			<div class="col-md-6 pr-0">
				<div id="wish_div">
					<c:if test="${isWish == false}">
						<button type="button" id="wish_btn" class="btn btn-default btn-sm">
							<i class="far fa-star fa-sm"></i> 즐겨찾기 추가
						</button>
					</c:if>
					<c:if test="${isWish == true}">
						<button type="button" id="wish_delete_btn"
							class="btn btn-default btn-sm">
							<i class="fas fa-star fa-sm"></i> 즐겨찾기 삭제
						</button>
					</c:if>
				</div>
				<table class="table table-b mt-2">
					<tbody>
						<tr>
							<th class="thead-cafe" width="20%">주소</th>
							<td>${cafe.cafe_addr}</td>
						</tr>
						<tr>
							<th class="thead-cafe">전화번호</th>
							<td>${cafe.cafe_tel}</td>
						</tr>
					</tbody>
				</table>
				<%-- 
				${cafe.cafe_name} <br> ${cafe.cafe_addr} <br>
				${cafe.cafe_tel} <br> ${cafe.cafe_star} <br> <img
					src="/myapp/img/${cafe.cafe_img}"
					style="width: 100px; height: 100px;"> <br> --%>

				<h4 class="font-weight-bold mt-4 mb-2">미리 주문하기(취소 불가)</h4>
				<select id="product_choice" name="product_choice"
					class="custom-select">
					<option value="">메뉴 선택</option>
					<c:forEach items="${productList}" var="product">
						<option value="${product.product_name}">${product.product_name}</option>
					</c:forEach>
				</select>

				<%-- <p>미리 주문하기(취소 불가)</p>
				<select id="product_choice" name="product_choice">
					<option value="">메뉴 선택</option>
					<c:forEach items="${productList}" var="product">
						<option value="${product.product_name}">${product.product_name}</option>
					</c:forEach>
				</select> --%>

				<form action="/myapp/insertOrderList.do" method="post">
					<input type="hidden" value="${cafe.cafe_code}" name="cafe_code">
					<table class="table">
						<tbody id="menu_div">
						</tbody>
					</table>
					<table class="table align-text-bottom table-order">
						<tbody>
							<tr>
								<td class="border-top-0 table-b">총 합계금액</td>
								<td class="text-right border-top-0 table-b" id="menu_account"></td>
							<tr>
						</tbody>
					</table>
				</form>
			</div>

			<!-- comment board paging control start -->
			<div class="row mt-3 w-100">
				<h3>
					평점 <i class="fas fa-star fa-sm"></i>${cafe.cafe_star} / 5.0
				</h3>
				<table class="table table-hover text-center table-b">
					<thead class="thead-cafe">
						<tr>
							<th>No</th>
							<th>평점</th>
							<th>작성자</th>
							<th>내용</th>
							<th>작성일</th>
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
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row justify-content-center text-center m-auto">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"
								href='<c:url value="/cafeDetail/${cafe.cafe_code}?page=${pageMaker.startPage-1}"/>'><span
									aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li class="page-item"><a class="page-link"
								href='<c:url value="/cafeDetail/${cafe.cafe_code}?page=${idx}"/>'>${idx}</a></li>

						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link" aria-label="Next"
								href='<c:url value="/cafeDetail/${cafe.cafe_code}?page=${pageMaker.endPage+1}" />'><span
									aria-hidden="true">&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
				</div>
				<%-- <table>
					<tr>
						<c:if test="${pageMaker.prev}">
							<td><a
								href='<c:url value="/cafeDetail/${cafe.cafe_code}?page=${pageMaker.startPage-1}"/>'>&laquo;</a>
							</td>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<td><a
								href='<c:url value="/cafeDetail/${cafe.cafe_code}?page=${idx}"/>'>${idx}</a>
							</td>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<td><a
								href="<c:url value="/cafeDetail/${cafe.cafe_code}?page=${pageMaker.endPage+1}" />">&raquo;</a>
							</td>
						</c:if>
					</tr>
				</table> --%>
			</div>

			<!-- comment board paging control end -->
			<div class="row w-100">
				<div class="form-row input-group mt-5 w-100">
					<h3>별점주기</h3>
					<select id="user_star" name="user_star"
						class="custom-select col-md-2">
						<option value=5.0>★★★★★</option>
						<option value=4.0>★★★★</option>
						<option value=3.0>★★★</option>
						<option value=2.0>★★</option>
						<option value=1.0>★</option>
					</select>
				</div>

				<div class="input-group mb-5">
					<textarea id="comment_content" class="form-control mr-2" rows="4"
						cols="50" placeholder="댓글을 입력해주세요(100자 이내)" maxlength="100"></textarea>
					<button type="button" id="comment_btn" class="btn btn-dark">작성하기</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="fix/footer.jsp"%>
	<script>
		$(function() {
			insertWishList();
			deleteWishList();
			comment();
			menu();
		}); // main

		// comment insert
		function comment() {
			$('#comment_btn').on('click', function() {
				$.ajax({
					url : '/myapp/commentInsert.do',
					type : 'POST',
					data : {
						user_id : '${user.user_id}',
						cafe_code : '${cafe.cafe_code}',
						content : $('#comment_content').val(),
						comment_date : getToday(),
						user_star : $('#user_star').val()
					}
				}).done(function(data) {
					alert('등록되었습니다.');
					location.reload();
				}).fail(function(request, error, status) {
					console.log("code : " + request.status + "\n");
					console.log("msg : " + request.responseText + "\n");
					console.log("error : " + error + "\n");
					alert('comment insert fail');
				})
			})
		}

		// 현재 날짜 구하기 (format : yyyy.MM.dd)
		function getToday() {
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var date = now.getDate();

			if ((month + "").length < 2) {
				month = "0" + month;
			}

			if ((date + "").length < 2) {
				date = "0" + date;
			}

			return today = "" + year + "." + month + "." + date;
		}

		// 메뉴 드롭박스 이벤트
		function menu() {
			var priceAll = 0;
			var productList = new Array();

			$('#product_choice')
					.on(
							'change',
							function() {
								var product_name = $('#product_choice').val();
								var product_price = productPrice(product_name);
								var menuInfo = '<tr>'
										+ '<td>'
										+ product_name
										+ '</td>'
										+ '<td class="text-right">'
										+ product_price
										+ ' 원</td>'
										+ '<input type="hidden" name="product_name" value="' + product_name + '">'
										+ '</tr>';
								/* var menuInfo = '<tr>' + '<td>' + product_name
										+ '</td>' + '<td class="text-right">' + product_price
										+ ' 원</td>' + +'</tr>'; */
								/* var menuInfo = '<p><input type="text" readonly="readonly" name="product_name" value="'+product_name+'">' +
								   '&nbsp;&nbsp;&nbsp;&nbsp;' + product_price + '</p>'; */
								$('#menu_div').append(menuInfo);

								priceAll += product_price;
								var account = '<span><input type="text" readonly class="price-box pr-2" name="product_price" value="'+priceAll+'"></span>'
										+ '&nbsp;<input type="submit" value="주문하기" id="order_btn" class="btn btn-dark btn-sm">';
								/* var account = '<p> 총 합계금액 &nbsp;&nbsp;&nbsp; <input type="text" readonly="readonly" name="product_price" value="'+priceAll+'">'
										+ '<input type="submit" value="주문하기" style="margin-left:10px;">'
										+ '</p>'; */
								$('#menu_account').html(account);

								$(function orderBtn() {
									$('#order_btn').on('click', function() {
										alert('주문이 완료되었습니다');
									})
								});
							})
		}

		// 물품 가격 구하기!
		function productPrice(product_name) {
			var product_price = 0;
			$.ajax({
				url : '/myapp/searchProductPrice.do',
				type : 'POST',
				data : {
					cafe_code : '${cafe.cafe_code}',
					product_name : product_name
				},
				dataType : 'json',
				async : false,
				success : function(data) {
					product_price = data.price;
				},
				error : function(request, error, status) {
					console.log("code : " + request.status + "\n");
					console.log("msg : " + request.responseText + "\n");
					console.log("error : " + error + "\n");
					alert('searchProductPrice fail');
				}
			})

			return product_price;
		}

		// 즐겨찾기 추가
		function insertWishList() {
			$('#wish_btn').on('click', function(event) {
				event.preventDefault();
				var wish = {
					user_id : '${user.user_id}',
					cafe_code : '${cafe.cafe_code}',
					cafe_name : '${cafe.cafe_name}',
					cafe_addr : '${cafe.cafe_addr}'
				};
				$.ajax({
					url : '/myapp/insertWishList.do',
					type : 'POST',
					data : wish,
					dataType : 'text',
					async : false,
					success : function(data) {
						console.log('insert : ' + data);
						if (data == 'success') {
							var delete_btn = '<button type="button" id="wish_delete_btn">★ 즐겨찾기 삭제</button>';
							alert('즐겨찾기에 추가 되었습니다.');
							$('#wish_btn').remove();
							$('#wish_div').html(
									delete_btn);
							deleteWishList();
						} else if (data == 'fail')
							alert('이미 추가된 곳입니다.');
					},
					error : function(request, error, status) {
						console.log("code : "+ request.status+ "\n");
						console.log("msg : "+ request.responseText+ "\n");
						console.log("error : " + error + "\n");
						alert('fail! fail! fail! fail! fail! fail! fail! fail!');
					}
				});
			})
		}

		// 즐겨찾기 제거
		function deleteWishList() {
			$('#wish_delete_btn').on('click',function(event) {
				event.preventDefault();
				$.ajax({
					url : '/myapp/deleteWishList.do',
					type : 'POST',
					data : {
						user_id : '${user.user_id}',
						cafe_code : '${cafe.cafe_code}'
					},
					dataType : 'text',
					success : function(data) {
						var add_btn = '<button type="button" id="wish_btn">★ 즐겨찾기 추가</button>';
						alert('즐겨찾기에서 삭제 되었습니다.');
						$('#wish_delete_btn').remove();
						$('#wish_div').html(add_btn);
						insertWishList();
					},
					error : function(request, error, status) {
						console.log("code : "+ request.status+ "\n");
						console.log("msg : "+ request.responseText + "\n");
						console.log("error : " + error + "\n");
						alert('delete fail');
					}
				})
			})
		}
	</script>

</body>

</html>