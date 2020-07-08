<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="fix/meta.jsp"%>
<title>index</title>
</head>
<body>
	<%-- 	<c:set var="user" value="${user}" />
	<c:if test="${user == null}">
		<a href="goJoin">회원가입</a>
		<input type="button" value="로그인" onClick="location.href='goLogin'">
	</c:if>
	<c:if test="${user != null}">
		<a href="myPage.do">마이페이지</a>
		<input type="button" value="로그아웃" onClick="location.href='logout'">
	</c:if>

	<br>
	<input type="button" value="시작하기" onClick="location.href='cafeStart'"> --%>

	<%@ include file="fix/header.jsp"%>

	<div class="container-fluid m-0 p-0">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100 img-fluid img-darker"
						src="https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"
						alt="First slide">
					<div class="carousel-caption">
						<p>Cafe in 24</p>
						<h5>내 주변 24시 카페 검색하기</h5>
						<button class="btn-index" onClick="location.href='cafeStart'">
							<span>시작하기</span>
						</button>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 img-fluid"
						src="https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80"
						alt="Second slide">
					<div class="carousel-caption">
						<p>Cafe in 24</p>
						<h5>내 주변 24시 카페 검색하기</h5>
						<button class="btn-index" onClick="location.href='cafeStart'">
							<span>시작하기</span>
						</button>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 img-fluid"
						src="https://images.unsplash.com/photo-1499750310107-5fef28a66643?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
						alt="Third slide">
					<div class="carousel-caption">
						<p>Cafe in 24</p>
						<h5>내 주변 24시 카페 검색하기</h5>
						<button class="btn-index" onClick="location.href='cafeStart'">
							<span>시작하기</span>
						</button>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<%@ include file="fix/footer.jsp"%>
</body>
</html>