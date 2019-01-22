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
	cursor: pointer;
}

.musicName{
margin-left: 10px; font-size: 15px; cursor: pointer;
color:#FF3333;
}

.heart {
	width: 17px;
	margin-right:5px;
	cursor: pointer;
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
	margin-right:7px;
}

.btnShare {
	color: black;
	background-color: white;
	border: 0px;
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
<!-- End JS -->

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
		$("#addshare").submit();
	}
	
</script>
<script>
$(document).ready(function() {
		loadrankTopTen('古典')	

//按加入歌單時載入有哪些歌單
	$('#rankTopTen').on('click','.btnAddList',function() {
		if('${user.member_username}'!=""){
 	  	    var row = $(this).parents('#row');
            var music_id =row.find('td[name="music_id"]').text();
		    $.getJSON('/roy/list/readPlayList',{'username' : '${user.member_username}'},function(data) {
			    var html='<option value="'+music_id+'">請選擇歌單</option>';
			    $.each(data,function(index, list) {
				
			        html+='<option value="'+list.playlist_id+'">'+list.playlist_name+'</option>';
			         
	            })
	           $('#selectPlayList').html(html);
			   $('span[name="musicId"]').hide();
		    })
		}else{
			window.location.href = "/roy/login-signUp-upload/login.jsp";
		}
	})
		
//把音樂加進歌單裡
	$('body').on('click','#addMusicToList',function() {
			var row = $(this).parents('#addList');
 		    var musicId =row.find('#selectPlayList').children().val();
		    var playListId=$('#selectPlayList').val();
		    $.get('/roy/list/addMusicToPlayList',{'musicId' : musicId,'playListId':playListId},function(data) {
			    alert(data);
		    })
		
	})
	
//按愛心
	$('body').on('click','.heart',function(){
		if('${user.member_username}'!=""){
			
		   var row = $(this).parents('#row');
           var musicId =row.children('td[name="music_id"]').text();
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
		   
		}else{
			window.location.href = "/roy/login-signUp-upload/login.jsp";
		}
		
	})
	
//點音樂去音樂頁面
	$('#rankTopTen').on('click','#musicPage',function(){
		var row = $(this).parents('#row');
		var musicId =row.find('td[name="music_id"]').text();
		window.location.href = "/roy/musicPage/findMusicById?musicId="+musicId;	
	})
	
	
//滑鼠移入顯示播放圖片
	$('#rankTopTen').on('mouseover','.music',function(){
		 this.src = "../img/player.png";
	})
//滑鼠移出重新載入圖片
	$('#rankTopTen').on('mouseout','.music',function(){
		var row = $(this).parents('#row');
        var musicId =row.find('td[name="music_id"]').text();
        loadrankTopTen('古典')
         
	})
	
	
})


