<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<style>
td {
	font-size: 17px;
	width: 75px;
	padding: 2px;
}

table {
	margin-top: 100px;
}

.number {
	color: #FF3333;
}

.unfollow {
	cursor: pointer;
	padding: 3px;
	margin-top: 10px;
	border: 0.5px solid #888888;
	width: 90px;
	float: left;
	text-align: center;
}

.follow {
	cursor: pointer;
	padding: 3px;
	margin-top: 10px;
	border: 0.5px solid #888888;
	width: 90px;
	float: left;
	text-align: center;
	background-color: #888888;
	color: #FFFFFF;
}

.dynamic {
	background-color: #F5F5F5;
	height: 200px;
	margin: 20px;
}

.heart {
	width: 17px;
}

.btn {
	color: black;
	background-color: white;
	border: 0px;
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
	font-size: 15px;
}

.music {
	border: 1px solid black; margin : 10px;
	width: 180px;
	margin: 10px;
}
</style>
<script>
	$(document).ready(function() {
		$('#login').click(function() {
			window.location.href = "login.jsp";
		})
		$('#upload').click(function() {
			window.location.href = "upload.jsp";
		})

		$('#follow').click(function() {
			if ($('#follow').attr("class") == "follow") {
				$('#follow').attr("class", "unfollow");
				$('#follow').html('追蹤');
			} else {
				$('#follow').attr("class", "follow");
				$('#follow').html('已追蹤');
			}
		})

	})
</script>
<script>
	$(document).ready(function() {
		var heart = document.querySelectorAll("img.heart");
		for (var i = 0; i < heart.length; i++) {
			heart[i].addEventListener("click", click);
		}
	})

	function click() {
		if (this.src.indexOf("love.png") != -1) {
			this.src = "../img/emptyLove.png";
		} else {
			this.src = "../img/love.png"
		}
	}
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div
					style="border: 0.5px solid #DDDDDD; align: center; height: 231px; margin-top: 30px; margin-bottom: 30px;">
					<img src="../img/left.JPG"
						style="float: left; height: 230px; width: 230px; margin-right: 15px;" />
					<div style="padding: 15px; font-size: 30px;">阿腫</div>
					<div id="follow" class="unfollow">追蹤</div>

					<table>
						<tr>
							<td>音樂</td>
							<td>粉絲</td>
							<td>追蹤中</td>
						</tr>
						<tr>
							<td class="number">0</td>
							<td class="number">0</td>
							<td class="number">0</td>
						</tr>
					</table>


				</div>

				<!-- Tab v2 -->
				<div class="tabs alternative">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#dynamic" data-toggle="tab">動態</a>
						</li>
						<li><a href="#music" data-toggle="tab">音樂</a></li>
						<li><a href="#list" data-toggle="tab">歌單</a></li>
						<li><a href="#like" data-toggle="tab">喜歡</a></li>
						<li><a href="#about" data-toggle="tab">關於</a></li>
					</ul>
					<div class="tab-content" style="height: auto;">

						<div class="tab-pane fade in active" id="dynamic">
							<div class="dynamic"></div>
							<div class="dynamic"></div>
							<div class="dynamic"></div>
							<div class="dynamic"></div>
						</div>

						<div class="tab-pane fade in" style="overflow:auto;" id="music">


							<div>
								<div class="col-md-5" style="float:left;width:300px;">
									<a href=""><img src="../img/love.png"
										style="width: 160px; height: 160px;" /></a>

									<div style="font-size: 16px;">讓我為你唱情歌</div>
									<div>
										<img src="../img/emptyLove.png" class="heart"> <span
											class="heartCount"> 0</span> <span id="share"
											class="shareAndAdd"> <a href="" style="color: black;"><img
												src="../img/share.png" width="15px" />分享</a>
										</span> <span class="dropdown"> <span id="add"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"><button type="button"
													class="btn" style="outline: none;">
													<img src="../img/add.png" width="15px">更多
												</button></span> <span class="dropdown-menu"
											style="background-color: white;">
												<button class="btn" style="outline: none;" type="button"
													data-toggle="modal" data-target="#addToPlayList">加入歌單</button>
												<button class="btn" style="outline: none;" type="button"
													data-toggle="modal" data-target="#createPlayList">建立歌單</button>
										</span>
										</span>
									</div>

								</div>
							
							
							
							
							
								<div class="col-md-5" style="float:left;width:300px;">
									<a href=""><img src="../img/love.png"
										style="width: 160px; height: 160px;" /></a>

									<div style="font-size: 16px;">讓我為你唱情歌</div>
									<div>
										<img src="../img/emptyLove.png" class="heart"> <span
											class="heartCount"> 0</span> <span id="share"
											class="shareAndAdd"> <a href="" style="color: black;"><img
												src="../img/share.png" width="15px" />分享</a>
										</span> <span class="dropdown"> <span id="add"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"><button type="button"
													class="btn" style="outline: none;">
													<img src="../img/add.png" width="15px">更多
												</button></span> <span class="dropdown-menu"
											style="background-color: white;">
												<button class="btn" style="outline: none;" type="button"
													data-toggle="modal" data-target="#addToPlayList">加入歌單</button>
												<button class="btn" style="outline: none;" type="button"
													data-toggle="modal" data-target="#createPlayList">建立歌單</button>
										</span>
										</span>
									</div>



								</div>
							</div>


						</div>
						<div class="tab-pane fade in" id="list"></div>
						<div class="tab-pane fade in" id="like"></div>

						<div class="tab-pane fade in" id="about"></div>

					</div>
				</div>
				<!-- End Tab v2 -->
			</div>
		</div>
	</div>

	<!-- === END CONTENT === -->

	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
</body>
</html>