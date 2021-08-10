<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살롱, 시스트 예약</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/Salon.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<script type="text/javascript">
	$(function() {
		$("#mainGo").click(function() {
			location.href="Salon_Main.jsp";
		});
		$("#bookGo").click(function() {
			location.href="Salon_Book_Check.jsp";
		});
	});
</script>
<body>
	<jsp:include page="Salon_Header.jsp"/>
	
	<div class="content text-center pt-3 pb-3">
		<div class="book_form col-sm-5 p-5">
			<form class="text-center" action="./Salon_BookOK.jsp">
				<fieldset>
					<h2>살롱, 시스트 예약 완료</h2>
					<hr>
					<h6>기쁜 마음으로 예약일에 만나 뵙겠습니다.</h6>
					<hr>
					<button type="button" id="bookGo" class="btn btn-outline-dark mt-4">LookUp</button>
					<button type="button" id="mainGo" class="btn btn-outline-dark mt-4">Main</button>
				</fieldset>
			</form>
		</div>
	</div>
	
	<jsp:include page="Salon_Footer.jsp"/>
</body>
</html>