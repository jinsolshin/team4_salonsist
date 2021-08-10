<%@page import="com.sun.jdi.Location"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.sist.vo.SalonSistVo"%>
<%@page import="com.sist.dao.SalonSistDao"%>
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
<body>
	<jsp:include page="Salon_Header.jsp"/>
	
	<%	
	request.setCharacterEncoding("UTF-8");
	
	try{
		String booker_name = request.getParameter("booker_name");
		String booker_phone = request.getParameter("booker_phone");
		int booker_pwd = Integer.parseInt(request.getParameter("booker_pwd"));
		String str_booker_date = request.getParameter("booker_date");
		String booker_time = request.getParameter("booker_time");
		String str_booker_designer = request.getParameter("booker_designer");
		int booker_menu = Integer.parseInt(request.getParameter("booker_menu"));
		int booker_detail = Integer.parseInt(request.getParameter("booker_detail"));

		Date booker_date = Date.valueOf(str_booker_date);
		
		int booker_designer = -1;
		switch(str_booker_designer) {
			case "김은영 원장": booker_designer = 1; break;
			case "신진솔 부원장": booker_designer = 2; break;
			case "김대영 실장": booker_designer = 3; break;
			case "정승원 실장": booker_designer = 4; break;
			case "김현욱 디자이너": booker_designer = 5; break;
			case "최정민 디자이너": booker_designer = 6; break;
		}
		
		SalonSistDao dao = SalonSistDao.getInstance();
		
		SalonSistVo v = new SalonSistVo();
		v.setBooker_name(booker_name);
		v.setBooker_phone(booker_phone);
		v.setBooker_pwd(booker_pwd);
		v.setBooker_date(booker_date);
		v.setBooker_time(booker_time);
		v.setD_no(booker_designer);
		v.setStyle_detail_no(booker_detail);
		
		int cnt = dao.getCnt(booker_date, booker_time);
		
		if(cnt == 0){
			dao.insertBooking(v);
			response.sendRedirect("Salon_Book_Success.jsp");
		}else{
			response.sendRedirect("Salon_Book_Fail.jsp");
		}
	}catch(Exception e){
		response.sendRedirect("Salon_Book_Fail.jsp");
	}
	%>
	
	<jsp:include page="Salon_Footer.jsp"/>
</body>
</html>