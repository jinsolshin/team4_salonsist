<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살롱, 시스트</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

  <script>
    $(document).ready(function(){
      $('.slider').bxSlider();
      slideWidth: 100
    });
  </script>
</head>
<body>
<jsp:include page="Salon_Header.jsp"/>
  <div class="slider">
    <div>
    	<a href="#"><img class="logo" src="./img/슬라이드1.jpg"></a>
    </div>
    <div>I am another slide.</div>
  </div>
<div class="content col-8" style="float: none; margin: 0 auto;">

</div>
<jsp:include page="Salon_Footer.jsp"/>
</body>
</html>