<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script defer src="https://use.fontawesome.com/releases/v5.6.3/js/all.js" integrity="sha384-EIHISlAOj4zgYieurP0SdoiBYfGJKkgWedPHH4jCzpCXLmzVsw1ouK59MuUtP4a1" crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function() {
		$('#login').click(function() {
			window.location.href = "/roy/login-signUp-upload/login.jsp";
		})
		$('#logout').click(function() {
			window.location.href = "/roy//login-signUp-upload/MemberLogOut.controller";
		})
		$('#upload').click(function() {
			window.location.href = "/roy/login-signUp-upload/upload.jsp";
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
					<img src="../img/logo.PNG" alt="Logo" />
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
						<button id="login" type="button" class="btn btn-outline-danger">
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
							<li>	
								<img src="../personalPage/imgs/profile/${user.member_username}.jpg"  class="img-circle" style="width:45px;height:45px;" />
							</li>
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
									<li class="parent"><span>Typography</span>
										<ul>
											<li><a href="features-typo-basic.html">Basic
													Typography</a></li>
											<li><a href="features-typo-blockquotes.html">Blockquotes</a>
											</li>
										</ul></li>
									<li class="parent"><span>Components</span>
										<ul>
											<li><a href="features-labels.html">Labels</a></li>
											<li><a href="features-progress-bars.html">Progress
													Bars</a></li>
											<li><a href="features-panels.html">Panels</a></li>
											<li><a href="features-pagination.html">Pagination</a></li>
										</ul></li>
									<li class="parent"><span>Icons</span>
										<ul>
											<li><a href="features-icons.html">Icons General</a></li>
											<li><a href="features-icons-social.html">Social
													Icons</a></li>
											<li><a href="features-icons-font-awesome.html">Font
													Awesome</a></li>
											<li><a href="features-icons-glyphicons.html">Glyphicons</a>
											</li>
										</ul></li>
									<li><a href="features-testimonials.html">Testimonials</a>
									</li>
									<li><a href="features-accordions-tabs.html">Accordions
											& Tabs</a></li>
									<li><a href="features-buttons.html">Buttons</a></li>
									<li><a href="features-carousels.html">Carousels</a></li>
									<li><a href="features-grid.html">Grid System</a></li>
									<li><a href="features-animate-on-scroll.html">Animate
											On Scroll</a></li>
								</ul></li>
							<li><a href="../searchMusic/searchLists.jsp"><i class="fas fa-list-ol fa-lg"></i>   聽歌單</a>
								<ul>
									<li><a href="pages-about-us.html">About Us</a></li>
									<li><a href="pages-services.html">Services</a></li>
									<li><a href="pages-faq.html">F.A.Q.</a></li>
									<li><a href="pages-about-me.html">About Me</a></li>
									<li><a href="pages-full-width.html">Full Width</a></li>
									<li><a href="pages-left-sidebar.html">Left Sidebar</a></li>
									<li><a href="pages-right-sidebar.html">Right Sidebar</a></li>
									<li><a href="pages-login.html">Login</a></li>
									<li><a href="pages-sign-up.html">Sign-Up</a></li>
									<li><a href="pages-404.html">404 Error Page</a></li>
								</ul></li>
							<li><a href="/roy/searchMusic/searchMusic.jsp"><i class="fas fa-headphones fa-lg"></i>  找音樂</a>
								<ul>
									<li><a href="portfolio-2-column.html">2 Column</a></li>
									<li><a href="portfolio-3-column.html">3 Column</a></li>
									<li><a href="portfolio-4-column.html">4 Column</a></li>
									<li><a href="portfolio-6-column.html">6 Column</a></li>
								</ul></li>
							<li><a href="/roy/findArticle/findArticle.jsp"><i class="fas fa-pencil-alt fa-lg"></i>   找文章</a>
<!-- 								<ul> -->
<!-- 									<li><a href="blog-list.html">Blog</a></li> -->
<!-- 									<li><a href="blog-single.html">Blog Single Item</a></li> -->
<!-- 								</ul></li> -->
							<li><a href="index.html"><i class="fas fa-search-dollar fa-lg"></i>  找募資</a>
							</li>
							<li><a href="contact.html"><i class="fas fa-envelope fa-lg"></i>   即時客服</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>