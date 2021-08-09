<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살롱, 시스트 예약조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/Salon.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="Salon_Header.jsp"/>
	
	<div class="content text-center pt-3 pb-3">
		<div class="book_form col-sm-5 p-5">
			<form action="Salon_Book_CheckList.jsp" class="text-center">
				<fieldset>
					<h2>살롱, 시스트 예약 조회</h2>
					<hr>
					<div class="form-group text-start">
				    	<label for="booker_name" class="form-label mt-4">Name</label>
				    	<input type="text" class="form-control" name="booker_name" id="booker_name" aria-describedby="booker_name_help" placeholder="Enter Name" required="required">
				    	<small id="booker_name_help" class="form-text text-muted">이름을 입력해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_phone" class="form-label mt-4">Phone</label>
				    	<input type="text" class="form-control" name="booker_phone" id="booker_phone" aria-describedby="booker_phone_help" placeholder="Enter Phone Number" required="required">
				    	<small id="booker_phone_help" class="form-text text-muted">연락처('-' 제외)를 입력해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_pwd" class="form-label mt-4">Password</label>
				    	<input type="password" class="form-control" name="booker_pwd" id="booker_pwd" aria-describedby="booker_pwd_help" placeholder="Enter Password" required="required">
				    	<small id="booker_pwd_help" class="form-text text-muted">예약 비밀번호(숫자 4자리)를 입력해주세요.</small>
					</div>
					<button type="submit" class="btn btn-outline-dark mt-4" onclick="check_val()">Submit</button>
					<button type="reset" class="btn btn-outline-dark mt-4">Cancel</button>
				</fieldset>
			</form>
		</div>
	</div>
	
	<jsp:include page="Salon_Footer.jsp"/>
</body>
</html>