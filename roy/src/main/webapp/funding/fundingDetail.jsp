<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>募資詳細頁面</title>
<script type="text/javascript" src="../js/scripts.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>

<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- Favicon -->
<link href="favicon.ico" rel="shortcut icon">
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="../css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="../css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="../css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="../css/custom.css" rel="stylesheet">
<link rel="stylesheet" href="../css/funding.css" rel="stylesheet">
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div class="fundingDetail">

			<div class="detailHead">
				<h1>『the ONE table 一張桌子』為孩子開張團圓桌</h1>
				<p>
					由<a>the ONE table 一張桌子扶助計畫</a>提案
				</p>
			</div>

			<div class="c-1">
				<div class="detailImg">
					<img src="/roy/image/funding/hon.jpg">
				</div>
				<div class="schedule">
					<progress value="50" max="100"></progress>
				</div>
			</div>


			<div class="c-2">
				<div class="info-1">
					<h1>153980</h1>
					<p>目標150000</p>
				</div>
				<div class="info-2">
					<h1>167</h1>
					<p>人贊助</p>
				</div>
				<div class="info-3">
					<h1>12</h1>
					<p>天結束</p>
				</div>

				<blockquote class="blockquote">
					專案募資成功！<br>在 2019/01/31 00:00 募資結束前，您都可以持續贊助此計畫。
				</blockquote>

			</div>




			<div class="content-sup"></div>
			<div class="create-man"></div>
			<div class="ajax-content"></div>
			<div class="reward-card"></div>







		</div>




































		<!-- 	=== END CONTENT === -->

		<jsp:include page="../homePage/footer.jsp" />
	</div>
</body>
</html>