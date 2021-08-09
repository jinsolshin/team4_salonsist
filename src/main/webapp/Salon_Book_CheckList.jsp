<%@page import="com.sist.vo.SalonSistVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.SalonSistDao"%>
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
<script type="text/javascript">
	function confirmDelete(booker_num){
		var re = confirm("정말로 삭제하시겠습니까?");
		if(re == true){
			location.href = "deleteBooking.do?booker_num="+booker_num;
		}else{
			return;
		}
	}
</script>
</head>
<body>
	<jsp:include page="Salon_Header.jsp"/>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String booker_name = request.getParameter("booker_name");
		String booker_phone = request.getParameter("booker_phone");
		int booker_pwd = Integer.parseInt(request.getParameter("booker_pwd"));
		
		SalonSistDao dao = SalonSistDao.getInstance();
		boolean nameRe = dao.isCorrectName(booker_name);
		boolean phoneRe = dao.isCorrectPhone(booker_phone);
		boolean pwdRe = dao.isCorrectPwd(booker_pwd);
		
		if(nameRe==false && phoneRe==true && pwdRe==true){
	%>
			<script>
				alert("이름을 확인해주세요.");
				location.href="./Salon_Book_Check.jsp";
			</script>
	<%
		}else if(nameRe==true && phoneRe==false && pwdRe==true){
	%>
			<script>
				alert("연락처를 확인해주세요.");
				location.href="./Salon_Book_Check.jsp";
			</script>
	<%
		}else if(nameRe==true && phoneRe==true && pwdRe==false){
	%>
			<script>
				alert("비밀번호를 확인해주세요.");
				location.href="./Salon_Book_Check.jsp"
			</script>
	<%
		}else if(pwdRe==true && phoneRe==true && nameRe==true){
	%>
			<script>
				location.href="./Salon_Book_CheckList.jsp?booker_name="+booker_name+"&booker_phone="+booker_phone+"&booker_pwd="+booker_pwd;
			</script>
	<%		
		}else{
	%>
			<script>
				alert("입력 정보들을 확인해주세요.");
				location.href="./Salon_Book_Check.jsp";
			</script>
	<%		
		}

		ArrayList<SalonSistVo> list = dao.find(booker_pwd, booker_name, booker_phone);
	%>
	
	<div class="content text-center pt-3 pb-3">
		<div class="book_form col-sm-8 p-5">
			<h2>살롱, 시스트 예약 조회</h2>
			<hr>
			<table class="table table-hover" style="border: 1px gray solid;">
				<thead>
			    	<tr class="table-active">
						<th scope="col">예약번호</th>
						<th scope="col">예약날짜</th>
						<th scope="col">예약시간</th>
						<th scope="col">시술종류</th>
						<th scope="col">시술상세</th>
						<th scope="col">디자이너</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(SalonSistVo v:list){
							%>
							<tr>
								<td><%=v.getBooker_num() %></td>
								<td><%=v.getBooker_date() %></td>
								<td><%=v.getBooker_time() %></td>
								<td><%=v.getStyle_name() %></td>
								<td><%=v.getStyle_detail_name() %></td>
								<td><%=v.getD_name() %></td>
								<td><a href="#" onclick="confirmDelete(<%=v.getBooker_num()%>)" id="status">삭제</a></td>
							</tr>
							<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	
	<jsp:include page="Salon_Footer.jsp"/>
</body>
</html>