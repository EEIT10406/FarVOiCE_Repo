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
<link rel="stylesheet" href="../css/funding.css" rel="stylesheet">
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
<style>
.post{
	float: left;

}
* {
	font-family: 微軟正黑體;
}

td {
	font-size: 17px;
	width: 75px;
	padding: 2px;
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
	width: 15px;
	margin-right:4px;
	cursor: pointer;
}

.btnAddList {
	color: black;
	background-color: white;
	border: 0px;
}

.shareAndAddbtn {
	color: black;
	background-color: white;
	border: 0px;
}

.shareAndAdd {
	width: 50px;
	margin-top: 5px;
	padding: 5px;
	font-size: 13px;
	margin-left: 5px;
}

.editClick{
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

.listSongCount{
border:1px solid black;width:50px;height:50px;background-color:black;color:white;font-size:20px;margin-left:0;
padding:11px;
text-align:center;
word-wrap:break-word; 
word-break:break-all;
opacity:0.4
}
.readmore{
 	background-color: white;
    color: black;
/*     border: 2px solid black; */
    padding: 15px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
.readmore:hover {
    background-color: #9f5000; /* Green */
    color: white;
}
</style>


<script>
<c:if test="${not empty result}">
alert("${result}")
</c:if>
</script>
<script>
	$(document).ready(function() {		
		var follows = document.querySelectorAll("div.follow");
		var unfollows = document.querySelectorAll("div.unfollow");
		
		for (var i = 0; i < follows.length; i++) {
			follows[i].addEventListener("click", followClick);
		}
		for (var i = 0; i < unfollows.length; i++) {
			unfollows[i].addEventListener("click", followClick);
		}	
		
	})
	function changeCheckBoxs() {
		var checkboxs = document.getElementsByName("isprivacy");
		for (var i = 0; i < checkboxs.length; i++) {
			if (checkboxs[i].checked == false) {
					checkboxs[i].checked = true;
					checkboxs[i].value = "false";
			}
		}
	}
	function submitBtnClick(){
		changeCheckBoxs();
		 $("#addshareform").submit();
		 
	}
	function followClick() {
		if ($(this).attr("class") == "follow") {
			$(this).attr("class", "unfollow");
			$(this).html('追蹤');

		} else {
			$(this).attr("class", "follow");
			$(this).html('已追蹤');
		}
	}

	//贊助%數取到整數
	function parseInt(percent){
		var newpercent=Math.ceil(percent);
		return newpercent
	}

$(document).ready(function() {
	loadMusic('${user.member_username}')
	loadMusicCount('${user.member_username}')
	loadPlayList('${user.member_username}')
	loadMemberLikeMusic('${user.member_username}')
	loadFanCount('${user.member_username}')
	loadStarCount('${user.member_username}')
	showAllFunding('${user.member_username}');
	showBackList('${user.member_username}');
	
	//按音樂重新載入喜歡的音樂
	$('#memberMusic').on('click',function(){
		loadMusic('${user.member_username}')
	})
	
	//按喜歡重新載入喜歡的音樂
	$('#memberLikeMusic').on('click',function(){
		loadMemberLikeMusic('${user.member_username}')
	})	

	 //編輯音樂
	$('#music').on('click','.editClick',function() {
		var row = $(this).parents('#musics');
        var music_id =row.children('span[name="music_id"]').text();	
		window.location.href = "/roy/musicPage/editMusic?music_id="+music_id;
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
	
	//按分享時載入哪首音樂
	$('body').on('click','.shareAndAddbtn',function() {
        var music_name =$(this).attr('music_name');
    	var music_id = $(this).attr('music_id');
    	var music_image =$(this).attr('music_image');
    	var music_href ="/roy/musicPage/findMusicById?musicId="+music_id;
    	
    	 $("#addshareMusicname").text(""+music_name+"");
    	 $("#addshareMusicid").text(""+music_id+"");
    	 
    	 console.log(music_name+","+music_id+","+music_image);
    	 //顯示
    	 $('#addshareMusicnameSpan > a').text(music_name);
    	 $('#addshareMusicnameSpan > a').attr("href",music_href);
    	 $('#addshareMusicImg').attr("src",music_image);
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
	
	//點喜歡的音樂去音樂頁面
	$('#like').on('click','#musicPage',function(){
		var row = $(this).parents('#musics');
		var musicId = row.children('span[name="music_id"]').text();
		
		window.location.href = "/roy/musicPage/findMusicById?musicId="+musicId;
		
	})
	
})


//讀取該使用者的所有歌
function loadMusic(username) {

	$.getJSON('/roy/personalPage/readMusic',{'username' : username},function(data) {
		var content="";
		$.each(data,function(index, list) {
			content +=  '<div id="musics" class="col-md-5" style="float: left; width: 242px;margin-bottom:10px;">'+
			            '<span name="music_id" id="musicid">'+list.music_id+'</span>'+
			            '<span id="musicPage" style="cursor: pointer;">'+
			               '<img src="'+list.music_Image+'" style="width: 120px; height: 120px;" name="music_Image" />'+
			            '</span>'+
			       		'<div name="music_name" style="font-size: 16px;">'+list.music_name+'</div>'+
                   		'<div style="font-size:13px">'+
			       		'<img src="'+list.memberLikeMusic+'" class="heart">'+
                   		'<span class="heartCount">'+list.music_likeCount+'</span>'+ 
                      	'<span id="share"><button type="button" class="shareAndAddbtn"data-toggle="modal" data-target="#addshare" style="outline: none;" music_id="'+list.music_id+'" music_image="'+list.music_Image+'" music_name="'+list.music_name+'"><img src="../img/share.png" width="13px">分享</button></span>'+
                      	'<span id="add" style="margin-left:0px;">'+
                      	'<button type="button" class="btnAddList" data-toggle="modal" data-target="#addList" style="outline: none;"><img src="../img/add.png" width="13px">加入歌單</button>'+
					  	'</span>'+
					  	'<br>'+
					  	'<span class="editClick"><img src="../img/edit.png" width="15px" />編輯</span>'+
                   		'</div>'+
                   		'</div>';

           })
           $('#music').html(content);
		 
		$('span[name="music_id"]').hide();
	})
}


//讀取該使用者的所有歌單
function loadPlayList(username) {
	$.getJSON('/roy/list/readPlayList',{'username' : username},function(data) {
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
                     '<div style="font-size:14px;">'+list.showPlaylist_privacy+'</div>'+
                 '</div>';
              })
              $('#list').html('<div style="margin-left:870px;font-size:15px;font-weight:normal"><a href="../list/createList.jsp">編輯歌單</a></div>'+content);
		$('span[name="playlist_id"]').hide();
	})
}


//讀取該使用者喜歡的歌
function loadMemberLikeMusic(username) {

	$.getJSON('/roy/personalPage/memberLikeMusic',{'username' : username},function(data) {
		var content="";
		$.each(data,function(index, list) {
			content += '<div id="musics" class="col-md-5" style="float: left; width: 240px; music_id="'+list.music_id+'"  music_name="'+list.music_name+'" music_music="'+music.Music_music+'">'+
                             '<span name="music_id">'+list.music_id+'</span>'+
				             '<span id="musicPage" style="cursor: pointer;">'+
                                  '<img src="'+list.music_Image+'" style="width: 120px; height: 120px;" />'+
                             '</span>'+
                             '<div style="font-size: 16px;">'+list.music_name+'</div>'+

				             '<div>'+
                                  '<img src="../img/love.png" class="heart">'+
				                  '<span class="heartCount">'+list.music_likeCount+'</span>'+ 
				                  '<span id="share"><button type="button" class="shareAndAddbtn"data-toggle="modal" data-target="#addshare" style="outline: none;" music_id="'+list.music_id+'" music_image="'+list.music_Image+'" music_name="'+list.music_name+'"><img src="../img/share.png" width="13px">分享</button></span>'+
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
	
	

	//抓粉絲數
	function loadFanCount(username) {
		$.get('/roy/personalPage/howMuchFollowMe.controller',{'username' : username},function(data) {
			$('#fansCount').html(data);
			if(data > 0 ){
				//顯示粉絲名單
				$.ajax({
	                url: "/roy/personalPage/whoFollowMe.controller",
	                type: "POST",
	                cache:false,
	                dataType:'json',
	                data:{username:$('#username').text()},
					success : function(list)
					 {  console.log("粉絲名單----------------------");
						console.log(list);
					 	list.forEach(function(obj, index) {
						 	var a = "<a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+obj.member_nicknameS+"'>"+obj.member_nicknameS+"</a>"
					 		var content0 = 	"<div class='row'>"
						 	var content1 = 		"<div class='col-md-5'>"
						 	var content2 = 			"<img src='"+obj.member_profileImageS+"' style='margin-top: 15px; width: 100px; height: 100px;' />"
				 			var content3 = 			"<span style='margin-left: 10px; margin-top: 5px; font-size: 18px;'>"+a+"</span>"
				 			var content4 = 		"</div>"
				 			var content5 = 		"<div class='col-md-7'>"
				 			var content6 = 			"<div class='follow' style='float: right; margin-top: 50px;'>已追蹤</div>"
				 			var content7 = 		"</div>"
				 			var content8 = 	"</div>"
							var div = content0 +  content1 +  content2 +  content3 +  content4 +  content8 ;
				 			$('#fans').append(div);
					  	});
					},  
	                error: function (xhr, ajaxOptions, thrownError) {
	                    alert(xhr.status+"-->顯示粉絲名單");
	                    alert(thrownError);
	                }
	            });	 
				//顯示粉絲名單END
			}
			
		})
		
	}
	//抓偶像數
	function loadStarCount(username) {
		$.get('/roy/personalPage/iFollowHowMuch.controller',{'username' : username},function(data) {
			$('#starsCount').html(data);
			if(data > 0){
				//顯示追蹤名單
				$.ajax({
	                url: "/roy/personalPage/iFollowWho.controller",
	                type: "POST",
	                cache:false,
	                dataType:'json',
	                data:{username:$('#username').text()},
					success : function(list)
					 {  console.log("追蹤名單----------------------");
						console.log(list);
					 	list.forEach(function(obj, index) {
						 	var a = "<a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+obj.member_nicknameM+"'>"+obj.member_nicknameM+"</a>"
					 		var content0 = 	"<div class='row'>"
						 	var content1 = 		"<div class='col-md-5'>"
						 	var content2 = 			"<img src='"+obj.member_profileImageM+"' style='margin-top: 15px; width: 100px; height: 100px;' />"
				 			var content3 = 			"<span style='margin-left: 10px; margin-top: 5px; font-size: 18px;'>"+a+"</span>"
				 			var content4 = 		"</div>"
				 			var content5 = 		"<div class='col-md-7'>"
				 			var content6 = 			"<div class='follow' style='float: right; margin-top: 50px;'>已追蹤</div>"
				 			var content7 = 		"</div>"
				 			var content8 = 	"</div>"
							var div = content0 +  content1 +  content2 +  content3 +  content4 +  content5 +  content6 +  content7 +  content8 ;
				 			$('#following').append(div);
					  	});
					},  
	                error: function (xhr, ajaxOptions, thrownError) {
	                    alert(xhr.status+"-->追蹤名單");
	                    alert(thrownError);
	                }
	            });	 
				//顯示追蹤名單END
			}
		})
	}
	
// 	找出該使用者通過審核的專案
function showAllFunding(username){
	$.getJSON('/roy/personalPage/findProjectByUsernamePass',{'username' : username},function(data) {
		var content="";
		$.each(data,function(index, list) {
			console.log(list);
			content += 
				'<div class="project-pre allproject" style="cursor:pointer" href="/roy/funding/detail.controller?funding_id='+list.funding_id+'&day='+limitDay(list.funding_duration)+'&nickname='+list.nick_name+'" onclick="detailhref(this)">'+
				'<div class="img-pres">'+
				'<img class="img-in" id="preview_progressbarTW_img"'+
				'src="'+list.funding_image+'">'+
				'</div>'+
				'<div class="pcontent-pre">'+
				'<p id="pre-title" class="title-content"'+
					'style="margin-bottom: -18px">'+list.funding_title+'</p>'+
				'<p class="small creator">'+
				'<a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nick_name+'"><p id="pre-name">'+list.nick_name+'</p></a>'+

				'<p id="pre-content" class="excerpt JQellipsis"'+
				'style="font-weight: bold; font-size: 0.85rem">'+list.funding_description+'</p>'+
				'</div>'+
				'<div class="downMeta-pre">'+
				'<progress class="progress-pre"'+
				'style="margin-bottom: 0px; margin-top: 0px;" value="'+list.funding_currentAmount/list.funding_goal*100+'" max="100"></progress>'+
			    '<span class="goalMoney osmfont currentMoney" style="font-family:Oswald, sans-serif;">'+list.funding_currentAmount+'</span><span'+
				' class="hidden-md goalpercent goal" style="font-family: Oswald, sans-serif;"> '+parseInt(list.funding_currentAmount/list.funding_goal*100)+'%</span><span'+
				' style="font-size: 13px; letter-spacing: 1px;font-family: Microsoft JhengHei"'+
				'class="date pull-right small"> 還剩 <strong class="days"'+
				'style="font-size: 13px; font-weight: 1000; letter-spacing: 1px;">'+limitDay(list.funding_duration)+'</strong><span'+
				' style="font-size: 13px; letter-spacing: 1px"> 天</span>'+
				'</span>'+
				'<span class="funding_id" style="display:none">'+list.funding_id+'</sapn>'+
				'<span class="funding_goal" style="display:none">'+list.funding_goal+'</sapn>'+
				'<span class="funding_createTime" style="display:none">'+list.funding_createTime+'</sapn>'+
				'<span class="funding_duration" style="display:none">'+list.funding_duration+'</sapn>'+
				'<span class="funding_browseCount" style="display:none">'+list.funding_browseCount+'</sapn>'+
				'</div>'+
			    '</div>';
           })
		$('#userproject').html(content);
		
	})
}


//根據username找出贊助紀錄
function showBackList(username){
	$.getJSON('/roy/personalPage/listBackerBeanByUsername',{'username' : username},function(data) {
		var content="";
		$.each(data,function(index, list) {
			console.log(list);
			content +=

		'<div class="card-toggle ban-donate" style="max-width: 300px;display: inline-block;margin-left: 17px;">'+
		'<div class="a">'+
		'<div class="project-pre  ban-color">'+
		'<div class="pcontent-pre"'+
			'style="height: 40px; font-size: 2.5rem; margin-bottom: 0px;">'+
			'<p id="pre-amount" class="title-content detail-money">'+list.sup_money+'</p>'+
		'</div>'+
		'<div class="img-detail">'+
			'<img class="img-in" id="preview_progressbarTW_img"'+
				'style="border-radius: 0;height: 186px"'+
				'src="'+list.reward_image+'">'+
		'</div>'+
		'<div class="pcontent-pre"'+
			'style="height: auto; margin-bottom: 0px;">'+

			'<p id="pre-content" class="excerpt"'+
				'style="font-weight: bold; font-size: 0.85rem">'+list.reward_description+'</p>'+
		'</div>'+
		'<div class="downMeta-pre estimated-font">'+
			'<div style="width: 50%; display: inline-block;">'+
				'<p class="locate">寄送地點</p>'+
				'<p style="margin-bottom: 0px; font-size: 13px; letter-spacing: 0.5px;">只寄送台灣本島</p>'+
		'</div>'+
		'<div'+
				'style="width: 50%; display: inline-block; float: right; text-align: right;">'+
				'<p class="estimated">預計寄送時間</p>'+
				'<span id="estimated-year"'+
					'style="font-size: 13px; letter-spacing: 0.5px;">'+list.reward_estimatedYear+'</span> /'+
				'<span id="estimated-month"'+
					'style="font-size: 13px; letter-spacing: 0.5px;">'+list.reward_estimatedMonth+'</span>'+
		'</div>'+
		'</div>'+
		'</div>'+
		'</div>'+
		'</div>';
	
		 })
			$('#reward').html(content);
			
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
				<div style="border: 0.5px solid #DDDDDD; align: center; height: 231px; margin-top: 30px; margin-bottom: 30px;">
					
					<c:choose>
					    <c:when test="${empty user.member_profileImage}">
					      	<img src="imgs/noProfile.gif" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />
					    </c:when>
					    <c:otherwise>
							<img src="${user.member_profileImage}" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />					    
						</c:otherwise>
					</c:choose>
					
					
					<div style="padding: 15px; font-size: 30px;">
					<c:choose>
					    <c:when test="${empty user}">
					       	阿腫
					    </c:when>
					    <c:otherwise>
					        ${user.member_nickname}
					        <span hidden="true" id="username">${user.member_username}</span>
					    </c:otherwise>
					</c:choose>
					
					</div>
 					<form class="post">
						<input type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#sharebox" value="發佈新動態">
<!-- 										style="outline: none;"> -->
					</form>
					<table style="margin-top:100px">
						<tr>
							<td>音樂</td>
							<td>追蹤中</td>
							<td>粉絲</td>
						</tr>
						<tr>
							<td id="musicCount" class="number">0</td>
							<td  class="number" ><a id="starsCount" href="#about" data-toggle="tab">0</a></td>
							<td  class="number" ><a id="fansCount" href="#about" data-toggle="tab">0</a></td>
						</tr>
					</table>
				</div><!-- === END of CONTENT === -->
				
			
				
				<!-- Tab v2 -->
				<div class="tabs alternative">
					<ul class="nav nav-tabs">
						<li><a href="/roy/personalPage/personalPage.jsp">動態</a>
						</li>
						<li><a href="/roy/personalPage/personalMusic.jsp" id="memberMusic">音樂</a></li>
						<li><a href="/roy/personalPage/personalList.jsp">歌單</a></li>
						<li><a href="/roy/personalPage/personalLike.jsp" id="memberLikeMusic">喜歡</a></li>
						<li><a href="/roy/personalPage/personalProject.jsp" id="memberProject">提案</a></li>
						<li class="active"><a href="#reward" id="memberDonate">贊助</a></li>
						<li><a href="/roy/personalPage/personalAbout.jsp" >關於</a></li>
					</ul>
					
					<div class="tab-content" style="height: auto;" style="margin-bottom:20px" >
						<div class="tab-pane fade in" id="dynamic">
								
							<div><!-- ===BEGIN of HISTORY === -->
										 
										<div class="bg-white p-20">
											<div>
												<div>
													<img id="profile" src="${user.member_profileImage}"  class="img-circle" style="width:45px;height:45px;"  />												</div><!-- /media-left -->
												<div>
													<h4><span></span>最近聆聽歌曲</h4>		
												</div>	
										 		<div id="history">
													<table class="table" id="historyTable">
													  <thead>
													    <tr>
													      <th scope="col"></th>
													      <th scope="col">歌名</th>
													      <th scope="col">時間</th>
													    </tr>
													  </thead>
													  <tbody>												
													  </tbody>	
													  </table>									  		
												</div>	
<!-- 												/media-body -->
											</div>


										</div>

							</div><!-- ===END of HISTORY === -->
							
							
							<div id="test"><br>
							</div>
					        <a class='readmore' onclick='return showData()'>查看更多文章</a>
						</div>
						<!-- End dynamic -->
						<div class="tab-pane fade in" style="overflow: auto;" id="music">								
						</div>			
						<div class="tab-pane fade in" style="overflow: auto;" id="list">
						</div>
						<div class="tab-pane fade in" style="overflow: auto;" id="like">
						</div>
						<!-- end music -->
                        <div class="tab-pane fade in" style="overflow: auto;" id="userproject">
						</div>
						<div class="tab-pane fade in active" style="overflow: auto;text-align: left;" id="reward">
						</div>
                        <!-- end funding -->
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
													<h3 class="no-margin no-padding" style="font-family: 微軟正黑體;">詳細介紹</h3>
													<p style="margin-top: 15px;">地區： ${user.member_region}</p>
													
												</div>
												
												<div class="col-md-7">
													<div style="float: right;"><a href="personalDetail.jsp">編輯</a></div>
												</div>
												<div class="clearfix"></div>
												<div class="col-md-12">
												<p> ${user.member_description}</p>
												</div>
											</div>
										</div>
										<div class="tab-pane fade in" id="following">
											<h3 class="no-margin no-padding"
												style="border-bottom: 1px solid #D3D3D3; margin-bottom: 15px;font-family: 微軟正黑體;padding-bottom:15px">追蹤名單</h3>
											
<!-- 											<div class="row"> -->
<!-- 												<div class="col-md-5"> -->
<!-- 													<img src="../img/left.JPG" -->
<!-- 														style="margin-top: 15px; width: 100px; height: 100px;" /> -->
<!-- 													<span -->
<!-- 														style="margin-left: 10px; margin-top: 5px; font-size: 18px;">安董</span> -->
<!-- 												</div> -->
<!-- 												<div class="col-md-7"> -->
<!-- 													<div class="follow" style="float: right; margin-top: 50px;">已追蹤</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
										</div>


										<div class="tab-pane fade in" id="fans">
											<h3 class="no-margin no-padding"
												style="border-bottom: 1px solid #D3D3D3; margin-bottom: 15px;font-family: 微軟正黑體;padding-bottom:3px">粉絲</h3>
<!-- 											<div class="row"> -->
<!-- 												<div class="col-md-5"> -->
<!-- 													<img src="../img/left.JPG" -->
<!-- 														style="margin-top: 15px; width: 100px; height: 100px;" /> -->
<!-- 													<span -->
<!-- 														style="margin-left: 10px; margin-top: 5px; font-size: 18px;">安董</span> -->
<!-- 												</div> -->
<!-- 												<div class="col-md-7"> -->
<!-- 													<div class="follow" style="float: right; margin-top: 50px;">已追蹤</div> -->
<!-- 												</div> -->
<!-- 											</div> -->



										</div>

									</div>
								</div>
							</div>
							<!-- about end -->

						</div>
					</div>
				</div>
			</div>
				</div>
			</div>
			<!-- End Tab v2 -->
	<!-- === END CONTENT === -->
	
	<!-- addPost begin-->
	<div class="modal fade" id="sharebox" aria-hidden="true">
		<div class="modal-dialog" style="width: 690px;">
			<div class="modal-content">
				<h5 style="margin: 20px;">發佈新動態</h5>
				
				<form action="<c:url value="/personalPage/Post.controller"/>" method="post">
					<div class="modal-body" >
						<textarea class="form-control" name="post_content" style="width:650px;height:500px;resize:none" placeholder="是不在想些色色的呢?"  ></textarea>
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
//點擊預覽小卡跳轉詳細頁面
function detailhref(e){
	var webhref=$(e).attr("href");
	window.location.href=webhref;
}
//抓取選取日期計算到期天數
function limitDay(day) {
	var pickdate = day;
	var enddate = new Date(pickdate);
	var nowdate = new Date();

	var deadline = enddate.getTime()
			- nowdate.getTime();
	var days = parseInt(deadline
			/ (1000 * 60 * 60 * 24)) + 1;
	if (isNaN(days)) {
		return 0;
	}else{
		return days;
	}
}
//刪除Post或Share
	function remove(post_idS)
	{
		if(confirm("確實要刪除嗎?"))
			{	alert("已經刪除！");
				window.location.href='/roy/personalPage/removePost.controller?post_idS=' + post_idS ;
				}
		else
			{	alert("已經取消");}
	}
	//start 背景ajax
	//showArticleFromMember
        $(function () {  
        showData();
		//顯示歷史紀錄
		$.ajax({
                url: "/roy/personalPage/showAllHistoryTimeFromHstory.controller",   //存取Json的網址             
                type: "POST",
                cache:false,
                dataType:'json',
                data:{user:$('#username').text()},
                //contentType: "application/json",              
				success : function(list)
				 {  //------------List
				 	var imgPath=$('#profile').attr('src');
				 	list.forEach(function(obj, index) {
				 		var music_name ;
				 		var story_time ;
				 		var music_img  ;
				 		//------------obj抓直出來放到變數
				 		$.each(obj, function( index, value ) {
// 				 			console.log( index + ":" + value );
				 			if(index == 0){
				 				story_time = value;
				 			}
				 			if(index == 3){
				 				music_name = value;
				 			}
				 			if(index == 4){
				 				music_img = value;
				 			}
						});
				 		//------------endObj

						
						var cc="<tr>"+
						     " <td><img class='img-circle' src='"+music_img+"' style='width:45px;height:45px;'></td>"+
						      "<td>"+music_name+"</td>"+
						     " <td>"+story_time+"</td>"+
						    "</tr>";
						$('#historyTable').append(cc);

				  	})
				  	//-------------endList
				  },
				  
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status+"--->歷史紀錄");
                    alert(thrownError);
                }
            });	 
			//顯示歷史紀錄END
});//end 背景處理


var counter=0;
var pagestart=0;
var sum ;
var size1=5;
function showData(){
	 counter++;
	 $.ajax({
         url: "/roy/personalPage/showArticleFromMember.controller",   //存取Json的網址             
         type: "POST",
         cache:false,
         dataType:'json',
         data:{username:$('#username').text()},
         //contentType: "application/json",              
			success : function(list)
			 {   
				 if(counter!=0){
					
					 pagestart =(counter*5)-5;
		             sum = list.length;
		             
		             if(sum - pagestart < size1 ){
			                size1 = sum - pagestart;

			                for(   var i=pagestart; i< pagestart+size1; i++){
			            	 	
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
								timeFn(list[i].post_time);
								var imgPath=$('#profile').attr('src');
								var music_id = list[i].post_musicid;
								var music_name =list[i].post_musicname;
								var postorshare =list[i].post_postorshare;
								var musicImage =list[i].post_musicImage;
								
								var img = "<img src='"+imgPath+"' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >";
								var privacy =  list[i].post_privacy;
								var contentPrivacy = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'>發表了一篇文章<i class='fas fa-lock'></i></h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";
								var testPrivacy = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'><i class='fas fa-heart' style='color:red'></i>分享了一條音樂<i class='fas fa-lock'></i></h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";

								
								
								var content = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'>發表了一篇文章</h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";
								var musiccontent = "<span style='margin-left: 10px; font-size: 15px;' id='Music_name'>" +"<a href='http://localhost:8080/roy/musicPage/findMusicById?musicId="+music_id+"'>"+music_name+"</a></span>";

								
								//								var content2 = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'><i class='fas fa-heart' style='color:red'></i></span>分享了一條音樂</h5><small>"+timediff+"</small><a href='#' onclick='remove("+obj.post_idS+");'></div><div class='clearfix'></a></div>"+"<div style='margin-bottom:15px'>" + obj.post_content + "</div>";
								var test = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'><i class='fas fa-heart' style='color:red'></i>分享了一條音樂</h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";
								var button = "<a  class='btn btn-primary'  href='/roy/personalPage/singleArticle.controller?post_idS=" +  list[i].post_idS + "'>查看全文</a>"
						        
								//發佈動態的內容		
								var Post_content =  "<div style='margin-bottom:45px'>"+img+content+button +"<br></br></div>";
								var Post_contentPrivacy =  "<div style='margin-bottom:45px'>"+img+contentPrivacy+button +"<br></br></div>";

								//分享的內容
								var Share_content = "<div style='margin-bottom:45px '>"+img+test + "<div style='border:1px solid #AAAAAA; width:250px'>"+"<img style='width:70px;height:70px'src='"+musicImage+"'>"+ musiccontent+"</div><br></br></div>";
						        var Share_contentPrivacy = "<div style='margin-bottom:45px'>"+img+testPrivacy +"<div style='border:1px solid #AAAAAA; width:250px'>"+"<img style='width:70px;height:70px'src='"+musicImage+"'>"+ musiccontent+"</div><br></br></div>";


						        if(postorshare==true && privacy==false){
						        	$('#test').append(Post_content);
						        }else if(postorshare==false && privacy==false){
						        	$('#test').append(Share_content);
						        } if(postorshare==true && privacy==true){
						        	$('#test').append(Post_contentPrivacy);
						        }else if(postorshare==false && privacy==true){
						        	$('#test').append(Share_contentPrivacy);
						        } 
						       
						        if ( (pagestart + size1) >= sum){
					                $(".readmore").hide();
					            }else{
					            	$(".readmore").show();
					            }
						        
							}
		             
		             }
									
		             else{
			       		
		             for(  var i=pagestart; i< (pagestart+size1); i++){
		            	 
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
							timeFn(list[i].post_time);
							var imgPath=$('#profile').attr('src');
							var music_id = list[i].post_musicid;
							var music_name =list[i].post_musicname;
							var postorshare =list[i].post_postorshare;
							var musicImage =list[i].post_musicImage;
							
							var img = "<img src='"+imgPath+"' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >";
							var privacy =  list[i].post_privacy;
							var contentPrivacy = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'>發表了一篇文章<i class='fas fa-lock'></i></h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";
							var testPrivacy = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'><i class='fas fa-heart' style='color:red'></i>分享了一條音樂<i class='fas fa-lock'></i></h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";

							
							
							var content = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'>發表了一篇文章</h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";
							var musiccontent = "<span style='margin-left: 10px; font-size: 15px;' id='Music_name'>" +"<a href='http://localhost:8080/roy/musicPage/findMusicById?musicId="+music_id+"'>"+music_name+"</a></span>";
//							var content2 = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'><i class='fas fa-heart' style='color:red'></i></span>分享了一條音樂</h5><small>"+timediff+"</small><a href='#' onclick='remove("+obj.post_idS+");'></div><div class='clearfix'></a></div>"+"<div style='margin-bottom:15px'>" + obj.post_content + "</div>";
							var test = "<div style='margin-bottom:15px'><h5 style='margin-bottom:0px;margin-top:0px;letter-spacing:0.5px'><i class='fas fa-heart' style='color:red'></i>分享了一條音樂</h5><small>"+timediff+"</small><a  href='#' onclick='remove("+ list[i].post_idS+");' ><i style='margin-left:40px'class='fas fa-trash-alt'></i></a></div><div class='clearfix'></div>"+"<div style='margin-bottom:15px'>" +  list[i].post_content + "</div>";
							var button = "<a  class='btn btn-primary'  href='/roy/personalPage/singleArticle.controller?post_idS=" +  list[i].post_idS + "'>查看全文</a>"
					        
							//發佈動態的內容		
							var Post_content =  "<div style='margin-bottom:45px'>"+img+content+button +"<br></br></div>";
							var Post_contentPrivacy =  "<div style='margin-bottom:45px'>"+img+contentPrivacy+button +"<br></br></div>";

							//分享的內容
					        var Share_content = "<div style='margin-bottom:45px '>"+img+test + "<div style='border:1px solid #AAAAAA; width:250px'>"+"<img style='width:70px;height:70px'src='"+musicImage+"'>"+ musiccontent+"</div><br></br></div>";
						    var Share_contentPrivacy = "<div style='margin-bottom:45px'>"+img+testPrivacy +"<div style='border:1px solid #AAAAAA; width:250px'>"+"<img style='width:70px;height:70px'src='"+musicImage+"'>"+ musiccontent+"</div><br></br></div>";

					        if(postorshare==true && privacy==false){
					        	$('#test').append(Post_content);
					        }else if(postorshare==false && privacy==false){
					        	$('#test').append(Share_content);
					        } if(postorshare==true && privacy==true){
					        	$('#test').append(Post_contentPrivacy);
					        }else if(postorshare==false && privacy==true){
					        	$('#test').append(Share_contentPrivacy);
					        } 
					       
					        if ( (pagestart + size1) >= sum){
				                $(".readmore").hide();
				            }else{
				            	$(".readmore").show();
				            }
					        
						}
		            
  
				}
				
		             
				}
		  }
         
         ,
         error: function (xhr, ajaxOptions, thrownError) {
             alert(xhr.status+"--->showArticleFromMember");
             alert(thrownError);
         }
     });	
}



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
								<button id="addMusicToList" type="button" class="btn btn-primary" data-dismiss="modal" >確定</button>
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
					<div id="displayShareMusic">
						<img src="../img/300x300.jpg" id="addshareMusicImg"  style="margin-left: 20px;width:50px;height:50px;"/><a href=""></a>
						<span style="margin-left: 10px; font-size: 15px;" id="addshareMusicnameSpan"><a href="#">123讓我為你唱情歌</a></span>
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
</body>
</html>