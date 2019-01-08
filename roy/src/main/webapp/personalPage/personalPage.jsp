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
	width: 18px;
	margin-right:5px;
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
.deleteClick{
cursor: pointer;
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

.list {
	width: 160px;
	height: 160px;
	background: url("../img/right.JPG") no-repeat;
	background-size: 160px 160px;
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
	loadMusic('${user.member_username}');
	
	//刪除歌單
	$('#musics>tbody').on('click','.deleteClick',
		function() {
			var row = $(this).parents('tr');
			var music_id = row.children('td:nth-child(1)').text();
			$.get('/roy/list/deleteMusic', {
				'music_id' : music_id
			}, function(data) {
				alert(data);
	            loadMusic('${user.member_username}');
			})
	})
	//點愛心
	$('#musics>tbody').on('click','.heart',function(){
		if (this.src.indexOf("love.png") != -1) {
			this.src = "../img/emptyLove.png";
		} else {
			this.src = "../img/love.png"
		}
	});
	
	
	
})


	
//讀取該使用者的所有歌
function loadMusic(username) {
	$.getJSON('/roy/personalPage/readMusic',{'username' : username},function(data) {
		var html;
		 $('#musics>tbody').html("");
		$.each(data,function(index, list) {
		  html+='<tr style="border-bottom:1px solid #DDDDDD;">'+
		        '<td name="music_id">'+list.music_id+'</td>'+
				'<td style="text-align:center"><img src="'+list.music_Image+'"style="width: 90px; height: 90px;" /></td>'+
				'<td style="font-size: 16px;">'+list.music_name+'</td>'+		
				'<td><img src="../img/emptyLove.png" class="heart">'+
				     '<span id="heartCount">'+list.music_likeCount+'</span>'+
				     '<span style="cursor: pointer;margin:15px;"><img src="../img/share.png" width="15px" />分享</span>'+
					 '<span class="deleteClick"><img src="../img/delete.png" width="15px" />刪除</span>'+
				'</td>'+
				'</tr>';
              })
              $('#musics>tbody').html(html);
		$('td[name="music_id"]').hide();
	})
}


