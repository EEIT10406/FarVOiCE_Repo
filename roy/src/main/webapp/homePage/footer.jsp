<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script>
	var talk = ["只要是石頭，到哪裡都不會發光的。","又一天過去了。今天過得怎麼樣，夢想是不是更遠了？",
		"別減肥了，你醜不僅是因為你胖。","有些人感慨：“自己年歲不小了，還沒有成熟起來。”其實你們已經成熟起來了，你們成熟起來就這樣。",
		"多照照鏡子，很多事情你就明白原因了。","如果你每天干的活明顯多於別人，但是自己很高興還感覺得到器重，與其說你很有才幹，還不如說你的領導很會管人。",
		"努力了那麼久，但凡有點天賦，也該有些成功的跡象了。","哪怕拋掉出身的因素，我也覺得你未必干得過別人。",
		"父母一直注重對我的品德教育。到了社會上我按照父母教我的接人待物，卻發現自己並不受別人的待見。","醜女讓人注意她的內在美，長相普通的女孩讓人忽視。 ",
		"有些人努力了一輩子，就是從社會的四流擠入到了三流。","長相不行的人，為人也未必好。只不過由於長久的寂寞折磨，有時會發瘋的對別人好。",
		"出身不好的限制也不光是平台問題。出身不好，說明你的父母混的也不怎麼樣，也許你的基因裡就寫著不行兩個字。","每個人都有幸福的權力，少數人有幸福的能力。",
		"社會學家和論理學家經過幾年的研究，得出兩個結論————長得醜有罪;毒向左走向右走不算人。","我看不起那些不如我的人，我嫉恨那些比我強的人。",
		"女生們寧肯做高富帥的備胎，也不肯接受Hi絲的求愛，這點從基因上保證了人類的進步。","男人不帥就不會出去拈花惹草麼？男人沒有事業就會把你放在第一位麼？有些女人真痴。",
		"以前跪著掙錢很少，於是我也模仿那些優秀的人，試著站起來，於是飯碗就丟了。","當聊天時別人和你說自己很忙的時候，別傻別天真，是他或她要留時間給更重要的人。",
		];
	function showTalk(){
		var random = Math.floor(Math.random()*20);
		alert(talk[random]);
	}
	
	</script>
<!-- === BEGIN FOOTER === -->
<div id="base" >
	<div class="container padding-vert-30 margin-top-40" >
		<div  class="row" >
			<!-- Sample Menu -->
			<div class="col-md-3 margin-bottom-20" >
				<h3 class="margin-bottom-10">關於發聲</h3>
				<ul class="menu">
					<li><a class="fa-tasks" href="#">會員服務條款</a></li>
					<li><a class="fa-users" href="#">隱私權保護政策</a></li>
					<li><a class="fa-signal" href="#">著作權保護措施</a></li>
					<li><a class="fa-coffee" href="#">免責聲明</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<!-- End Sample Menu -->
			<!-- Contact Details -->
			<div class="col-md-3 margin-bottom-20">
				<h3 class="margin-bottom-10">商務</h3>

				
					<p>
						<span>行銷合作</span>
						<span class="fa-envelope">Email:</span><a href="mailto:farvoiceeeit104@gmail.com">farvoiceeeit104@gmail.com</a>
					</p>
			</div>
			<!-- End Contact Details -->
			<!-- Thumbs Gallery -->
			<div class="col-md-3 margin-bottom-20">
				<h3 class="margin-bottom-10">這裡不知道要放甚麼</h3>
				<div class="thumbs-gallery">
					<a  id="yoga"
						href="#yoga" onclick="showTalk();"> 
						<img src="../img/how.jpg" height="200px" alt="how.jpg">
					</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- End Thumbs Gallery -->
			<!-- Disclaimer -->
			<div class="col-md-3 margin-bottom-20">
				<h3 class="margin-bottom-10">其他</h3>
				<p>人才招募</p>
				<p>FarVOiCE 媒體工具</p>
				<div class="clearfix"></div>
			</div>
			<!-- End Disclaimer -->
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- Footer Menu -->
<div id="footer">
	<div class="container">
		<div class="row">
			<div id="copyright" class="col-md-4">
				<p>(c) 2019 Your Copyright Info</p>
			</div>
			<div id="footermenu" class="col-md-8">
				<ul class="list-unstyled list-inline pull-right">
					<li><a href="#" target="_blank">Sample Link</a></li>
					<li><a href="#" target="_blank">Sample Link</a></li>
					<li><a href="#" target="_blank">Sample Link</a></li>
					<li><a href="#" target="_blank">Sample Link</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Footer Menu -->