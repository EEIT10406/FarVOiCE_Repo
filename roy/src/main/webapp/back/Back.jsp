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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<!-- End JS -->
<script >

// 	var randomScalingFactor = function() {
// 		return Math.round(Math.random() * 100);
// 	};

// 	var config = {
// 		type : 'pie',
// 		data : {
// 			datasets : [ {
// 				data : [ randomScalingFactor(), randomScalingFactor(),
// 						randomScalingFactor(), randomScalingFactor(),
// 						randomScalingFactor(), ],
// 				backgroundColor : [ window.chartColors.red,
// 						window.chartColors.orange, window.chartColors.yellow,
// 						window.chartColors.green, window.chartColors.blue, ],
// 				label : 'Dataset 1'
// 			} ],
// 			labels : [ 'Red', 'Orange', 'Yellow', 'Green', 'Blue' ]
// 		},
// 		options : {
// 			responsive : true
// 		}
// 	};

// 	window.onload = function() {
// 		var ctx = document.getElementById('chart-area').getContext('2d');
// 		window.myPie = new Chart(ctx, config);
// 	};

// 	document.getElementById('randomizeData').addEventListener('click',
// 			function() {
// 				config.data.datasets.forEach(function(dataset) {
// 					dataset.data = dataset.data.map(function() {
// 						return randomScalingFactor();
// 					});
// 				});

// 				window.myPie.update();
// 			});

// 	var colorNames = Object.keys(window.chartColors);
// 	document.getElementById('addDataset').addEventListener('click', function() {
// 		var newDataset = {
// 			backgroundColor : [],
// 			data : [],
// 			label : 'New dataset ' + config.data.datasets.length,
// 		};

// 		for (var index = 0; index < config.data.labels.length; ++index) {
// 			newDataset.data.push(randomScalingFactor());

// 			var colorName = colorNames[index % colorNames.length];
// 			var newColor = window.chartColors[colorName];
// 			newDataset.backgroundColor.push(newColor);
// 		}

// 		config.data.datasets.push(newDataset);
// 		window.myPie.update();
// 	});

// 	document.getElementById('removeDataset').addEventListener('click',
// 			function() {
// 				config.data.datasets.splice(0, 1);
// 				window.myPie.update();
// 			});
</script>
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
										<div class="col-md-12">
											<div style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">主控台
											<div id="canvas-holder" style="width:100%">
												<canvas id="chart-area"></canvas>
											</div>
											<script>
												var randomScalingFactor = function() {
													return Math.round(Math.random() * 100);
												};
										
												var config = {
													type: 'pie',
													data: {
														datasets: [{
															data: [
																130,
																115,
																150,
																88,
																120,
															],
															backgroundColor: [
																 "rgb(67,156,231)",//blue
																 "rgb(255,98,130)",//red
																 "rgb(255,161,77)",//orange
																 "rgb(253,208,99)",//yeolow
																 "rgb(71,190,190)"
															],
															label: 'Dataset 1'
														}],
														labels: [
															'抒情',
															'搖滾',
															'流行',
															'電音',
															'嘻哈'
														]
													},
													options: {
														responsive: true
													}
												};
										
												window.onload = function() {
													var ctx = document.getElementById('chart-area').getContext('2d');
													window.myPie = new Chart(ctx, config);
												};
										
												document.getElementById('randomizeData').addEventListener('click', function() {
													config.data.datasets.forEach(function(dataset) {
														dataset.data = dataset.data.map(function() {
															return randomScalingFactor();
														});
													});
										
													window.myPie.update();
												});
										
											</script>
											</div>
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