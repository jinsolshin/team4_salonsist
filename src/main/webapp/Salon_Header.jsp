<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살롱, 시스트</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/Salon.css" type="text/css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<header>
<div class="header-title">
<a href="Salon_Main.jsp"><img class="logo" src="./img/logo.png"></a>
</div>
</header>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-around" id="navbarColor03">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active ms-sm-5 me-sm-5" href="Salon_Main.jsp">홈으로
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ms-sm-5 me-sm-5" href="Salon_Designer.jsp">디자이너</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ms-sm-5 me-sm-5" href="Salon_Book.jsp">예약</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ms-sm-5 me-sm-5" href="Salon_Book_Check.jsp">예약조회</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ms-sm-5 me-sm-5" href="Salon_Map.jsp">찾아오는길</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>