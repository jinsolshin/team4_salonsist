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
<script type="text/javascript">
	$(function() {
		document.getElementById("booker_date").value = new Date().toISOString().substring(0, 10);	
	});
	
	function detail_list(mVal) {
		var opt = $("#booker_detail option").length; 
		// menu의 <select>에서 value="0"를 눌렀다면 detail 배열의 텍스트에는 "-"를 value에는 "0"을 넣는다.
		if(mVal == "0") {
	        dText = new Array("-");
	        dVal = new Array("");
	    }else if(mVal == "1") {
	    	dText = new Array("-", "남성컷", "여성컷", "주니어컷", "앞머리컷");
	        dVal = new Array("", "1", "2", "3", "4");
	    }else if(mVal == "2") {
	    	dText = new Array("-", "일반펌", "디지털텀", "다운펌", "아이롱펌", "볼륨매직", "매직");
	        dVal = new Array("", "5", "6", "7", "8", "9", "10");
	    }else if(mVal == "3") {
	    	dText = new Array("-", "전체염색", "뿌리염색", "탈색");
	        dVal = new Array("", "11", "12", "13");
	    }else if(mVal == "4") {
	    	dText = new Array("-", "펌케어", "SIST케어");
	        dVal = new Array("", "14", "15");
	    }
		// 이 반복문이 없으면 대분류 왔다갔다할때 소분류가 섞임(펌 밑에 컷이 있고 케어 밑에 염색이 추가되어있음)
	    for(var i=0 ; i<opt ; i++) {
	       	booker_detail.options[0] = null;
	    }
	    for(var j=0 ; j<dText.length ; j++) {
	    	booker_detail.options[j] = new Option(dText[j], dVal[j]);
	    }
	}
	
	// input Number의 경우에 MaxLength가 적용되지 않는데, 4자리까지만 비밀번호를 받기 위한 함수
	function maxLengthCheck(object){
	    if(object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
</script>
</head>
<body>
	<jsp:include page="Salon_Header.jsp"/>
	
	<div class="content text-center pt-3 pb-3">
		<div class="book_form col-sm-5 p-5">
			<form class="text-center" action="./Salon_BookOK.jsp">
				<fieldset>
					<h2>살롱, 시스트 예약</h2>
					<hr>
					<div class="form-group text-start">
				    	<label for="booker_name" class="form-label mt-4">Name</label>
				    	<input type="text" required="required" class="form-control" id="booker_name" name="booker_name" aria-describedby="booker_name_help" placeholder="Enter Name">
				    	<small id="booker_name_help" class="form-text text-muted">이름을 입력해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_phone" class="form-label mt-4">Phone</label>
				    	<input type="number" value="010" required="required" maxlength="11" oninput="maxLengthCheck(this)" class="form-control" id="booker_phone" name="booker_phone" aria-describedby="booker_phone_help" placeholder="Enter Phone Number">
				    	<small id="booker_phone_help" class="form-text text-muted">연락처('-' 제외)를 입력해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_pwd" class="form-label mt-4">Password</label>
				    	<input type="number" required="required" maxlength="4" oninput="maxLengthCheck(this)" class="form-control" id="booker_pwd" name="booker_pwd" aria-describedby="booker_pwd_help" placeholder="Enter Password" style="-webkit-text-security: disc;">
				    	<small id="booker_pwd_help" class="form-text text-muted">예약 비밀번호(숫자 4자리)를 입력해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_date" class="form-label mt-4">Date</label>
				    	<input type="date" required="required" class="form-control" id="booker_date" name="booker_date" aria-describedby="booker_date_help" placeholder="Enter Date">
				    	<small id="booker_date_help" class="form-text text-muted">예약 날짜를 선택해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_time" class="form-label mt-4">Time</label>
						<select class="form-select" id="booker_time" name="booker_time">
							<option value="">-</option>
							<option>10:00</option>
							<option>11:00</option>
							<option>12:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
							<option>19:00</option>
							<option>20:00</option>
					    </select>
				    	<small id="booker_time_help" class="form-text text-muted">예약 시간을 선택해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_designer" class="form-label mt-4">Designer</label>
				    	<select class="form-select" id="booker_designer" name="booker_designer">
							<option value="">-</option>
							<option>김은영 원장</option>
							<option>신진솔 부원장</option>
							<option>김대영 실장</option>
							<option>정승원 실장</option>
							<option>김현욱 디자이너</option>
							<option>최정민 디자이너</option>
					    </select>
				    	<small id="booker_designer" class="form-text text-muted">담당 디자이너를 선택해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_menu" class="form-label mt-4">Menu</label>
						<select class="form-select" id="booker_menu" name="booker_menu" onchange="detail_list(this.value)">
							<option value="0">-</option>
							<option value="1">컷</option>
							<option value="2">펌</option>
							<option value="3">염색</option>
							<option value="4">클리닉</option>
					    </select>
				    	<small id="booker_menu_help" class="form-text text-muted">시술 종류를 선택해주세요.</small>
					</div>
					<div class="form-group text-start">
				    	<label for="booker_detail" class="form-label mt-4">Detail</label>
						<select class="form-select" id="booker_detail" name="booker_detail">
							<option value="">-</option>
					    </select>
				    	<small id="booker_detail_help" class="form-text text-muted">세부 시술 종류를 선택해주세요.</small>
					</div>
					
					<button type="submit" class="btn btn-outline-dark mt-4">Submit</button>
					<button type="reset" class="btn btn-outline-dark mt-4">Cancel</button>
				</fieldset>
			</form>
		</div>
	</div>
	
	<jsp:include page="Salon_Footer.jsp"/>
</body>
</html>