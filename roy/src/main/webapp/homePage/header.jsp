<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script defer src="https://use.fontawesome.com/releases/v5.6.3/js/all.js" ></script>
<script>

var users;
	$(document).ready(function() {
		searchUser();
		$('#logo').css("cursor","pointer");
		$('#profile').css("cursor","pointer");
		$('#login').click(function() {
			window.location.href = "/roy/login-signUp-upload/login.jsp";
		})
		$('#logout').click(function() {
			window.location.href = "/roy/login-signUp-upload/MemberLogOut.controller";
		})
		$('#upload').click(function() {
			window.location.href = "/roy/login-signUp-upload/upload.jsp";
		})
		$('#profile').click(function() {
			window.location.href = "/roy/personalPage/personalPage.jsp";
			
		})
		$('#logo').click(function() {
			window.location.href = "/roy/homePage/index.jsp";
		})
		$('#project').click(function(){
			window.location.href="/roy/funding/showMusic.controller"
		})
		$('#back').click(function(){
			window.location.href="/roy/back/Back.jsp"
		})
			


	
	})
	        	
	        	
	function searchUser(){
		$.getJSON('/roy/header/searchUser.controller',{'username': "666"},function(data) {
			users = data;
			$.each(data,function(index, obj) {
				console.log(obj);
			})
		})
	}

// 	当在搜索框输入内容时，根据关键字匹配，显示弹出层
	function searchSuggest(obj){ 
	  var searchKey=$(obj).val();  
	  var reg = new RegExp(searchKey,"i"); //忽略大小写匹配搜索框中输入的内容
	      var arr=[];
	      for(var i=0,len=users.length;i<len;i++){
	        if(searchKey!="" && (users[i].member_nickname.search(reg)!=-1))  {
	      	   arr.push("<li onclick='changeSearchKey(this);' style='float:none;cursor: pointer;'>"+users[i].member_nickname+"</li>"); 
	        }
	      }     	  	  
	      $(".keywords_list").html(arr).show();
	
	}
	//单击匹配列表中的关键字选项时，将该关键字显示在搜索框中
	function changeSearchKey(obj){
	   var value=$(obj).text();
	  $("#searchKey").val(value);
	  $('.keywords_list').hide(); 
	}
	function goto(){
		var somebody = $("#searchKey").val();
		if(somebody.trim()==""){
			alert("必須輸入暱稱");
			return;
		}
		window.location.href='/roy/personalPage/somebodyPersonalPage.controller?nickname='+somebody;
	}
</script>
<!-- <script src="1.js?ver=1"></script> -->

<div class="primary-container-group">
	<!-- Background -->
	<div class="primary-container-background">
		<div class="primary-container"></div>
		<div class="clearfix"></div>
	</div>
	<!--End Background -->
	<div class="primary-container">
		<div id="header" class="container">
			<div class="row">
				<!-- Logo -->
				<div class="logo">
					<img src="../img/logo.PNG" alt="Logo" id="logo"/>
				</div>
				<!-- End Logo -->
				<ul class="social-icons  pull-right hidden-xs ">
					<c:choose>
					    <c:when test="${empty user}">
					    	<li>
								<button id="login" type="button" class="btn btn-outline-danger">
								登入/註冊</button>
							</li>
					    </c:when>
					    <c:otherwise>
							<li>
								<button id="logout" type="button" class="btn btn-outline-danger">
								登出</button>
							</li>
						</c:otherwise>
					</c:choose>
					<li>
						<button id="upload" type="button" class="btn btn-outline-danger">
							發佈音樂</button>
					</li>
					<li>
						<button id="project" type="button" class="btn btn-outline-danger">
							開始提案</button>
					</li>
					<c:choose>
					    <c:when test="${empty user}">
						</c:when>
					    <c:otherwise>
					    	<c:if test="${user.member_username == 'David'}">
								<li>	 
									<button id="back" type="button" class="btn btn-outline-danger">
									後台</button>
								</li>	
							</c:if>						
						</c:otherwise>
					</c:choose>
				
				
					
				
					<c:choose>
					    <c:when test="${empty user}">
					    </c:when>
					    <c:otherwise>
						    <c:choose>
							    <c:when test="${empty user.member_profileImage}">
									<li>	 
										<img id="profile" src="../personalPage/imgs/noProfile.gif"  class="img-circle" style="width:45px;height:45px;"  />
									</li>							    
								</c:when>
							    <c:otherwise>
									<li>	 
										<img id="profile" src="${user.member_profileImage}"  class="img-circle" style="width:45px;height:45px;"  />
									</li>							
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				
				</ul>
			</div>
		</div>
		<!-- Top Menu -->
		<div id="hornav" class="container no-padding">
			<div class="row">
				<div class="col-md-12 no-padding">
					<div class="pull-right visible-lg">
						<ul id="hornavmenu" class="nav navbar-nav">
							<li><a href="/roy/homePage/index.jsp"><i class="fas fa-home fa-lg"></i>   回首頁</a></li>
							<%-- 									<li><a href="${request.contextPath}/rank.jsp" class="far fa-trophy">看排行</a> --%>
							<li><a href="/roy/rank/rank.jsp" ><i class="fas fa-trophy fa-lg"></i>   看排行</a>
								<ul>
									<li><a href="/roy/rankTop10/rankClassic.jsp">古典</a></li>
									<li><a href="/roy/rankTop10/rankJazz.jsp">爵士</a></li>
									<li><a href="/roy/rankTop10/rankHiphop.jsp">嘻哈</a></li>
									<li><a href="/roy/rankTop10/rankEmotion.jsp">抒情</a></li>
									<li><a href="/roy/rankTop10/rankRock.jsp">搖滾</a></li>
									<li><a href="/roy/rankTop10/rankMetal.jsp">金屬</a></li>
									<li><a href="/roy/rankTop10/rankBlue.jsp">藍調</a></li>
									<li><a href="/roy/rankTop10/rankFunk.jsp">放克</a></li>
									<li><a href="/roy/rankTop10/rankPopular.jsp">流行</a></li>
									<li><a href="/roy/rankTop10/rankElectronic.jsp">電音</a></li>
								</ul>
							<li><a href="../searchMusic/searchLists.jsp"><i class="fas fa-list-ol fa-lg"></i>   聽歌單</a>
								</li>
							<li><a href="/roy/searchMusic/searchMusic.jsp"><i class="fas fa-headphones fa-lg"></i>  找音樂</a>
								</li>
							<li><a href="/roy/findArticle/findArticle.jsp"><i class="fas fa-pencil-alt fa-lg"></i>   找文章</a>
							<li><a href="/roy/funding/allFunding.jsp"><i class="fas fa-search-dollar fa-lg"></i>  找募資</a>
							</li>

							<li><a href="/roy/contact/contact.jsp"><i class="fas fa-envelope fa-lg"></i>   聯絡客服</a></li>
							
							<li><form id="searchUser" style="padding-top:6px"> 
									<input class="form-control " type="search" id="searchKey"
												placeholder="搜尋" aria-label="Search" onkeyup="searchSuggest(this);">
								</form>
							<ul class="keywords_list" ></ul>
							</li>
							<li><button class="btn btn-outline-success"  style="padding-top:12px" type="button" onclick="goto();">搜尋</button>
							</li>
							
							
						</ul>
					</div>
				</div>
			</div>
		</div>