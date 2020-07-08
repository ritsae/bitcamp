<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="fix/meta.jsp"%>
<title>마이페이지</title>
</head>
<body>
<div class="container-fluid bg-sub" id="bg-sub">
	<div class="row justify-content-center">
		<h2>마이페이지</h2>
	</div>
</div>
<%@ include file="fix/header.jsp"%>	
	<%-- <p><h2>주문목록</h2> <a href="goUpdate">회원정보수정</a></p>
	<table border="1" width="880">
		<!-- 여기에 주문목록 -->
		<tr>
			<td width="77">
				<p align="center">매장명</p>
			</td>
			<td width="327">
				<p align="center">주문내용</p>
			</td>
			<td width="197">
				<p align="center">결제 금액</p>
			</td>
		<tbody>
			<c:forEach items="${orderList}" var="order" varStatus="status">
				<tr>
					<td>${order.cafe_name}</td>
					<td>${order.product_name}</td>
					<td>${order.product_price}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<br>
	<br>
	<br>
	<br>
	<h2>즐겨찾는 카페</h2>

	<table border="1" width="880">
		<tr>
			<td width="77">
				<p align="center">번호</p>
			</td>
			<td width="327">
				<p align="center">매장명</p>
			</td>
			<td width="197">
				<p align="center">주소</p>
			</td>
			<td width="327">
				<p align="center">삭제</p>
		<tbody>
			<c:forEach items="${wishList}" var="wish" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${wish.cafe_name}</td>
					<td>${wish.cafe_addr}</td>
					<td><a href="delete/${wish.wish_num}">삭제하기</a></td>
					wish_num은 키, ${~~}는 밸류 }
				</tr>

			</c:forEach>
		</tbody>
	</table> --%>
	<div class="container">
        <!-- 주문내역 -->
        <div class="row page-space">
            
            <div class="page-title m-auto pb-3">
                <a href="goUpdate" class="btn btn-dark mb-5">회원정보수정</a>
                <h2>주문내역</h2>
            </div>
            <table class="table table-hover text-center table-b">
                <thead class="thead-cafe">
                    <tr>
                        <th>매장명</th>
                        <th>주문내용</th>
                        <th>결제금액</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orderList}" var="order" varStatus="status">
                    <tr>
                        <td>${order.cafe_name}</td>
                        <td>${order.product_name}</td>
                        <td>${order.product_price}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 즐겨찾기 -->
        <div class="row page-space">
            <div class="page-title m-auto pb-3">
                <h2>즐겨찾는 카페</h2>
            </div>
            <table class="table table-hover text-center table-b">
                <thead class="thead-cafe">
                    <tr>
                        <th>No</th>
                        <th>매장명</th>
                        <th>주소</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${wishList}" var="wish" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${wish.cafe_name}</td>
                        <td>${wish.cafe_addr}</td>
                        <td><a href="delete/${wish.wish_num}" class="btn-delete">삭제하기</a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

<%@ include file="fix/footer.jsp"%>
</body>


</html>