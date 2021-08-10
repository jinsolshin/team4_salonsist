<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살롱, 시스트 위치</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d4f25caf596cab9e8c3e518129c9a01"></script>
<link rel="stylesheet" href="./css/Salon.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<script type="text/javascript">
	$(function() {
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.556513847194786, 126.91954957812412),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
		
		var mapTypeControl = new kakao.maps.MapTypeControl();

		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var markerPosition  = new kakao.maps.LatLng(37.556513847194786, 126.91954957812412); 

		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;">　　살롱, 시스트</div>';
	    iwPosition = new kakao.maps.LatLng(37.556513847194786, 126.91954957812412); //인포윈도우 표시 위치입니다

		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		infowindow.open(map, marker); 
	});
</script>
</head>
<body>
	<jsp:include page="Salon_Header.jsp"/>
	
	<div class="content text-center pt-3 pb-3">
		<div class="map col-sm-6 p-5">
			<h2>살롱, 시스트 찾아오는길</h2>
			<hr>
			<div id="map" style="width:100%;height:350px;"></div>
			<hr>
			<h6>서울특별시 마포구 월드컵북로 21 풍성빌딩 2F (홍대입구역 1번 출구 방면)</h6>
			<h6>☎ 02-336-8546</h6>
		</div>
	</div>
	
	<jsp:include page="Salon_Footer.jsp"/>
</body>
</html>