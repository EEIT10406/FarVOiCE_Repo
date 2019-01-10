<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarVoice</title>
<link href="favicon.ico" rel="shortcut icon">
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="../css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="../css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="../css/responsive.css" rel="stylesheet">
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
<script src="../js/modernizr.custom.js" type="text/javascript"></script>
<!-- End JS -->

<style>
.play {
	width: 60px;
	-webkit-filter: invert(100%);
}

.play2 {
	width: 60px;
}
</style>
<script>
	$(document).ready(function() {

		$('.play').on('mouseover', function() {
			this.setAttribute("class", "play2")
		})

		$('.play').on('mouseout', function() {
			this.setAttribute("class", "play");
		})

	})
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div style="border-bottom: 0.5px solid #DDDDDD; align: center; height: 180px; margin-top: 30px; margin-bottom: 20px;">

					<img src="../img/how.jpg"
						style="float: left; height: 180px; width: 180px; margin-right: 15px;" />

					<div style="padding-top: 10px; font-size: 25px;">聲林之王精選</div>

					<table style="margin-top: 20px;">
						<tr>
							<td style="font-size: 13px; font-weight: bold;">歌曲數量</td>
							<td></td>
						</tr>
						
						<tr>
							<td style="font-size: 13px; font-weight: bold;">發佈時間</td>
							<td></td>
						</tr>
					</table>
					
				</div>


				<!-- content begin -->
				<div style="margin-bottom:150px;">

		<table style="width: 700px;height:230px;">
				<thead>
					<tr >
					    <th style="height:50px;"></th>
						<th style="height:50px;">歌曲名稱</th>
						<th style="height:50px;">發佈者</th>
						<th style="height:50px;">發佈時間</th>
	
					</tr>
				</thead>
				<tbody>
					<tr>
					    <td style="text-align:center">
						<img src="../img/player.png" class="play" />
					    </td>
						<td>
						<img src="../img/left.JPG" style="width: 70px; height: 70px;" />
						   讓我為你唱情歌
						</td>
						<td style="font-size: 15px;">敬騰</td>
						<td style="font-size: 15px;">2018-12-12</td>
					</tr>
					
					<tr>
					    <td style="text-align:center">
						<img src="../img/player.png" class="play" />
					    </td>
						<td>
						<img src="../img/left.JPG" style="width: 70px; height: 70px;" />
						   讓我為你唱情歌
						</td>
						<td style="font-size: 15px;">敬騰</td>
						<td style="font-size: 15px;">2018-12-12</td>
					</tr>
				</tbody>
				
			</table>
					
					


				</div>

				<!-- content end -->


			</div>
		</div>
		</div>


		<jsp:include page="../homePage/footer.jsp" />
		<!-- 	<div id="player"> -->
		<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
		<!-- 	</div> -->
</body>
</html>