//讀取該使用者的所有歌單
function loadPlayList(username) {
	$.getJSON('/roy/personalPage/readMusic',{'username' : username},function(data) {
		var html;
		 $('#musics>tbody').html("");
		$.each(data,function(index, list) {
		  html+='<tr style="border-bottom:1px solid #DDDDDD;">'+
		        '<td name="music_id">'+list.music_id+'</td>'+
				'<td style="text-align:center"><img src="'+list.music_Image+'"style="width: 90px; height: 90px;" /></td>'+
				'<td style="font-size: 16px;">'+list.music_name+'</td>'+		
				'<td><img src="../img/emptyLove.png" class="heart">'+
				     '<span id="heartCount">'+list.music_likeCount+'</span>'+
				     '<span style="cursor: pointer;margin:15px;"><img src="../img/share.png" width="15px" />分享</span>'+
					 '<span class="deleteClick"><img src="../img/delete.png" width="15px" />刪除</span>'+
				'</td>'+
				'</tr>';
              })
              $('#musics>tbody').html(html);
		$('td[name="music_id"]').hide();
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

					<c:choose>
					    <c:when test="${empty user}">
					      	<img src="imgs/noProfile.gif" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />
					    </c:when>
					    <c:otherwise>
							<img src="imgs/profile/${user.member_username}.jpg" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />					    </c:otherwise>

					</c:choose>
					<!-- 					<img src="imgs/123.jpg" style="float: left; height: 230px; width: 230px; margin-right: 15px;" /> -->


					<div style="padding: 15px; font-size: 30px;">
						<c:choose>
							<c:when test="${empty user}">
					       	阿腫
					    </c:when>
							<c:otherwise>
					        ${user.member_nickname}
					        <span hidden="true" id="userName">${user.member_username}</span>
							</c:otherwise>
						</c:choose>

					</div>
					<!-- 					<div id="follow" class="unfollow">追蹤</div> -->
					<!-- 					發布新動態按鈕 -->
					<form class="post">
						<input type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#sharebox" value="發佈新動態">
						<!-- 										style="outline: none;"> -->


					</form>
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

					
					<div class="tab-content" style="height: auto;" style="margin-bottom:20px" >
						<div class="tab-pane fade in active" id="dynamic">

							<div id="test"><br>
<!-- 								<img src="imgs/123.jpg" class="img-circle" style="width:45px;height:45px;float:left;margin-right:15px" > -->
<!-- 								<h5 style="margin-bottom:0px">分享了一條音樂</h5> -->
<!-- 								<small>9 小時前</small> -->
<!-- 								<div class="clearfix">心得內容</div> -->
<!-- 								<div id="displayShareMusic"> -->
<!-- 										<img src="../img/300x300.jpg"  style="width:50px;height:50px;"/><a href=""></a> -->
<!-- 										<span style="font-size: 15px;">讓我為你唱情歌</span><br><br> -->
<!-- 								</div> -->
					</div>
					
					    <!-- Blog Post -->
								<div class="blog-post padding-bottom-20">
									<!-- Blog Item Header -->
									<div class="blog-item-header">
										<!-- Title -->
										<h2>
											<a href="#">最新文章</a>
										</h2>
										<div class="clearfix"></div>
										<!-- End Title -->

									</div>
									<!-- End Author Name -->
									<!-- Date -->
									<div class="blog-post-details-item blog-post-details-item-left">
										<i class="fa fa-calendar color-gray-light"></i> <a href="#">2019.01.02</a>
									</div>
									<!-- End Date -->
									<!-- Tags -->
									<div
										class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
										<i class="fa fa-tag color-gray-light"></i> <a href="#">HTML5</a>,
										<a href="#">CSS</a>, <a href="#">Grunt</a>
									</div>
									<!-- End Tags -->
									<!-- # of Comments -->
									<div
										class="blog-post-details-item blog-post-details-item-left blog-post-details-item-last">
										<a href=""> <i class="fa fa-comments color-gray-light"></i>
											9 Comments
										</a>
									</div>
									<!-- End # of Comments -->
								</div>
								<!-- End Blog Item Details -->
								<!-- Blog Item Body -->
								<div class="blog">
									<div class="clearfix"></div>
									<div class="blog-post-body row margin-top-15">
										<div class="col-md-5">
											<img class="margin-bottom-20" src="imgs/mouse.PNG"
												alt="thumb1">
										</div>
										<div class="col-md-7">
											<p>最新文章</p>
											<p>我是一隻黃金鼠</p>
											<!-- Read More -->
											<a class="btn btn-primary" target="_blank"
												href="singleArticle.jsp"> 查看全文 </a>
											<!-- End Read More -->
										</div>
									</div>
								</div>
								<!-- End Blog Item Body -->
							</div>

							<!-- End Blog Item -->
						</div>
						<!-- End dynamic -->
						<!-- 						<div class="tab-pane fade in active" id="dynamic"> -->
						<!-- 				            <div class="dynamic"></div> -->
						<!-- 							<div class="dynamic"></div> -->
						<!-- 							<div class="dynamic"></div> -->
						<!-- 							<div class="dynamic"></div> -->
						<!-- 						</div> -->


						<div class="tab-pane fade in" style="overflow: auto;" id="music">
							<table id="musics" style="width: 700px;margin-top:0px;">
									<tbody>
<!--                                      <tr> -->
<!-- 										<td name="music_id"></td> -->
<!-- 										<td><img src="../img/love.png" -->
<!-- 											style="width: 100px; height: 100px;" /> -->
<!-- 										</td> -->
<!-- 										<td style="font-size: 16px;">讓我為你唱情歌</td>		 -->
										
<!-- 										<td> -->
<!-- 										<img src="../img/emptyLove.png" class="heart"> -->
<!-- 										<span id="heartCount"> 0</span> -->
<!-- 										<span style="cursor: pointer;"><img -->
<!-- 											src="../img/share.png" width="15px" />分享</span> -->
<!-- 											<span style="cursor: pointer;"><img -->
<!-- 											src="../img/delete.png" width="15px" />刪除</span> -->
<!-- 										</td> -->
<!-- 									</tr> -->
									</tbody>
							</table>
                         
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
									<span style="cursor: pointer;"> <img
										src="../img/delete.png" width="17px" />刪除
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
									<img src="../img/emptyLove.png" class="heart"> <span
										class="heartCount"> 0</span> <span id="share"
										class="shareAndAdd"> <a href="" style="color: black;"><img
											src="../img/share.png" width="15px" />分享</a>
									</span> <span id="add">

										<button type="button" class="btnAddList" data-toggle="modal"
											data-target="#addList" style="outline: none;">
											<img src="../img/add.png" width="15px">加入歌單
										</button>

									</span>
								</div>
							</div>

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

	<!-- addPost begin-->
	<div class="modal fade" id="sharebox" aria-hidden="true">
		<div class="modal-dialog" style="width: 690px;">
			<div class="modal-content">
				<h5 style="margin: 20px;">發佈新動態</h5>

				<form action="<c:url value="/personalPage/Post.controller"/>"
					method="post">
					<div class="modal-body">
						<textarea class="form-control" name="shareContent"
							style="width: 100px; height: 30px" placeholder="標題"></textarea>
						<textarea class="form-control" name="post_content"
							style="width: 650px; height: 500px" placeholder="是不在想些色色的呢?"></textarea>
						<input type="checkbox" name="post_privacy" value="true">不想被女友看到嗎?<br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">確定</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- addPost end-->

	<!-- 	showArticleFromMember start-->
	<script>
        $(function () {            
            $.ajax({
                url: "/roy/personalPage/showArticleFromMember.controller",   //存取Json的網址             
                type: "POST",
                cache:false,
                dataType:'json',
                data:{user:$('#userName').text()},
                //contentType: "application/json",              
				success : function(list)
				 {   
					list.forEach(function(obj, index) {
						var postorshare = obj.post_postorshare;
						var img = "<img src='imgs/profile/"+$('#userName').text()+".jpg' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >";
						var content = "<br><h5 style='margin-bottom:0px'>發表了一篇文章</h5><small>9 小時前</small><div class='clearfix'></div>"+"<div>" + obj.post_content + "</div>";
						var content2 = "<br><h5 style='margin-bottom:0px'>分享了一條音樂</h5><small>9 小時前</small><div class='clearfix'></div>"+"<div>" + obj.post_content + "</div>";
						var time = "<h6>" + obj.post_time +"</h6>";
						var button = "<a  class='btn btn-primary'  href='/roy/personalPage/singleArticle.controller?post_idS=" + obj.post_idS + "'>查看全文</a>"
				        var div =  img+content + time + button +"<br></br>";
				        
						//分享的內容
				        var div2 = img+content2 + time + "<br></br>";
				        if(postorshare==true){
				        	$('#test').append(div);
				        	}else if(postorshare==false){
				        		$('#test').append(div2);
				        	}				        
				  	})
				  },
                error: function (xhr, ajaxOptions, thrownError) {
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
				<form>
					<div class="modal-body">

						<div class="form-group">
							<select class="form-control">
								<option>請選擇歌單</option>
							</select>
						</div>
						<div style="float: right;">
							<a href="../list/createList.jsp">建立歌單</a>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary">確定</button>
					</div>
				</form>

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