<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2dd25abaad9c711dd38bcb2ac8770c77&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2dd25abaad9c711dd38bcb2ac8770c77"></script>
<%@ include file="fix/meta.jsp"%>
<title>카페검색</title>
</head>
<body>
	<div class="container-fluid bg-sub" id="bg-sub">
		<div class="row justify-content-center">
			<h2>카페검색</h2>
		</div>
	</div>
	<%@ include file="fix/header.jsp"%>
	
	<div class="container">
		<div class="row page-space">
			<div class="col-md-6">
				<div class="justify-content-center center-block input-group mb-3">

					<c:set var="user" value="${user}" />
					<form action="searchCafe" method="POST" class="form-inline w-100">
						<input type="text" name="cafe_name" class="form-control"
							placeholder="카페명 입력" style="width: 75%">
						<div class="input-group-append" style="width: 25%">
							<button class="btn btn-default w-100" type="submit">
								검색하기 <i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="overflow-auto" style="overflow-y: scroll; height:560px">
					<c:forEach items="${cafeList}" var="cafe">
						<table class="table w-100 table-b">
							<tr>
								<td rowspan="2" class="text-center align-middle p-0" width="30%">
									<c:if test="${user == null }">
										<a href="#" id="cafedetail_btn" onclick="detail()"><img
											src="img/${cafe.cafe_img}" class="img-fluid"></a>
										<script type="text/javascript">
											function detail() {
												alert('로그인 해 주세요!');
												location.href = "goLogin";
											}
										</script>
									</c:if> <c:if test="${user != null}">
										<a href="cafeDetail/${cafe.cafe_code}" id="cafedetail_btn"><img
											src="img/${cafe.cafe_img}" class="img-fluid"></a>
									</c:if>

								</td>
								<td height="10%" class="font-weight-bold">${cafe.cafe_name}</td>
								<td class="text-right"><i
									class="fas fa-star fa-sm text-star"></i> ${cafe.cafe_star}</td>
							</tr>
							<tr>
								<td colspan="2">${cafe.cafe_addr}<br>${cafe.cafe_tel}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6">
				<div id="map" style="width:100%; height:600px">
					<span></span>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		/*
		 	 비트캠프 서초센터 지도 좌표 : 37.503105, 127.024282
		 */
		 
		 var cafes = "${cafeList}";
		 console.log(cafes);
		 if(cafes == "[]") {
			 alert('해당 카페는 찾을 수 없습니다.');
			 location.reload();
		 }
		// 지도를 표시할 컨테이너
		var container = document.getElementById('map');
		var options = {
			// 지도 중심
			center : new kakao.maps.LatLng(37.503105, 127.024282),
			// 지도 확대 레벨
			level : 4
		};
		// 지도 생성
		var map = new kakao.maps.Map(container, options);
		// 주소-좌표 변환 객체
		var geocoder = new kakao.maps.services.Geocoder();
		
		<c:forEach items="${cafeList}" var="cafe">
			// 주소로 좌표 검색
			geocoder.addressSearch('${cafe.cafe_addr}', function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					console.log('검색이 완료되었습니다.');
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					// 위치 마커로 표시
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords,
						title: '${cafe.cafe_name}'
					})
				}
				var iwContent = "${cafe.cafe_name}";
				var infowindow = new kakao.maps.InfoWindow({
					content: iwContent
				})
				kakao.maps.event.addListener(marker, 'mouseover', function(){
					infowindow.open(map, marker);
				});
				kakao.maps.event.addListener(marker, 'mouseout', function(){
					infowindow.close();
				});
				
			}) // geocoder.addressSearch() end
		</c:forEach> // c:forEach end
	</script>
	<%@ include file="fix/footer.jsp"%>
</body>
</html>