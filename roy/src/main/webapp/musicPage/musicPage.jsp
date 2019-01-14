<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	width: 50px;
	-webkit-filter: invert(100%);
	cursor: pointer;
}

.play2 {
	width: 50px;
	cursor: pointer;
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
				<div
					style="border-bottom: 0.5px solid #DDDDDD; align: center; height: 231px; margin-top: 30px; margin-bottom: 30px;">

					<img src="${musicPageBean.music_Image}" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />

					<div style="padding-top: 10px; font-size: 25px;">${musicPageBean.music_name}</div>

					<table style="margin-top: 10px;">
					     <tr>
							<td style="font-size: 13px; font-weight: bold;">發佈者:</td>
							<td style="padding: 3px;"><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname=${nickname}">${nickname}</a></td>
						</tr>
						<tr>
							<td style="font-size: 13px; font-weight: bold;">介紹:</td>
							<td style="padding: 3px;">${musicPageBean.music_caption}</td>
						</tr>
						<tr>
							<td style="font-size: 13px; font-weight: bold;">類型:</td>
							<td style="padding: 3px;">${musicPageBean.music_styleName}</td>
						</tr>
						<tr>
							<td style="font-size: 13px; font-weight: bold;">發佈時間:</td>
							<td style="padding: 3px;">
							<fmt:formatDate value="${musicPageBean.music_uploadTime}" type="date" />
							</td>
						</tr>
					</table>
					<table style="margin-top: 20px;">
						<tr>
							<td style="font-size: 16px; width: 70px;">喜歡</td>
							<td style="font-size: 16px; width: 70px;">播放次數</td>
						</tr>
						<tr>
							<td style="font-size: 16px; color: #FF3333;">${musicPageBean.music_likeCount}</td>
							<td style="font-size: 16px; color: #FF3333;">0</td>
						</tr>
					</table>
				</div>


				<!-- content begin -->
				<div style="margin-bottom: 30px;">

					<div style="font-size: 17px; color: #FF3333;padding:5px;">
						<img src="../img/player.png" class="play" />播放
					</div>
					<div style="background-color: #F5F5F5;border: 0.5px solid #DDDDDD;">

						<div style="margin-top: 25px; font-size: 20px; font-weight: bold;padding:10px;">歌詞</div>

						<div style="margin-top: 25px; font-size: 15px; letter-spacing: 0.5px; padding:10px;">
						   ${musicPageBean.music_lyric}
						</div>

					  </div>

				    </div>
				    
				    <hr>

				<!-- content end -->

				<!-- Comments -->
				<div id="comments"
					class="blog-recent-comments panel panel-default margin-bottom-30"
					style="">
					<div class="panel-heading">
						<h3>評論</h3>
					</div>
					<ul class="list-group" id="0106Test">
						<!-- Comment Form -->
						<li class="list-group-item">
							<div class="blog-comment-form">
								<div class="row margin-top-20">
									<div class="col-md-12">
										<div class="pull-left">
											<h3>留下評論</h3>
										</div>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-md-12">
										<form
											action="<c:url value="/personalPage/PostComment.controller"/>"
											method="post">
											<input hidden="true" value="${currentPost.post_idS}"
												name="post_idSReff"> <input hidden="true"
												value="${user.member_username}" name="member_username">

											<label>姓名</label>
											<div class="row margin-bottom-20">
												<div class="col-md-7 col-md-offset-0">
													<input class="form-control" type="text" id="name"
														readonly="readonly" value="${user.member_nickname}">
												</div>
											</div>
											<label>Email </label>
											<div class="row margin-bottom-20">
												<div class="col-md-7 col-md-offset-0">
													<input class="form-control" type="text" id="email"
														readonly="readonly" value="${user.member_email}">
												</div>
											</div>
											<label>內容</label>
											<div class="row margin-bottom-20">
												<div class="col-md-11 col-md-offset-0">
													<textarea class="form-control" rows="8" id="comment"
														name="post_content"></textarea>

												</div>
											</div>
											<p>
												<button class="btn btn-primary" type="submit" id="commit">送出</button>
											</p>
										</form>
									</div>
								</div>
							</div>
						</li>
						<!-- End Comment Form -->
					</ul>
				</div>
				<!-- End Comments -->


			</div>
		</div>
	</div>


	<jsp:include page="../homePage/footer.jsp" />
	<!-- 	<div id="player"> -->
	<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
	<!-- 	</div> -->
	
</body>
</html>