<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script defer src="https://use.fontawesome.com/releases/v5.6.3/js/all.js" integrity="sha384-EIHISlAOj4zgYieurP0SdoiBYfGJKkgWedPHH4jCzpCXLmzVsw1ouK59MuUtP4a1" crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function() {
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
	})
</script>

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
					<li>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="search"
								placeholder="搜尋" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">搜尋</button>
						</form>
					</li>
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
							
							
							
<!-- 							<li>	 -->
<%-- 								<img id="profile" src="${user.member_profileImage}"  class="img-circle" style="width:45px;height:45px;"  /> --%>
<!-- 							</li> -->
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
									<li><a href="pages-about-us.html">搖滾</a></li>
									<li><a href="pages-services.html">抒情</a></li>
									<li><a href="pages-faq.html">金屬</a></li>
									<li><a href="pages-about-me.html">爵士</a></li>
									<li><a href="pages-full-width.html">古典</a></li>
									
								</ul>
							<li><a href="../searchMusic/searchLists.jsp"><i class="fas fa-list-ol fa-lg"></i>   聽歌單</a>
								</li>
							<li><a href="/roy/searchMusic/searchMusic.jsp"><i class="fas fa-headphones fa-lg"></i>  找音樂</a>
								</li>
							<li><a href="/roy/findArticle/findArticle.jsp"><i class="fas fa-pencil-alt fa-lg"></i>   找文章</a>
<!-- 								<ul> -->
<!-- 									<li><a href="blog-list.html">Blog</a></li> -->
<!-- 									<li><a href="blog-single.html">Blog Single Item</a></li> -->
<!-- 								</ul></li> -->
							<li><a href="/roy/funding/allFunding.jsp"><i class="fas fa-search-dollar fa-lg"></i>  找募資</a>
							</li>
							<li><a href="contact.html"><i class="fas fa-envelope fa-lg"></i>   即時客服</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>