//載入該類型音樂top10
function loadrankTopTen(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank=1;
			$.each(data,function(index, list) {
				content+='<tr id="row">'+
					     '<td>'+rank+'</td>'+
					     '<td name="music_id">'+list.music_id+'</td>'+
					     '<td name="music_image">'+
					        '<img src="'+list.music_Image+'" class="music" />'+
					        '<span id="musicPage" class="musicName">'+list.music_name+'</span>'+
					        '<div>';
				        if('${user.member_username}'!=""){
					        var like='<img src="'+list.memberLikeMusic+'" class="heart">';
			           	}else{
				         	var like='<img src="/roy/img/emptyLove.png" class="heart">';
			        	} 
				content+=like+'<span class="heartCount">'+list.music_likeCount+'</span>'+
						        '<span id="share">'+
							        '<button type="button" class="btnShare" data-toggle="modal" data-target="#sharebox" style="outline: none;">'+
								        '<img src="../img/share.png" width="15px">分享'+
							        '</button>'+
						         '</span>'+ 
						         '<span id="add">'+
                                    '<button type="button" class="btnAddList" data-toggle="modal" data-target="#addList" style="outline: none;">'+
                                        '<img src="../img/add.png" width="15px">加入歌單'+
                                    '</button>'+
                                  '</span>'+
					        '</div>'+
					    '</td>'+
					    '<td><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></td>'+
					    '<td>'+list.music_uploadTime+'</td>'+
                        '</tr>';        
				    rank=rank+1;
				})
				$('#rankTopTen>tbody').html(content);
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
				<div class="row margin-vert-30">

					<!-- Tab -->
					<div class="row tabs">
						<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="rankImediate.jsp">FarVoice
										即時熱門 </a></li>
								<li><a href="rankAllType.jsp"> 所有類型 </a></li>
								<li><a href="rankEmotion.jsp"> 抒情 </a></li>
								<li><a href="rankRock.jsp"> 搖滾 </a></li>
								<li><a href="rankHiphop.jsp"> 嘻哈 </a></li>
								<li><a href="rankBlue.jsp" > 藍調 </a></li>
								<li><a href="rankJazz.jsp"> 爵士 </a></li>
								<li class="active"><a href="#classic" > 古典 </a></li>
								<li><a href="rankMetal.jsp" > 金屬 </a></li>
								<li><a href="rankFunk.jsp" > 放克 </a></li>
								<li><a href="rankPopular.jsp" > 流行 </a></li>
								<li><a href="rankElectronic.jsp" > 電音 </a></li>

							</ul>
						</div>
						<div class="col-sm-9">
							<div class="tab-content">

								<div class="tab-pane fade in" id="imediate">
								</div>

								<div class="tab-pane fade in" id="allType">
								</div>

								<div class="tab-pane fade in" id="emotion">
								</div>

								<div class="tab-pane fade in" id="rock">
								</div>

								<div class="tab-pane fade in" id="hiphop">
								</div>

								<div class="tab-pane fade in" id="blue">
								</div>

								<div class="tab-pane fade in" id="jazz">
								</div>

								<div class="tab-pane fade in active" id="classic">
									<div class="row">
										<div class="col-md-7">
											<div style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">古典</div>
											<table id="rankTopTen" style="height: auto;">
												<thead>
													<tr>
														<th>排名</th>
														<th>歌曲名稱</th>
														<th>發佈者</th>
														<th>發佈時間</th>
													</tr>
												</thead>
												<tbody>
<!-- 													<tr> -->
<!-- 														<td>1</td> -->
<!-- 														<td name="music_id"></td> -->
<!-- 														<td> -->
														
<!-- 														<span id="musicPage" style="cursor: pointer;"> -->
<!-- 					                                        <img src="../img/left.JPG" class="music" /> -->
<!-- 					                                    </span> -->
<!-- 														<span style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span> -->
<!-- 														<div> -->
<!-- 															<img src="../img/emptyLove.png" class="heart">  -->
<!-- 															<span class="heartCount">0</span> -->
<!-- 															<span id="share"> -->
<!-- 																<button type="button" class="btnShare" -->
<!-- 																		data-toggle="modal" data-target="#sharebox" -->
<!-- 																		style="outline: none;"> -->
<!-- 																		<img src="../img/share.png" width="15px">分享 -->
<!-- 																</button> -->
<!-- 															</span>  -->
<!-- 															<span id="add"> -->
<!--                                                                 <button type="button" class="btnAddList" data-toggle="modal" data-target="#addList" style="outline: none;"> -->
<!--                                                                 <img src="../img/add.png" width="15px">加入歌單 -->
<!--                                                                 </button> -->
<!-- 					                                        </span> -->
<!-- 														</div> -->
															
<!-- 														</td> -->
<!-- 														<td>老蕭</td> -->
<!-- 														<td>2018-12-12</td> -->
														
<!-- 													</tr> -->
												</tbody>
											</table>

										</div>
									</div>
								</div>
								
								<div class="tab-pane fade in" id="metal">
								</div>
								
								<div class="tab-pane fade in" id="funk">
								</div>
								
								<div class="tab-pane fade in" id="popular">
								</div>
								
								<div class="tab-pane fade in" id="electronic">
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


	<!-- addshare begin-->
	<div class="modal fade" id="sharebox" aria-hidden="true">
		<div class="modal-dialog" style="width: 300px;">
			<div class="modal-content">
				<h5 style="margin: 20px;">分享歌曲</h5>
				<form action="<c:url value="/rankTop10/ShareMusic.controller"/>"
					method="get" id="addshare">
					<div class="modal-body">
						<div class="form-group"></div>
						<textarea name="shareContent" style="width: 250px; height: 270px"
							onFocus="if(this.value==this.defaultValue) this.value=''"
							onBlur="if(this.value=='') this.value=this.defaultValue">分享一下感想吧...</textarea>
					</div>
					<textarea hidden="true" id="addshareMusicid" name="shareMusicid"></textarea>
					<textarea  hidden="true" id="addshareMusicname" name="shareMusicname"></textarea>
					<textarea  hidden="true" id="addshareMusicimg" name="shareMusicimg"></textarea>
					
					<div id="displayShareMusic" style="border:1px solid #AAAAAA; width:250px;margin-left:20px;">
						<img src="../img/300x300.jpg"
							style=" width: 50px; height: 50px;" /><a
							href=""><span style="margin-left: 10px; font-size: 15px;">讓我為你唱情歌</span></a>
					</div>
					<div class="modal-footer">
						<div style="float: left">
							<input type="checkbox" name="isprivacy" value="true">不公開
						</div>
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary"
							onclick="submitBtnClick()">確定</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- addshare end-->


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

	<c:if test="${not empty insert}">
		<script>
			alert("分享成功~快去看看吧~~");
			window.location.href = "/roy/personalPage/personalPage.jsp";
			// 取的img的路徑
			var imgSrc = $("#displayShareMusic").find("img").attr("src");
			// 取的歌名
			var spanContent = $("#displayShareMusic").find("span").text();
		</script>
	</c:if>




	<jsp:include page="../homePage/footer.jsp" />
	<!-- 	<div id="player"> -->
	<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
	<!-- 	</div> -->


<script>
//按分享時載入哪首音樂
$('body').on('click','.btnShare',function() {
	var row = $(this).parents('#row');
	var music_name =row.find('#musicPage').text();
	var music_id =row.find('td[name="music_id"]').text();
	var music_image =row.find('td[name="music_image"] img').attr("src");
	var music_href= "/roy/musicPage/findMusicById?musicId="+music_id;
	console.log(music_name+","+music_id+","+music_image);
    $("#addshareMusicname").text(""+music_name+"");
    $("#addshareMusicid").text(""+music_id+"");
    $("#addshareMusicimg").text(""+music_image+"");
    $("#displayShareMusic a").attr("href",music_href);
    $("#displayShareMusic a").text(""+music_name+"");
    $("#displayShareMusic img").attr("src",music_image);
})	
</script>

</body>
</html>