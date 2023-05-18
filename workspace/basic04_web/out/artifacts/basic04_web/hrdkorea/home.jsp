<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	<%@ include file="" %>               -> JSP 디렉티브
	<jsp:include page=""></jsp:include>  ->	액션 태그
--%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap_Morph.min.css">
	<title>home.jsp</title>
	<style>
		body{margin:50px;}
		#wrap{
			height: auto;
			min-height: 100%;
			padding-bottom: 30px;
		}
		footer{
			height: 30px;
			position: relative;
			transform: translateY(-100%);
			text-align:center;
		}
		nav{padding-bottom: 30px;}
		.headerdiv{margin:10px;}
		h3{text-align:center; padding-bottom :15px;}
		img{width:500px; display:block; margin:auto; padding-right: 50px;}
	</style>
</head>
<body>
	<div id="wrap">
	<!-- header -->
	<header>
		<div class="headerdiv">
			<h3>여행 예약 프로그램</h3>
		</div>
	</header>
	
	<!-- nav -->
	<nav>
		<div class="container-fluid">
			<ul class="nav nav-tabs" role="tablist">
			   <li class="nav-item" role="presentation">
			      <a class="nav-link active" data-bs-toggle="tab" href="home.jsp" aria-selected="false" role="tab" tabindex="-1">홈으로</a>
			   </li>
			   <li class="nav-item" role="presentation">
			      <a class="nav-link" data-bs-toggle="tab" href="travelBook.jsp" aria-selected="false" role="tab" tabindex="-1">예약등록</a>
			   </li>
			   <li class="nav-item" role="presentation">
			      <a class="nav-link" data-bs-toggle="tab" href="travelList.jsp" aria-selected="false" role="tab" tabindex="-1">예약조회</a>
			   </li>
			</ul>
		</div>
	</nav>
	
	<!-- main -->
	<section>
		<img src="../images/pngegg.png" alt="여행">
	</section>
	</div>
	<!-- footer -->
	<footer>
		<p>
			KOREA Copyright&copy;2018 All rights reserved.<br>
			Human Resources Development Service of Korea.
		</p>
	</footer>
	</div>
	</body>
</html>