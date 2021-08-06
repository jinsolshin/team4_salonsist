<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String booker_name = request.getParameter("booker_name");
	String booker_phone = request.getParameter("booker_phone");
	int booker_pwd = Integer.parseInt(request.getParameter("booker_pwd"));
	String str_booker_date = request.getParameter("booker_date");
	String booker_time = request.getParameter("booker_time");
	String str_booker_designer = request.getParameter("booker_designer");
	int booker_menu = Integer.parseInt(request.getParameter("booker_menu"));
	int booker_detail = Integer.parseInt(request.getParameter("booker_detail"));

	// booker_menu, booker_detail은 왜인지 모르겠지만 문자열이 아닌 숫자값이 전달되어서 바로 형변환이 가능하다...
	// 하지만 booker_designer는 전달된 값이 한글 문자열이기 때문에 
	// int booker_designer = Integer.parseInt(request.getParameter("booker_designer"));처럼 바로 형변환을 할 수 없다.
	// switch문을 사용하여 int booker_designer 값을 각각 담은 후 Vo에 전달하기위해 int로 형변환을 해야한다. 
	int booker_designer = -1;
	switch(str_booker_designer) {
		case "김은영 원장": booker_designer = 1; break;
		case "신진솔 부원장": booker_designer = 2; break;
		case "김대영 실장": booker_designer = 3; break;
		case "정승원 실장": booker_designer = 4; break;
		case "김현욱 디자이너": booker_designer = 5; break;
		case "최정민 디자이너": booker_designer = 6; break;
	}
	/*
	int booker_menu = Integer.parseInt(str_booker_menu);
	int booker_detail = Integer.parseInt(str_booker_detail);
	if(str_booker_menu.equals("1")) {
		switch(str_booker_detail) {
			case "남성컷": booker_detail = 1; break;
			case "여성컷": booker_detail = 2; break;
			case "주니어컷": booker_detail = 3; break;
			case "앞머리컷": booker_detail = 4; break;
		}
	}else if(str_booker_menu.equals("2")){
		switch(str_booker_detail) {
			case "일반펌": booker_detail = 5; break;
			case "디지털텀": booker_detail = 6; break;
			case "다운펌": booker_detail = 7; break;
			case "아이롱펌": booker_detail = 8; break;
			case "볼륨매직": booker_detail = 9; break;
			case "매직": booker_detail = 10; break;		
		}
	}else if(str_booker_menu.equals("3")){
		switch(str_booker_detail) {
			case "전체염색": booker_detail = 11; break;
			case "뿌리염색": booker_detail = 12; break;
			case "탈색": booker_detail = 13; break;		
		}
	}else if(str_booker_menu.equals("4")){
		switch(str_booker_detail) {
			case "펌케어": booker_detail = 14; break;
			case "SIST케어": booker_detail = 15; break;		
		}
	}*/
	
	Date booker_date = Date.valueOf(str_booker_date);
	%>
	
	예약자명: <%=booker_name %><br>
	연락처: <%=booker_phone %><br>
	비밀번호: <%=booker_pwd %><br>
	str 날짜: <%=str_booker_date %><br>
	Date 날짜: <%=booker_date %><br>
	예약 시간: <%=booker_time %><br>
	디자이너: <%=booker_designer %><br>
	시술분류: <%=booker_menu %><br>
	세부시술: <%=booker_detail %><br>
</body>
</html>