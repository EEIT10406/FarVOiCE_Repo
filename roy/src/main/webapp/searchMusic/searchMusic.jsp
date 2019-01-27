<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>FarVOiCE</title>
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
.shareAndAddbtn,.btnAddList,.reportButton{
	color: black;
	background-color: white;
	border: 0px;
}
.heart {
	width: 17px;
	margin-right:5px;
	cursor: pointer;
}
</style>
<script>
	function changeCheckBoxs() {
		var checkboxs = document.getElementsByName("isprivacy");
		for (var i = 0; i < checkboxs.length; i++) {
			if (checkboxs[i].checked == false) {
				checkboxs[i].checked = true;
				checkboxs[i].value = "false";
			}
		}
	}
	function submitBtnClick() {
		changeCheckBoxs();
		$("#addshareform").submit();
	}
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!--選單 -->
		<div id="content">
			<div class="container">
				<div class="container">
					<div class="row margin-vert-30">
						<ul id="type" class="nav nav-tabs m-bottom-6">
							<li id="choseType" class="active"><a href="#">音樂類型</a></li>
							<li id="allType"><a href="#">所有音樂</a></li>
							<a id="soChi" aria-controls="collapse-filter"
								aria-expanded="false"
								class="pull-right m-top-1 js-collapse-filter"
								data-toggle="collapse" href="#collapse-filter">收起</a>
						</ul>
						<!--類型 -->
						<div id="music_type-div" class="collapse in" id="collapse-filter">
							<form class="form-horizontal p-bottom-4">
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>類型</small></label>
									<div class="col-sm-11">
										<ul id="music_type" class="nav nav-pills nav-sm">
											<li type="'抒情'"><a class="dynamic" href="#">抒情</a></li>
											<li type="'爵士'"><a class="dynamic" href="#">爵士</a></li>
											<li type="'藍調'"><a class="dynamic" href="#">藍調</a></li>
											<li type="'嘻哈'"><a class="dynamic" href="#">嘻哈</a></li>
											<li type="'古典'"><a class="dynamic" href="#">古典</a></li>
											<li type="'搖滾'"><a class="dynamic" href="#">搖滾</a></li>
											<li type="'金屬'"><a class="dynamic" href="#">金屬</a></li>
											<li type="'放克'"><a class="dynamic" href="#">放克</a></li>
											<li type="'流行'"><a class="dynamic" href="#">流行</a></li>
											<li type="'電音'"><a class="dynamic" href="#">電音</a></li>
										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>排序</small></label>
									<div class="col-sm-11">
										<ul id="sort-type" class="nav nav-pills nav-sm">
											<li sort='music_uploadTime' class="active"><a href="#">最新上傳</a></li>
											<li sort='music_playCount'><a href="#">最多播放</a></li>
											<li sort='music_likeCount'><a href="#">最多喜歡</a></li>
										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>期間</small></label>
									<div class="col-sm-11">
										<ul id="time-type" class="nav nav-pills nav-sm">
											<li before='' class="active"><a href="#">不限時間</a></li>
											<li before='7'><a href="#">7 天內</a></li>
											<li before='30'><a href="#">30 天內</a></li>
											<li before='365'><a href="#">1 年內</a></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
						<!--類型 -->
					</div>
					<!--搜尋 -->
					<div id="search-div" class="form-inline">
						<input class="form-control mr-sm-2" type="search" placeholder="搜尋"
							aria-label="Search">
						<button class="btn btn-outline-success">搜尋</button>
					</div>
					<script>
						$('#search-div').hide(0);
					</script>
					<!--搜尋 -->
				</div>
			</div>
		</div>
		<!--選單 -->
	</div>


	<!-- 歌	 -->
	<div class="container">
		<div id='music-container' class="row margin-vert-30"></div>
	</div>
	<!-- 歌	 -->
	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
	
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
							
	<!-- addshare begin-->
	<div class="modal fade" id="addshare" aria-hidden="true">
		<div class="modal-dialog" style="width: 300px;">
			<div class="modal-content">
				<h5 style="margin: 20px;">分享歌曲</h5>
				<form action="<c:url value='/personalPage/ShareMusic.controller'/>" method="get" id="addshareform">
					<div class="modal-body">
						<div class="form-group"></div>
						<textarea name="shareContent" style="width: 250px; height: 270px" onFocus="if(this.value==this.defaultValue) this.value=''" onBlur="if(this.value=='') this.value=this.defaultValue">分享一下感想吧...</textarea>
					</div>
					<textarea hidden="true" id="addshareMusicid" name="shareMusicid"></textarea>
					<textarea  hidden="true" id="addshareMusicname" name="shareMusicname"></textarea>
					<textarea  hidden="true" id="addshareMusicimg" name="shareMusicimg"></textarea>
					<div id="displayShareMusic" style="border:1px solid #AAAAAA; width:250px;margin-left:20px;">
						<img src="../img/300x300.jpg" id="addshareMusicImg"  style="width:50px;height:50px;"/><a href=""></a>
						<span style="margin-left: 10px; font-size: 15px;"><a id="addshareMusicnamea" href="">讓我為你唱情歌</a></span>
					</div>
					<div class="modal-footer">
						<div style="float:left"><input type="checkbox" name="isprivacy" value="true">不公開</div>
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" onclick="submitBtnClick()" >確定</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	
	
	<script>
	$(document).ready(function() {
		//愛心
		$('#music-container').on('click','.heart',function(){
			<%if (session.getAttribute("user") == null) {%>
 			alert('請先登入');
		<%} else {%>
			var musicId = $(this).attr("music_id");
			var count = $(this).parent('div').find('.heartCount');
			if (this.src.indexOf("love.png") != -1) {
				$.get('/roy/personalPage/memberTakeBackLike',{'musicId' : musicId,'username':'${user.member_username}'},function(data) {
					count.text(data);
				})
				this.src = "../img/emptyLove.png";
			} else {
				$.get('/roy/personalPage/memberClickLike',{'musicId' : musicId,'username':'${user.member_username}'},function(data) {
					count.text(data);
				})
				this.src = "../img/love.png";
			}
			<%}%>
		})
		//愛心
		
		//加入歌單
	$('body').on('click','.btnAddList',function() {
		<%if (session.getAttribute("user") == null) {%>
		window.location.href = "/roy/login-signUp-upload/login.jsp";
	<%} else {%>
		var music_id = $(this).attr("music_id");
		$.getJSON('/roy/list/readPlayList',{'username' : '${user.member_username}'},function(data) {
			var html='<option value="'+music_id+'">請選擇歌單</option>';
			$.each(data,function(index, list) {
				
			    html+='<option value="'+list.playlist_id+'">'+list.playlist_name+'</option>';
			         
	              })
	         $('#selectPlayList').html(html);
		})
		<%}%>
	})		
		//加入歌單
		
		//加入歌單-確定
	$('body').on('click','#addMusicToList',function() {
 		var row = $(this).parents('#addList');
 		var musicId =row.find('#selectPlayList').children().val();
		var playListId=$('#selectPlayList').val();
		$.get('/roy/list/addMusicToPlayList',{'musicId' : musicId,'playListId':playListId},function(data) {
			alert(data)
			loadPlayList('${user.member_username}')
		})
			
	})
	//加入歌單-確定
	
	//檢舉
		$('#music-container').on('click','.reportButton',function() {
			<%if (session.getAttribute("user") == null) {%>
	 			alert('請先登入');
			<%} else {%>
				if(confirm("確定檢舉嗎?")){
					$.get("report.create", {'music_id':$(this).attr('music_id'),'member_username':$(this).attr('member_username')}, function(message) {
						alert(message);
					})
			  	} else {
			  	}
			<%}%>
		})
		// 		檢舉
		
		var type = '';
		var before = '';
		var sort = 'music_uploadTime';
		loadMusic("","","",''+sort);
		
		// 		上面標籤
		$('#allType').click(function() {
			$('#choseType').removeClass("active");
			$(this).addClass("active");
			$('#music_type-div').hide(300);
			$('#soChi').hide(300);
			$('#search-div').show(300);
		})
		$('#choseType').click(function() {
			$('#allType').removeClass("active");
			$(this).addClass("active");
			$('#music_type-div').show(300);
			$('#soChi').show(300);
			$('#soChi').text("收起");
			$('#search-div').hide(300);
		})
		// 		上面標籤

		// 		選單
		$('#music_type li').click(function() {
			$(this).toggleClass('active');
			type = $("#music_type li.active").map(function(){return $(this).attr("type");}).get();
			loadMusic(''+type,"",''+before,''+sort);
		})
		$('#time-type li').click(function() {
			$(this).parent('ul').children('li').removeClass('active');
			$(this).addClass('active');
			before = $(this).attr('before');
			loadMusic(''+type,"",''+before,''+sort);
		})
		$('#sort-type li').click(function() {
			$(this).parent('ul').children('li').removeClass('active');
			$(this).addClass('active');
			sort = $(this).attr('sort');
			loadMusic(''+type,"",''+before,''+sort);
		})
		$('#soChi').click(function() {
			if ($(this).text() == "收起") {
				$('#music_type-div').hide(500);
				$(this).text("展開");
			} else {
				$('#music_type-div').show(500);
				$(this).text("收起");
			}
		})
		// 		選單

		// 		搜尋
		$('#search-div button').click(function(){
			var searchString = $('#search-div input').val();
			loadMusic("",searchString,"","");
			    })
		// 		搜尋
		
			  //載音樂
				function loadMusic(type,searchString,before,sort){
					$('#music-container').html("");
					$.getJSON('report.searchMusic',{'type':type,'searchString':searchString,'before':before,'sort':sort},function(data){
					var docFrag = $(document.createDocumentFragment());
				    $.each(data,function(index,music){
				    		var row = $("<div></div>").html(
				    				'<div>'+
				    				'<div class="col-md-3 col-sm-6 col-xs-6 m-bottom-8 item_box">'+
				    				'<div class="work-block m-bottom-2"><a class="play-link" href="#">'+
				    				'<img class="img-full" height="180px" width="180px" src="'+music.Music_Image+'" real_src="'+music.Music_Image+'" onclick="play(this)" music_id="'+music.Music_id+'" member_username="'+music.Member_username+'" music_name="'+music.Music_name+'" music_music="'+music.Music_music+'">'+
				    				'</div>	<div  id="row" class="song-info">'+
				    				'<h5 class="text-ellipsis"><a class="play-link" href = "/roy/musicPage/findMusicById?musicId='+music.Music_id+'" src="'+music.Music_Image+'">'+music.Music_name+'</a></h5>'+
				    				'<h5 class="text-ellipsis"><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+music.Member_nickname+'">'+music.Member_nickname+'</a></h5>'+
				    				'<div><img src="'+music.memberLikeMusic+'" class="heart" music_id="'+music.Music_id+'"><span class="heartCount">'+music.Music_likeCount+'</span><span id="add">'+
				    				'<button type="button" class="btnAddList" music_id="'+music.Music_id+'" data-toggle="modal" data-target="#addList" style="outline: none;"><img src="../img/add.png" width="15px">加入歌單</button></span></a>'+
				    				'<span id="share"><button type="button" class="shareAndAddbtn"data-toggle="modal" data-target="#addshare"style="outline: none;" music_id="'+music.Music_id+'" member_username="'+music.Member_username+'" music_name="'+music.Music_name+'" src="'+music.Music_Image+'" onclick="sharePeter(this)" ><img src="../img/share.png" width="13px" >分享</button></span>'+
				    				'<span><button class="reportButton" music_id="'+music.Music_id+'" member_username="'+music.Member_username+'"><img src="../img/exclamation.png" width="15px">檢舉</button></span>'+
				    				'</div></div></div></div>');
// 				    		onmouseover="report()"
				    		docFrag.append(row);
				    	});
				    $('#music-container').html(docFrag);
				    })
				}
				//載音樂
				
		//播圖
		$('#music-container').on('mouseover','img.img-full',function(){
			tempSrc = this.src;
			this.src = "../img/player.png";
		})
		$('#music-container').on('mouseout','img.img-full',function(){
			this.src = tempSrc;
		})
		//播圖
	})
	
	//取消a默認
	$('#content a').on('click',function(event){
		event.preventDefault();
		});
	//取消a默認
	
	//播放
	function play(e) {
		$(e).parent('a').on('click',function(){
			return false;
		});
				ap.list.add([{
					title : $(e).attr('music_name'),
					author : $(e).attr('member_username'),
					url : $(e).attr('music_music'),
					pic : $(e).attr('real_src')
				}]);
				$(ap.audio).attr('music_id',$(e).attr('music_id'));
	}
	//播放	
</script>
	
<script>
//按分享時載入哪首音樂
function sharePeter(e) {
	
	var music_name = $(e).attr('music_name');
	var music_id = $(e).attr('music_id');
	var music_image =$(e).attr('src');
	var music_href ="/roy/musicPage/findMusicById?musicId="+music_id;
    		
    $("#addshareMusicname").text(""+music_name+"");
    $("#addshareMusicid").text(""+music_id+"");
    $("#addshareMusicimg").text(""+music_image+"");
    //顯示
 	$('#addshareMusicnamea').text(music_name);
 	$('#addshareMusicnamea').attr("href",music_href);
 	$('#addshareMusicImg').attr("src",music_image);
}
</script>	
	
	
</body>
</html>