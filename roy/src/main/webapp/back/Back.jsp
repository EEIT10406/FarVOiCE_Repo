<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>FarVoice</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<style>
th, td {
	border-collapse: collapse;
	font-size: 14px;
	border-bottom: 0.5px solid lightgrey;
}

table {
	width: 750px;
	height: 820px;
}

.btn {
	color: black;
	background-color: white;
	border: 0px;
}

.music {
	width: 70px;
	height: 70px;
}

.heart {
	width: 15px;
}

.shareAndAdd {
	width: 50px;
	margin-top: 5px;
	padding: 5px;
	font-size: 13px;
	margin-left: 10px;
}

.heartCount {
	margin-top: 10px;
	font-size: 13px;
}

.btnAddList {
	color: black;
	background-color: white;
	border: 0px;
}
</style>

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
<!-- JS -->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/scripts.js"></script>
<!-- Isotope - Portfolio Sorting -->
<script type="text/javascript" src="../js/jquery.isotope.js"></script>
<!-- Mobile Menu - Slicknav -->
<script type="text/javascript" src="../js/jquery.slicknav.js"></script>
<!-- Animate on Scroll-->
<script type="text/javascript" src="../js/jquery.visible.js"
	charset="utf-8"></script>
<!-- Sticky Div -->
<script type="text/javascript" src="../js/jquery.sticky.js"
	charset="utf-8"></script>
<!-- Slimbox2-->
<script type="text/javascript" src="../js/slimbox2.js" charset="utf-8"></script>
<!-- Modernizr -->
<script src="../js/modernizr.custom.js"></script>
<!-- End JS -->

</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="row margin-vert-30">

					<!--目錄-->
					<div class="row tabs">
						<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="#imediate" data-toggle="tab">主控台 </a></li>
								<li><a href="#allType" data-toggle="tab">募資管理 </a></li>
								<li><a href="#emotion" data-toggle="tab">輪播管理</a></li>
								<li><a href="#rock" data-toggle="tab">檢舉管理</a></li>
							 </ul>
					</div>
					<!--目錄-->
						
						<div class="col-sm-9">
							<div class="tab-content">
								<div class="tab-pane fade in active" id="imediate">
									<div class="row">
										<div class="col-md-7">
											<div
												style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">主控台</div>

										</div>
									</div>
								</div>
								
								<!--=-----allType 募資管理 Begin -->
								<div class="tab-pane fade in" id="allType">
									<div class="row">
										<div class="col-md-7">
											<div
												style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">募資管理</div>
										
										</div>
									</div>
								</div> 
								<!--=-----allType 募資管理 END -->
								
								<!--=-----emotion Begin 輪播控管 -->
								<div class="tab-pane fade in" id="emotion">
									<div class="row">
										<div class="col-md-5">
											<div
												style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">輪播控管</div>
											
										</div>
										<div class="col-md-7">
										</div>
									</div>
								</div>
								<!--=-----emotion END 輪播控管 -->
								
								
								<!--=-----rock Begin 檢舉管理 -->
								<div class="tab-pane fade in" id="rock">
									<div class="row">
										<div class="col-md-5">
											<div
												style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">檢舉管理</div>
											
										</div>
										<div class="col-md-7">
										</div>
									</div>
								</div>
								<!--=-----rock END 檢舉管理管 -->
								
								
								
								
								
							</div>
						</div>
					</div>
					<!-- Tab -->
				</div>
			</div>
		</div>
	</div>
	<!-- === END CONTENT === -->




	<jsp:include page="../homePage/footer.jsp" />

						


</body>
</html>