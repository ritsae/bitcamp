<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<header>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="scroll-color">
            <div class="container">
                <a class="navbar-brand" href="/myapp/admin/listCafe.do"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="150px"> <span>admin</span></a>

                <div class="navbar" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li><button class="btn btn-light" onclick="location.href='/myapp/admin/registCafe.do'">카페등록</button></li>
                    </ul>
                </div>
            </div>
        </nav>
</header>
