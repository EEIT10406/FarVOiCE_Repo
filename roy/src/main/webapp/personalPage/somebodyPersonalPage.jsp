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
<link href="favicon.ico" rel="shortcut icon">

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="../css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="../css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="../css/responsive.css" rel="stylesheet">
<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"
	rel="stylesheet" type="text/css">
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<style>
.post {
	float: left;

	/* 	margin-top:30px; */
	/* 	margin-bottom:150px; */
}

* {
	font-family: 微軟正黑體;
}

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
	background-color: #dcdcdc;
	height: 200px;
	margin: 20px;
}

.heart {
	width: 17px;
	margin-right: 5px;
	cursor: pointer;
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

.listSongCount {
	border: 1px solid black;
	width: 50px;
	height: 50px;
	background-color: black;
	color: white;
	font-size: 20px;
	margin-left: 0;
	padding: 11px;
	text-align: center;
	word-wrap: break-word;
	word-break: break-all;
	opacity:0.4
}
</style>
<script>
	$(document)
			.ready(
					function() {
						$
								.get(
										'/roy/personalPage/somebodyPersonalPageCheckFollow.controller',
										{}, function(data) {

											if (data == "true") {
												$("#follow").attr("class",
														"follow");
												$("#follow").html('追蹤中');
											} else {
												$("#follow").attr("class",
														"unfollow");
												$("#follow").html('追蹤');
											}
										})

						$('#login').click(function() {
							window.location.href = "login.jsp";
						})
						$('#upload').click(function() {
							window.location.href = "upload.jsp";
						})
						var follows = document.querySelectorAll("div.follow");
						var unfollows = document
								.querySelectorAll("div.unfollow");

						for (var i = 0; i < follows.length; i++) {
							follows[i].addEventListener("click", followClick);
						}
						for (var i = 0; i < unfollows.length; i++) {
							unfollows[i].addEventListener("click", followClick);
						}
					})

	function followClick() {
		if ($(this).attr("class") == "follow") {//追蹤改成退追蹤
			$.get('/roy/personalPage/somebodyPersonalPageFollow.controller', {
				'somebody' : $('#userName').text()
			}, function(data) {
			})
			// 			這個會跳轉畫面window.location.href = "/roy/personalPage/somebodyPersonalPageFollow.controller?somebody="+$('#userName').text();
			$(this).attr("class", "unfollow");
			$(this).html('追蹤');

		} else {//追蹤
			$.get('/roy/personalPage/somebodyPersonalPageFollow.controller', {
				'somebody' : $('#userName').text()
			}, function(data) {
			})
			// 			這個會跳轉畫面window.location.href = "/roy/personalPage/somebodyPersonalPageFollow.controller?somebody="+$('#userName').text();
			$(this).attr("class", "follow");
			$(this).html('已追蹤');
		}
	}
</script>


<script>
$(document).ready(function() {
	loadMusic('Peter')
	loadMusicCount('Peter')
	loadPlayList('Peter')
	loadMemberLikeMusic('Peter')
	
	//按音樂重新載入喜歡的音樂
	$('#memberMusic').on('click',function(){
		loadMusic('Peter')
	})
	
	//按喜歡重新載入喜歡的音樂
	$('#memberLikeMusic').on('click',function(){
		loadMemberLikeMusic('Peter')
	})

	//按愛心
	$('body').on('click','.heart',function(){
		var row = $(this).parents('#musics');
        var musicId =row.children('span[name="music_id"]').text();
		
		if (this.src.indexOf("love.png") != -1) {
			
			$.get('/roy/personalPage/memberTakeBackLike',{'musicId' : musicId,'username':'${user.member_username}'},function(data) {
				row.find('.heartCount').text(data);
			})
			this.src = "../img/emptyLove.png";
			
		} else {
			
			$.get('/roy/personalPage/memberClickLike',{'musicId' : musicId,'username':'${user.member_username}'},function(data) {
				row.find('.heartCount').text(data);
			})
			this.src = "../img/love.png";
		}
	})
	
	//按加入歌單時載入有哪些歌單
	$('body').on('click','.btnAddList',function() {
 		var row = $(this).parents('#musics');
        var music_id =row.children('span[name="music_id"]').text();
			
		$.getJSON('/roy/list/readPlayList',{'username' : '${user.member_username}'},function(data) {
			var html='<option value="'+music_id+'">請選擇歌單</option>';
			$.each(data,function(index, list) {
				
			    html+='<option value="'+list.playlist_id+'">'+list.playlist_name+'</option>';
			         
	              })
	         $('#selectPlayList').html(html);
			 $('span[name="musicId"]').hide();
		})
			
	})
	
	
	//把音樂加進歌單裡
	$('body').on('click','#addMusicToList',function() {
 		var row = $(this).parents('#addList');
 		var musicId =row.find('#selectPlayList').children().val();
		var playListId=$('#selectPlayList').val();
		$.get('/roy/list/addMusicToPlayList',{'musicId' : musicId,'playListId':playListId},function(data) {
			alert(data)
			loadPlayList('${user.member_username}')
		})
			
	})
	
	//點歌單去歌單頁面
	$('#list').on('click','#listPage',function(){
		var row = $(this).parents('#lists');
		var playListId = row.children('span[name="playlist_id"]').text();
	
		window.location.href = "/roy/personalPage/locateToPlayList?playListId="+playListId;
		
	})
	
	//點音樂去音樂頁面
	$('#music').on('click','#musicPage',function(){
		var row = $(this).parents('#musics');
		var musicId = row.children('span[name="music_id"]').text();
		
		window.location.href = "/roy/musicPage/findMusicById?musicId="+musicId;
		
	})
	
})


//讀取somebody的所有歌
function loadMusic(username) {

	$.getJSON('/roy/personalPage/readSomebodyMusic',{'username' : username},function(data) {
		var content="";
		$.each(data,function(index, list) {
			content += '<div id="musics" class="col-md-5" style="float: left; width: 300px;margin-bottom:10px;">'+
			          '<span name="music_id">'+list.music_id+'</span>'+
			          '<span id="musicPage" style="cursor: pointer;">'+
			               '<img src="'+list.music_Image+'" style="width: 160px; height: 160px;" />'+
			          '</span>'+
			       '<div style="font-size: 16px;">'+list.music_name+'</div>'+
                   '<div>'+
			       '<img src="'+list.memberLikeMusic+'" class="heart">'+
                   '<span class="heartCount">'+list.music_likeCount+'</span>'+ 
                      '<span id="share" class="shareAndAdd"><a href="" style="color: black;"><img src="../img/share.png" width="15px" />分享</a></span>'+
                      '<span id="add">'+
                      '<button type="button" class="btnAddList" data-toggle="modal" data-target="#addList" style="outline: none;"><img src="../img/add.png" width="15px">加入歌單</button>'+
					  '</span>'+
                   '</div>'+
                   '</div>';
           })
           $('#music').html(content);
		$('span[name="music_id"]').hide();
	})
}


//讀取somebody的所有歌單
function loadPlayList(username) {
	$.getJSON('/roy/list/readSomebodyPlayList',{'username' : username},function(data) {
		var content="";
		 $('#list').html("");
		$.each(data,function(index, list) {
			content+='<div id="lists" class="col-md-5" style="float: left; width: 300px;margin-bottom:13px;">'+
		             '<span name="playlist_id">'+list.playlist_id+'</span>'+
			         '<div id="listPage" style="cursor: pointer;">'+
		                  '<div style="width: 160px;height: 160px;background: url('+list.playlist_image+') no-repeat; background-size:160px 160px;">'+
			              '<div class="listSongCount">'+list.playlist_musicCount+'</div></div>'+
		             '</div>'+
                     '<div style="font-size: 16px;">'+list.playlist_name+'</div>'+
                 '</div>';
              })
              $('#list').html(content);
		$('span[name="playlist_id"]').hide();
	})
}


//讀取somebody喜歡的歌
function loadMemberLikeMusic(username) {

	$.getJSON('/roy/personalPage/somebodyLikeMusic',{'username' : username},function(data) {
		var content="";
		$.each(data,function(index, list) {
			content += '<div id="musics" class="col-md-5" style="float: left; width: 300px;">'+
                             '<span name="music_id">'+list.music_id+'</span>'+
				             '<a href=""><img src="'+list.music_Image+'" style="width: 160px; height: 160px;" /></a>'+
                             '<div style="font-size: 16px;">'+list.music_name+'</div>'+
				             '<div>'+
                                  '<img src="'+list.userLikeMusic+'" class="heart">'+
				                  '<span class="heartCount">'+list.music_likeCount+'</span>'+ 
					              '<span id="share" class="shareAndAdd">'+
				                       '<a href="" style="color: black;"><img src="../img/share.png" width="15px" />分享</a>'+
					              '</span>'+
					              '<span id="add">'+
			                      '<button type="button" class="btnAddList" data-toggle="modal" data-target="#addList" style="outline: none;"><img src="../img/add.png" width="15px">加入歌單</button>'+
								  '</span>'+
				             '</div>'+
			             '</div>';
                })
           $('#like').html(content);
		$('span[name="music_id"]').hide();
	})
}


//讀取使用者上傳的音樂數
function loadMusicCount(username) {
	$.getJSON('/roy/personalPage/uploadMusicCount',{'username' : username},function(data) {
		$('#musicCount').html(data);
	})
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
					<img src="imgs/profile/${somebody}.jpg"
						style="float: left; height: 230px; width: 230px; margin-right: 15px;" />

					<div style="padding: 15px; font-size: 30px;">
						${nickname} <span hidden="true" id="userName">${somebody}</span>
					</div>
					<div id="follow" class="unfollow">追蹤</div>
					<table>
						<tr>
							<td>音樂</td>
							<td>粉絲</td>
							<td>追蹤中</td>
						</tr>
						<tr>
							<td id="musicCount" class="number">0</td>
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
						<li><a href="#music" data-toggle="tab" id="memberMusic">音樂</a></li>
						<li><a href="#list" data-toggle="tab">歌單</a></li>
						<li><a href="#like" data-toggle="tab" id="memberLikeMusic">喜歡</a></li>
						<li><a href="#about" data-toggle="tab">關於</a></li>
					</ul>

					<div class="tab-content" style="height: auto;">

						<div class="tab-pane fade in active" id="dynamic">
							<div id="test"></div>

						</div>
						<!-- End dynamic -->
						<!-- 						<div class="tab-pane fade in active" id="dynamic"> -->
						<!-- 				            <div class="dynamic"></div> -->
						<!-- 							<div class="dynamic"></div> -->
						<!-- 							<div class="dynamic"></div> -->
						<!-- 							<div class="dynamic"></div> -->
						<!-- 						</div> -->


						<div class="tab-pane fade in" style="overflow: auto;" id="music">

							<!-- 							<div id="musics" class="col-md-5" style="float: left; width: 300px;"> -->
<!-- 								<span name="music_id"></span>  -->
<!-- 								<span><a href=""><img src="../img/love.png" style="width: 160px; height: 160px;" /></a></span> -->

<!-- 								<div style="font-size: 16px;">讓我為你唱情歌</div> -->
<!-- 								<div> -->
<!-- 									<img src="../img/emptyLove.png" class="heart">  -->
<!-- 									<span id="heartCount"> 0</span>  -->
<!-- 									<span id="share" class="shareAndAdd"> <a href="" style="color: black;"><img src="../img/share.png" width="15px" />分享</a></span>  -->
<!-- 									<span class="deleteClick" style="cursor: pointer;"> <img src="../img/delete.png" width="15px" />刪除</span> -->
<!-- 								</div> -->
<!-- 							</div> -->

						</div>
						
						
						<div class="tab-pane fade in" style="overflow: auto;" id="list">

	<!-- 						<div style="margin-left:200px;"><a href="">新增歌單</a></div> -->
						
<!-- 						<div class="col-md-5" style="float: left; width: 300px;"> -->
<!-- 						<span name="playlist_id">2</span> -->
<!-- 								<a href=""> -->
<!-- 									<div style="width: 160px;height: 160px;background: url(/roy/img/add.png) no-repeat; background-size:160px 160px;"> -->
								
<!-- 										<div class="listSongCount">2</div> -->
<!-- 									</div> -->
<!-- 								</a> -->

<!-- 								<div style="font-size: 16px;">蕭氏情歌精選</div> -->
<!-- 								<div> -->
<!-- 									<span style="cursor: pointer;"> <img -->
<!-- 										src="../img/delete.png" width="17px" />刪除 -->
<!-- 									</span> -->
<!-- 								</div> -->
<!-- 							</div> -->	

						</div>
						
						
						
						<div class="tab-pane fade in" style="overflow: auto;" id="like">

	<!-- 							<div id="likes" class="col-md-5" style="float: left; width: 300px;"> -->
<!-- 								<a href=""><img src="../img/love.png" -->
<!-- 									style="width: 160px; height: 160px;" /></a> -->

<!-- 								<div style="font-size: 16px;">讓我為你唱情歌</div> -->
<!-- 								<div> -->
<!-- 									<img src="../img/emptyLove.png" class="heart">  -->
<!-- 									<span -->
<!-- 										class="heartCount"> 0</span>  -->
<!-- 									<span id="share" -->
<!-- 										class="shareAndAdd">  -->
<!-- 										<a href="" style="color: black;"><img -->
<!-- 											src="../img/share.png" width="15px" />分享</a> -->
<!-- 									</span> -->
<!-- 									 <span id="add"> -->

<!-- 										<button type="button" class="btnAddList" data-toggle="modal" -->
<!-- 											data-target="#addList" style="outline: none;"> -->
<!-- 											<img src="../img/add.png" width="15px">加入歌單 -->
<!-- 										</button> -->

<!-- 									</span> -->
<!-- 								</div> -->
<!-- 							</div> -->

						</div>

						<!-- 						end music -->


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
													<div style="float: right;">
														<a href="personalDetail.jsp">編輯</a>
													</div>
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
			</div>
			<!-- End Tab v2 -->
		</div>
	</div>
	<!-- === END CONTENT === -->
	<!-- 	showArticleFromMember start-->
	<script>
		$(function() {
			$
					.ajax({
						url : "/roy/personalPage/showArticleFromMember.controller", //存取Json的網址             
						type : "POST",
						cache : false,
						dataType : 'json',
						data : {
							user : $('#userName').text()
						},
						//contentType: "application/json",              
						success : function(list) {
							list
									.forEach(function(obj, index) {
										// 						<img src='imgs/123.jpg' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >
										// 						<h4style='margin-bottom:0px'>發表了一篇文章</h5>
										// 						<small>9 小時前</small>
										// 						<div class="clearfix"></div>
										//						<a  class='btn btn-primary' target='_blank' href='singleArticle.jsp'>查看全文</a>
										var img = "<img src='imgs/profile/"
												+ $('#userName').text()
												+ ".jpg' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >";
										var content = "<h5 style='margin-bottom:0px'>發表了一篇文章</h5><small>9 小時前</small><div class='clearfix'></div>"
												+ "<div>"
												+ obj.post_content
												+ "</div>";
										var time = "<h6>" + obj.post_time
												+ "</h6>";
										var button = "<a  class='btn btn-primary'  href='/roy/personalPage/singleArticle.controller?post_idS="
												+ obj.post_idS + "'>查看全文</a>"
										var div = img + content + time + button
												+ "<br></br>";
										$('#test').append(div);
									})
						},
						error : function(xhr, ajaxOptions, thrownError) {
							alert(xhr.status);
							alert(thrownError);
						}
					});

		});
	</script>
	<!-- 	showArticleFromMember end-->




	<!-- === END CONTENT === -->

	<!-- addPlayList begin-->
								
							<div class="modal fade" id="addList" aria-hidden="true">
										<div class="modal-dialog" style="width: 300px;">
											<div class="modal-content">
												<h5 style="margin: 10px;">加入歌單</h5>
	
													<div class="modal-body">

														<div class="form-group">
															<select name="selectPlayList" id="selectPlayList" class="form-control">
																<option value="playListId">請選擇歌單</option>
															</select>
														</div>
														<div style="float:right;">
														<a href="../list/createList.jsp" >新增歌單</a>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															data-dismiss="modal">取消</button>
														<buttin id="addMusicToList" type="button" class="btn btn-primary" data-dismiss="modal" >確定</button>
													</div>
												
											</div>
										</div>
									</div>							
							
							<!-- addPlayList end-->
							
	<jsp:include page="../homePage/footer.jsp" />
	<!-- 	<div id="player"> -->
	<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
	<!-- 	</div> -->
</body>
</html>