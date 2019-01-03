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

.btnAddList {
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
	border: 1px solid black;
	margin: 10px;
	width: 180px;
	margin: 10px;
}

.listType {
	list-style-type: none;
	font-size: 15px;
}
.list{
width: 160px;height: 160px;background: url("../img/right.JPG") no-repeat; background-size:160px 160px;
}
.listSongCount{
border:1px solid black;width:50px;height:50px;background-color:black;color:white;font-size:20px;margin-left:0;
padding:11px;
text-align:center;
word-wrap:break-word; 
word-break:break-all;
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
		var follows = document.querySelectorAll("div.follow");
		var unfollows = document.querySelectorAll("div.unfollow");
		
		for (var i = 0; i < follows.length; i++) {
			follows[i].addEventListener("click", followClick);
		}
		for (var i = 0; i < unfollows.length; i++) {
			unfollows[i].addEventListener("click", followClick);
		}
	})

	function followClick() {
		if ($(this).attr("class") == "follow") {
			$(this).attr("class", "unfollow");
			$(this).html('追蹤');

		} else {
			$(this).attr("class", "follow");
			$(this).html('已追蹤');
		}
	}

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
					<div class="unfollow">追蹤</div>

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

						<div class="tab-pane fade in" style="overflow: auto;" id="music">

							<div class="col-md-5" style="float: left; width: 300px;">
								<a href=""><img src="../img/love.png"
									style="width: 160px; height: 160px;" /></a>

								<div style="font-size: 16px;">讓我為你唱情歌</div>
								<div>
									<img src="../img/emptyLove.png" class="heart"> 
									<span
										class="heartCount"> 0</span> 
									<span id="share"
										class="shareAndAdd"> 
										<a href="" style="color: black;"><img
											src="../img/share.png" width="15px" />分享</a>
									</span>
									 <span id="add">

										<button type="button" class="btnAddList" data-toggle="modal"
											data-target="#addList" style="outline: none;">
											<img src="../img/add.png" width="15px">加入歌單
										</button>

									</span>
								</div>
							</div>
							
							
							<div class="col-md-5" style="float: left; width: 300px;">
								<a href=""><img src="../img/love.png"
									style="width: 160px; height: 160px;" /></a>

								<div style="font-size: 16px;">讓我為你唱情歌</div>
								<div>
									<img src="../img/emptyLove.png" class="heart"> 
									<span
										class="heartCount"> 0</span> 
									<span id="share"
										class="shareAndAdd"> 
										<a href="" style="color: black;"><img
											src="../img/share.png" width="15px" />分享</a>
									</span>
									 <span id="add">

										<button type="button" class="btnAddList" data-toggle="modal"
											data-target="#addList" style="outline: none;">
											<img src="../img/add.png" width="15px">加入歌單
										</button>

									</span>
								</div>
							</div>
							
							
							<div class="col-md-5" style="float: left; width: 300px;">
								<a href=""><img src="../img/love.png"
									style="width: 160px; height: 160px;" /></a>

								<div style="font-size: 16px;">讓我為你唱情歌</div>
								<div>
									<img src="../img/emptyLove.png" class="heart"> 
									<span
										class="heartCount"> 0</span> 
									<span id="share"
										class="shareAndAdd"> 
										<a href="" style="color: black;"><img
											src="../img/share.png" width="15px" />分享</a>
									</span>
									 <span id="add">

										<button type="button" class="btnAddList" data-toggle="modal"
											data-target="#addList" style="outline: none;">
											<img src="../img/add.png" width="15px">加入歌單
										</button>

									</span>
								</div>
							</div>

						</div>
						<div class="tab-pane fade in" style="overflow: auto;" id="list">
						
						<div class="col-md-5" style="float: left; width: 300px;">
												
								<a href="">
								<div class="list">					
									<div class="listSongCount">2</div>
								</div>
								</a>	
					
								<div style="font-size: 16px;">蕭氏情歌精選</div>
								<div>
									<img src="../img/emptyLove.png" class="heart"> 
									<span
										class="heartCount"> 0</span> 
									<span id="share"
										class="shareAndAdd"> 
										<a href="" style="color: black;"><img
											src="../img/share.png" width="15px" />分享</a>
									</span>
									 <span id="add">

										<button type="button" class="btnAddList" data-toggle="modal"
											data-target="#addList" style="outline: none;">
											<img src="../img/add.png" width="15px"/>加入歌單
										</button>

									</span>
									<span>
									<a href="../list/editList.jsp" style="color:black;"><img src="../img/edit.png" width="17px"/>編輯</a>
									</span>
								</div>
							</div>

						
						
						</div>
						<div class="tab-pane fade in" style="overflow: auto;" id="like">


							<div class="col-md-5" style="float: left; width: 300px;">
								<a href=""><img src="../img/love.png"
									style="width: 160px; height: 160px;" /></a>

								<div style="font-size: 16px;">讓我為你唱情歌</div>
								<div>
									<img src="../img/emptyLove.png" class="heart"> 
									<span
										class="heartCount"> 0</span> 
									<span id="share"
										class="shareAndAdd"> 
										<a href="" style="color: black;"><img
											src="../img/share.png" width="15px" />分享</a>
									</span>
									 <span id="add">

										<button type="button" class="btnAddList" data-toggle="modal"
											data-target="#addList" style="outline: none;">
											<img src="../img/add.png" width="15px">加入歌單
										</button>

									</span>
								</div>
							</div>

						</div>

						<div class="tab-pane fade in" id="about">
							<!-- about begin -->
							<div class="row tabs">
								<div class="col-sm-3">
									<ul class="listType">
										<li class="active"
											style="border-bottom: 1px solid #D3D3D3; padding: 10px;">
											<a href="#introduce" data-toggle="tab">詳細介紹</a>
										</li>
										<li style="border-bottom: 1px solid #D3D3D3; padding: 10px;">
											<a href="#following" data-toggle="tab">追蹤名單</a>
										</li>
										<li style="border-bottom: 1px solid #D3D3D3; padding: 10px;">
											<a href="#fans" data-toggle="tab">粉絲</a>
										</li>

									</ul>
								</div>
								<div class="col-sm-9">
									<div class="tab-content">
										<div class="tab-pane fade in active" id="introduce">
											<div class="row">

												<div class="col-md-5">
													<h3 class="no-margin no-padding">詳細介紹</h3>
													<p style="margin-top: 15px;">地區：台灣, 臺北市</p>
													<p>性別：</p>
												</div>
												
												<div class="col-md-7">
													<div style="float: right;"><a href="personalDetail.jsp">編輯</a></div>
												</div>
												
											</div>
										</div>
										<div class="tab-pane fade in" id="following">
											<h3 class="no-margin no-padding"
												style="border-bottom: 1px solid #D3D3D3; margin-bottom: 15px;">追蹤名單</h3>

											<div class="row">
												<div class="col-md-5">
													<img src="../img/left.JPG"
														style="margin-top: 15px; width: 100px; height: 100px;" />
													<span
														style="margin-left: 10px; margin-top: 5px; font-size: 18px;">安董</span>
												</div>
												<div class="col-md-7">
													<div class="follow" style="float: right; margin-top: 50px;">已追蹤</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-5">
													<img src="../img/left.JPG"
														style="margin-top: 15px; width: 100px; height: 100px;" />
													<span
														style="margin-left: 10px; margin-top: 5px; font-size: 18px;">安董</span>
												</div>
												<div class="col-md-7">
													<div class="follow" style="float: right; margin-top: 50px;">已追蹤</div>
												</div>
											</div>

										</div>

										<div class="tab-pane fade in" id="fans">

											<h3 class="no-margin no-padding"
												style="border-bottom: 1px solid #D3D3D3; margin-bottom: 15px;">粉絲</h3>

											<div class="row">
												<div class="col-md-5">
													<img src="../img/left.JPG"
														style="margin-top: 15px; width: 100px; height: 100px;" />
													<span
														style="margin-left: 10px; margin-top: 5px; font-size: 18px;">安董</span>
												</div>
												<div class="col-md-7">
													<div class="follow" style="float: right; margin-top: 50px;">已追蹤</div>
												</div>
											</div>


											<div class="row">
												<div class="col-md-5">
													<img src="../img/left.JPG"
														style="margin-top: 15px; width: 100px; height: 100px;" />
													<span
														style="margin-left: 10px; margin-top: 5px; font-size: 18px;">安董</span>
												</div>
												<div class="col-md-7">
													<div class="follow" style="float: right; margin-top: 50px;">已追蹤</div>
												</div>
											</div>

										</div>

									</div>
								</div>
							</div>
							<!-- about end -->

						</div>

					</div>
				</div>
				<!-- End Tab v2 -->
			</div>
		</div>
	</div>
	<!-- === END CONTENT === -->
	
	<!-- addPlayList begin-->
								
							<div class="modal fade" id="addList" aria-hidden="true">
										<div class="modal-dialog" style="width: 300px;">
											<div class="modal-content">
												<h5 style="margin: 10px;">加入歌單</h5>
												<form>
													<div class="modal-body">

														<div class="form-group">
															<select class="form-control">
																<option>歌單名稱</option>
															</select>
														</div>
														<div style="float:right;">
														<a href="" >建立歌單</a>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															data-dismiss="modal">取消</button>
														<button type="button" class="btn btn-primary">確定</button>
													</div>
												</form>
												
											</div>
										</div>
									</div>							
							
							<!-- addPlayList end-->
	

	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
</body>
</html>