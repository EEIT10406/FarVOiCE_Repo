<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>FarVOiCE | 登錄帳號</title>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"  ></script>
<!--Google登入-->
    <script async defer src="https://apis.google.com/js/api.js" onload="this.onload=function(){};HandleGoogleApiLibrary()"
            onreadystatechange="if (this.readyState === 'complete') this.onload()"></script>
    <script type="text/javascript">
        //進入 https://console.developers.google.com/，找「憑證」頁籤(記得先選對專案)，即可找到用戶端ID
        let Google_appId = "951757376731-dv4o57orj6hpqshouf7a5h5iseu2uiok.apps.googleusercontent.com";

        // Called when Google Javascript API Javascript is loaded
        function HandleGoogleApiLibrary() {
            // Load "client" & "auth2" libraries
            gapi.load('client:auth2', {
                callback: function () {
                    // Initialize client & auth libraries
                    gapi.client.init({
                        clientId: Google_appId,
                        scope: 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/plus.me'
                    }).then(
                        function (success) {
                            // Google Libraries are initialized successfully
                            // You can now make API calls 
                            console.log("Google Libraries are initialized successfully");
                        },
                        function (error) {
                            // Error occurred
                            console.log(error);// to find the reason 
                        }
                    );
                },
                onerror: function () {
                    // Failed to load libraries
                    console.log("Failed to load libraries");
                }
            });
        }

        function GoogleLogin() {
            // API call for Google login  
            gapi.auth2.getAuthInstance().signIn().then(
                function (success) {
                    // Login API call is successful 
                    console.log(success);
                    //id
                    console.log(success.El);
                    //email
                    console.log(success.w3.U3);
//                     let Google_ID = success["El"];  
                    let third_Id = success.El;
                    window.location.href = "/roy/login-signUp-upload/MemberLogin.controller?third_Id="+third_Id;
                },
                function (error) {
                    // Error occurred
                    // console.log(error) to find the reason
                    console.log(error);
                }
            );
        }

<!--Google登入 end-->
<!-- fb登入 begin -->


  window.fbAsyncInit = function() {
    FB.init({
    	//應用程式編號
      appId      : '1218501244979504',
      cookie     : true,
      xfbml      : true,
      version    : 'v3.2'
    });
      
    FB.AppEvents.logPageView();   
      
  };  
  
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/zh_TW/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

//使用自己客製化的按鈕來登入
function FBLogin() {
    
    FB.login(function (response) {
        //debug用
        console.log(response);
        if (response.status === 'connected') {
            //user已登入FB
            //抓userID
            let third_Id = response["authResponse"]["userID"];
            console.log("userID:" + third_Id);
            window.location.href = "/roy/login-signUp-upload/MemberLogin.controller?third_Id="+third_Id;
           
        } else {
            // user FB取消授權
            alert("Facebook帳號無法登入");
        }
    }, { scope: 'public_profile,email' });

}


<!--fb登入 end-->

	function IsEmail(email) {
	    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	    if(!regex.test(email)) {
	        return false;
	    }else{
	        return true;
	    }
	}
	function submit_frm(){
		 alert("記得去收驗證信喔!");
        var frm = document.getElementById("sendEmail");  
        frm.action = "/roy/register/sendMail";  
        frm.method = "post";                 
        frm.submit();                        
    }

	$(document).ready(function() {
		$('#login').click(function() {
			window.location.href = "login.jsp";
		})
		$('#upload').click(function() {
			window.location.href = "upload.jsp";
		})
		if($('#loginError h3').html() == "此帳號未啟用"){
			var button = "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModalCenter'>點我開通</button>";
			$('#loginError').append(button);
			$('#emailCheck').blur(function() {
				if(!IsEmail($('#emailCheck').val())){
					$('#emailError').html("信箱格式錯誤!");
				}else{
					$('#emailError').html("");
				}

			})
		}
		
	})
	
	<c:if test="${not empty thirdSignUp}">
	alert('${thirdSignUp.thirdSignUp}')
	</c:if>
</script>

