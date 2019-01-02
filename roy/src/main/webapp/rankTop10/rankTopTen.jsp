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
	height:70px;
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
<script>
	$(document).ready(function() {
		var music = document.querySelectorAll("img.music");
		var heart = document.querySelectorAll("img.heart");
		var heartCount = document.querySelectorAll("img.heartCount");
		for (var i = 0; i < music.length; i++) {
			music[i].addEventListener("mouseover", mouseOver);
			music[i].addEventListener("mouseout", mouseOut);
		}
		for (var i = 0; i < heart.length; i++) {
			heart[i].addEventListener("click", click);
		}
	})

	function mouseOver() {
		this.src = "../img/player.png";
	}

	function mouseOut() {
		this.src = "../img/left.JPG";
	}
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
				<div class="row margin-vert-30">

					<!-- Tab -->
					<div class="row tabs">
						<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="#imediate" data-toggle="tab">FarVoice
										即時熱門 </a></li>
								<li><a href="#allType" data-toggle="tab"> 所有類型 </a></li>
								<li><a href="#emotion" data-toggle="tab"> 抒情 </a></li>
								<li><a href="#rock" data-toggle="tab"> 搖滾 </a></li>
								<li><a href="#reggae" data-toggle="tab"> 雷鬼 </a></li>
								<li><a href="#blue" data-toggle="tab"> 藍調 </a></li>
								<li><a href="#dynamic" data-toggle="tab"> 動感 </a></li>
								<li><a href="#classic" data-toggle="tab"> 古典 </a></li>

							</ul>
						</div>
						<div class="col-sm-9">
							<div class="tab-content">
								<div class="tab-pane fade in active" id="imediate">

									<div class="row">
										<div class="col-md-7">
											<div
												style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">FarVoice
												即時熱門</div>
											<table>
												<tr>
													<th>排名</th>
													<th>歌曲名稱</th>
													<th>作者</th>
													<th>長度</th>
													<th>發佈時間</th>
												</tr>
												<tr>
													<td>1</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div> 
														
														<!-- addPlayList & createPlayList begin-->

														<div class="modal fade" id="addToPlayList"
															aria-hidden="true">
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

														<div class="modal fade" id="createPlayList"
															aria-hidden="true">
															<div class="modal-dialog" style="width: 300px;">
																<div class="modal-content">
																	<h5 style="margin: 10px;">建立歌單</h5>

																	<form>
																		<div class="modal-body">
																			<div class="form-group">
																				<input type="text" class="form-control"
																					placeHolder="請輸入歌單名稱" id="recipient-name">
																			</div>
																			<div class="form-group">
																				<select class="form-control">
																					<option>狀態 : 公開</option>
																					<option>狀態 : 隱藏</option>
																				</select>
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
														<!-- addPlayList & createPlayList end-->
														
														</td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>2</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>3</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>4</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>5</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>6</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>7</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>8</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>9</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>10</td>
													<td><img src="../img/left.JPG" class="music" /><a
														href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>

														<div>
															<img src="../img/emptyLove.png" class="heart"> <span
																class="heartCount"> 0</span> <span id="share"
																class="shareAndAdd"> <a href=""
																style="color: black;"><img src="../img/share.png"
																	width="15px" />分享</a>
															</span> <span class="dropdown"> <span id="add"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"><button type="button"
																		class="btn" style="outline: none;">
																		<img src="../img/add.png" width="15px">更多
																	</button></span> <span class="dropdown-menu"
																style="background-color: white;">
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#addToPlayList">加入歌單</button>
																	<button class="btn" style="outline: none;"
																		type="button" data-toggle="modal"
																		data-target="#createPlayList">建立歌單</button>
															</span>
															</span>


														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
											</table>

										</div>
									</div>
								</div>

								<div class="tab-pane fade in" id="allType">
									<div class="row">
										<div class="col-md-7">
											<div
												style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">所有類型</div>
											<table>
												<tr>
													<th>排名</th>
													<th>歌曲名稱</th>
													<th>作者</th>
													<th>長度</th>
													<th>發佈時間</th>
												</tr>
												<tr>
													<td>1</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>
														<div>

															<img src="emptyLove.png" class="love"> <span
																id="share" class="shareAndAdd"><a href=""
																style="color: black;"><img src="share.png"
																	width="15px" />分享</a> </span> <span class="dropdown"> <span
																class="shareAndAdd" id="add" data-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false"><a
																	href="" style="color: black;"><img src="add.png"
																		width="15px" />更多</a></span> <span class="dropdown-menu"
																style="background-color: white;"
																aria-labelledby="dropdownMenu2">
																	<button class="dropdown-item" type="button">加入歌單</button>
																	<button class="dropdown-item" type="button">建立歌單</button>
															</span>
															</span>

														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>2</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>
														<div>
															<img src="emptyLove.png" class="love">
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>3</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>
														<div>
															<img src="emptyLove.png" class="love">
														</div></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>4</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>5</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>6</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>7</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>8</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>9</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
												<tr>
													<td>10</td>
													<td><img src="left.JPG" class="music" /><a href=""><span
															style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a></td>
													<td>老蕭</td>
													<td>02:44</td>
													<td>2018-12-12</td>
												</tr>
											</table>

										</div>
									</div>
								</div>

								<div class="tab-pane fade in" id="emotion">
									<div class="row">
										<div class="col-md-5">
											<img src="img/fillers/filler3.jpg" alt="filler image">
										</div>
										<div class="col-md-7">
											<h3 class="no-margin no-padding">Mirum Est Notare</h3>
											<p>Typi non habent claritatem insitam; est usus legentis
												in iis qui facit eorum claritatem. Investigationes
												demonstraverunt lectores legere me lius quod ii legunt
												saepius. Claritas est etiam processus dynamicus, qui
												sequitur mutationem consuetudium lectorum. Mirum est notare
												quam littera gothicas.</p>
										</div>
									</div>
								</div>

								<div class="tab-pane fade in" id="rock">
									<p>Vivamus imperdiet condimentum diam, eget placerat felis
										consectetur id. Donec eget orci metus, Vivamus imperdiet
										condimentum diam, eget placerat felis consectetur id. Donec
										eget orci metus, ac adipiscing nunc. Pellentesque fermentum,
										ante ac interdum ullamcorper. Donec eget orci metus, ac
										adipiscing nunc. Pellentesque fermentum, consectetur id.</p>
									<ul>
										<li>Donec eget orci metus</li>
										<li>Ante ac interdum ullamcorper</li>
										<li>Vivamus imperdiet condimentum</li>
										<li>Pellentesque fermentum</li>
									</ul>
								</div>

								<div class="tab-pane fade in" id="reggae">
									<p>Typi non habent claritatem insitam; est usus legentis in
										iis qui facit eorum claritatem. Investigationes</p>
								</div>

								<div class="tab-pane fade in" id="blue">
									<p>Typi non habent claritatem insitam; est usus legentis in
										iis qui facit eorum claritatem. Investigationes</p>
								</div>

								<div class="tab-pane fade in" id="dynamic">
									<p>Typi non habent claritatem insitam; est usus legentis in
										iis qui facit eorum claritatem. Investigationes</p>
								</div>

								<div class="tab-pane fade in" id="classic">
									<p>Typi non habent claritatem insitam; est usus legentis in
										iis qui facit eorum claritatem. Investigationes</p>
								</div>

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
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>

</body>
</html>