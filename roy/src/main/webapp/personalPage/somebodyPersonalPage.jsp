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
<script src="1.js?ver=1"></script>
<!-- End JS -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>


<style>
.post{
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
		loadFanCount('${somebody}')
		loadStarCount('${somebody}')
		$.get('/roy/personalPage/somebodyPersonalPageCheckFollow.controller', {}, 
				function(data) {
					
					if(data=="true"){
						$("#follow").attr("class", "follow");
						$("#follow").html('追蹤中');
					}
					else{
						$("#follow").attr("class", "unfollow");
						$("#follow").html('追蹤');
					}
				}
		)
	
			
		
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
		if ($(this).attr("class") == "follow") {//追蹤改成退追蹤
			$.get('/roy/personalPage/somebodyPersonalPageFollow.controller', {'somebody':$('#userName').text()}, function(data) {
				if(data){
					loadFanCount('${somebody}');
					loadStarCount('${somebody}');
				}
			})
// 			這個會跳轉畫面window.location.href = "/roy/personalPage/somebodyPersonalPageFollow.controller?somebody="+$('#userName').text();
			$(this).attr("class", "unfollow");
			$(this).html('追蹤');

		} else {//追蹤
			$.get('/roy/personalPage/somebodyPersonalPageFollow.controller', {'somebody':$('#userName').text()}, function(data) {
					loadFanCount('${somebody}');
					loadStarCount('${somebody}');
				})
// 			這個會跳轉畫面window.location.href = "/roy/personalPage/somebodyPersonalPageFollow.controller?somebody="+$('#userName').text();
			$(this).attr("class", "follow");
			$(this).html('已追蹤');
		}
	}

	//抓粉絲數
	function loadFanCount(username) {
		$.get('/roy/personalPage/howMuchFollowMe.controller',{'username' : username},function(data) {
		
			$('#fansCount').html(data);
		})
	}
	//抓偶像數
	function loadStarCount(username) {
		$.get('/roy/personalPage/iFollowHowMuch.controller',{'username' : username},function(data) {
		
			$('#starsCount').html(data);
		})
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
				<div style="border: 0.5px solid #DDDDDD; align: center; height: 231px; margin-top: 30px; margin-bottom: 30px;">
					<img id="somebodyProfile" src="${somebodyImgPath}" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />	
				
					<div style="padding: 15px; font-size: 30px;">
					 ${nickname}
					  <span hidden="true" id="userName">${somebody}</span>
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
							<td id="fansCount" class="number">0</td>
							<td id="starsCount" class="number">0</td>
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
							<div id="test">
							</div>
				
						</div>
						<!-- End dynamic -->
<!-- 						<div class="tab-pane fade in active" id="dynamic"> -->
<!-- 				            <div class="dynamic"></div> -->
<!-- 							<div class="dynamic"></div> -->
<!-- 							<div class="dynamic"></div> -->
<!-- 							<div class="dynamic"></div> -->
<!-- 						</div> -->


						<div class="tab-pane fade in" style="overflow: auto;" id="music">

						
								<div class="col-md-5" style="float:left;width:300px;">
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
			</div>
			<!-- End Tab v2 -->
		</div>
		</div>
	<!-- === END CONTENT === -->
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
						
						function timeFn(d1) {//di作为一个变量传进来
						    //如果时间格式是正确的，那下面这一步转化时间格式就可以不用了
						    var dateBegin = new Date(d1.replace(/-/g, "/"));//将-转化为/，使用new Date
						    var dateEnd = new Date();//获取当前时间
						    var dateDiff = dateEnd.getTime() - dateBegin.getTime();//时间差的毫秒数
						    var dayDiff = Math.floor(dateDiff / (24 * 3600 * 1000));
						    //计算出相差天数
						    var leave1=dateDiff%(24*3600*1000)    //计算天数后剩余的毫秒数
						    var hours=Math.floor( leave1 /(3600*1000))
						    //计算出小时数
						    //计算相差分钟数
						    var leave2=leave1%(3600*1000)    //计算小时数后剩余的毫秒数

						    var minutes=Math.floor(leave2 /(60*1000))
						    //计算相差分钟数
						    //计算相差秒数
						    var leave3=leave2%(60*1000)      //计算分钟数后剩余的毫秒数
						    var seconds=Math.round(leave3/1000)
						    console.log(" 相差 "+dayDiff+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒")
						    if(dayDiff>1){
						    	timediff += dayDiff+"天前";
						    }else if(hours>1){
						    	timediff += hours+"小時前";
						    }else if(minutes>1){
						    	timediff += minutes+"分鐘前";
						    }else{
						    	timediff+="剛剛";
						    }
						}
						
						var timediff ="";
						timeFn(obj.post_time);
						var imgPath=$('#somebodyProfile').attr('src');

						var postorshare = obj.post_postorshare;
						var img = "<img src='"+imgPath+"' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >";
						var privacy = obj.post_privacy;
						var content = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'>發表了一篇文章</h5><small>"+timediff+"</small><a  href='#' onclick='remove("+obj.post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" + obj.post_content + "</div>";
						var content2 = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'><span style='margin-right:4px'><i class='fas fa-heart' style='color:red'></i></span>分享了一條音樂</h5><small>"+timediff+"</small></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" + obj.post_content + "</div>";
						var button = "<a  class='btn btn-primary'  href='/roy/personalPage/singleArticle.controller?post_idS=" + obj.post_idS + "'>查看全文</a>"
				        var div =  "<div style='margin-bottom:45px'>"+img+content + button +"<br></br></div>";
				       
						//分享的內容
				        var div2 = "<div style='margin-bottom:45px'>"+img+content2 + "<br></br></div>";
				       
				        if(postorshare==true && privacy==false){
				        	$('#test').append(div);
				        }else if(postorshare==false && privacy==false){
				        			$('#test').append(div2);
				        		}				        

				  	})
				  },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            })
 	})         
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
														<div style="float:right;">
														<a href="../list/createList.jsp" >建立歌單</a>
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
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
<!-- 	</div> -->
</body>
</html>