<style>
*{
 font-family:"微軟正黑體";
}
h3{
 font-family:"微軟正黑體";
}
</style>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="container">
					<div class="row margin-vert-30">
						<!-- Login Box -->
						<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
							<form class="login-page" action="/roy/login-signUp-upload/MemberLogin.controller" method="post">
								<div class="login-header margin-bottom-30">
									<h3>請輸入帳號與密碼</h3>
									<br>
									<div id="loginError" style='color:#880000;background-color:#ffcccc;width:100%;text-align:center;'><h3 style="display:inline;margin:auto;vertical-align: middle;">${errors.loginError}</h3></div>
								</div>
								
								<div class="input-group margin-bottom-20">
									<span class="input-group-addon"> <i class="fa fa-user"></i>
									</span> <input placeholder="帳號" style="${CssError}" class="form-control" type="text" id="username" name="username" value="${param.username}"
											required
											oninvalid="setCustomValidity('請輸入帳號');"
											oninput="setCustomValidity('');"
											>
									<span id="sp1" style='color:#880000;'>${errors.usernameError}</span>
								</div>
								<div class="input-group margin-bottom-20">
									<span class="input-group-addon"> <i class="fa fa-lock"></i>
									</span> <input placeholder="密碼" style="${CssError}" class="form-control" type="password" id="password" name="password" value="${param.password}"
										required
										oninvalid="setCustomValidity('請輸入密碼');"
										oninput="setCustomValidity('');"
									>
									<span id="sp2" style='color:#880000;'>${errors.passwordError}</span>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label class="checkbox"> <input type="checkbox">記住密碼
										</label>
									</div>
									<div class="col-md-6">
										<button class="btn btn-primary pull-right" type="submit">登入</button>
									</div>
                        <!-- 	fb登入  begin -->
                        <div class="fb-login-button" style="margin-bottom:10px;margin-left:20px;" data-scope="public_profile,email" data-onlogin="FBLogin()" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
                        <!-- 	fb登入  end -->
                        <!-- 	google登入  begin -->
                        <div style="margin-left:0px;float:right;cursor: pointer;">
                         <img src="../img/google.png" onclick="GoogleLogin()" width="200px" height="30px"/></div>
                         <!-- 	google登入  end -->
								</div>
								<hr>
								<h5>
									還沒註冊嗎 ?<a href="#" style="float: right;">忘記密碼</a>
								</h5>
								<a href="signUp.jsp">按這裡</a>註冊帳號
							</form>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
							  Launch demo modal
							</button>
							</div>
					
						
						<!-- 點我開通 -->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalCenterTitle">難道Email錯了嗎?</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body" >
						         <form id="sendEmail">
						      		Dear ${userNickname} 您好: <br>
						        	是不是沒驗證到信箱呢?<br>
						        	在此輸入新的Email為您再寄一次驗證信喔。<br>
						        	<input hidden="true" type="text" name="userAccount" value="${param.username}">
						        	<input hidden="true" type="text" name="userPassword" value="${param.password}" >
						        	 <input id="emailCheck" type="text" placeholder="新的信箱" name="userEmail" style="width:230px">
						        	 <span id="emailError" style='color:#880000;'></span>
						        </form>	
						        
						      </div>
						      <div class="modal-footer">
						   
						       
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">不屑驗證啦</button>
						        <button type="button" class="btn btn-primary" onclick="submit_frm()">再次寄出驗證信</button>
						     
						      </div>
						      
						    </div>
						  </div>
						</div>
						<!-- End 點我開通 -->
						
						<!-- End Login Box -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			document.getElementById("username").addEventListener("blur",
					chkusername);
			document.getElementById("password").addEventListener("blur",
					chkPassword);
		});

		function chkusername() {
			var name = document.getElementById("username").value;
			
			if (name == "") {
				document.getElementById("sp1").innerHTML = "<span style='color:#880000;'>  這個欄位是必須的。</span>";				
					$("#username").css("border","1px #880000 solid");
			}
			else{
				document.getElementById("sp1").innerHTML = "<span style='color:#880000;'></span>";				
				$("#username").css("border","");
			}
		}
		
		function chkPassword() {
			var pass = document.getElementById("password").value;
			
			if (pass == "") {
				document.getElementById("sp2").innerHTML = "<span style='color:#880000;'>  此欄位是必須的。</span>";					
				$("#password").css("border","1px #880000 solid");
			}else{
				document.getElementById("sp2").innerHTML = "<span style='color:#880000;'></span>";					
				$("#password").css("border","");
			}
		}
	</script>
	
	<!-- === END CONTENT === -->
	
	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
	<jsp:include page="../homePage/player.jsp"/>
	</div>
</body>
</html>