<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<header>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="scroll-color">
		<div class="container">
			<a class="navbar-brand" href="/myapp"><img src="${pageContext.request.contextPath}/resources/img/logo.png"
				width="150px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="/myapp">HOME</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cafeStart">검색하기</a></li>
					<c:set var="user" value="${user}" />
					<c:if test="${user == null}">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/goJoin">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/goLogin">로그인</a></li>
					</c:if>
					<c:if test="${user != null}">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/myPage.do">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</header>
