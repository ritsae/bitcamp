<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../fix/meta.jsp"%>
<title>카페목록</title>
</head>
<body>
	<div class="container-fluid bg-sub bg-admin"
		style="background-color: #795548;">
		<div class="row justify-content-center">
			<h2>카페목록</h2>
		</div>
	</div>
	<%@ include file="../fix/headerAdmin.jsp"%>

	<div class="container">
        <div class="row page-space">
            <table class="table table-hover text-center table-b">
                <thead class="thead-cafe">
                    <tr>
                        <th>코드</th>
                        <th>카페명</th>
                        <th>주소</th>
                        <th>전화번호</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${list}">
	                    <tr>
	                        <td>${row.cafe_code}</td>
	                        <td>${row.cafe_name}</td>
	                        <td>${row.cafe_addr}</td>
	                        <td>${row.cafe_tel}</td>
	                        <td><a href="/myapp/admin/${row.cafe_code}" class="btn-delete">수정</a></td>
	                        <td><a href="/myapp/admin/delete/${row.cafe_code}" class="btn-delete">삭제</a></td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="../fix/footer.jsp"%>
</body>
</html>