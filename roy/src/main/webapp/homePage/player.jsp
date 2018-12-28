<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.bootcss.com/aplayer/1.10.1/APlayer.min.css"
	rel="stylesheet">
<style>
#player {
	margin: 0%;
	padding: 0%;
	position: fixed;
	bottom: 0;
	right: 0;
	width: 21.3%;
	position: fixed;
}
</style>
<script src="https://cdn.bootcss.com/aplayer/1.10.1/APlayer.min.js"></script>
<script>
	$(document).ready(function() {
// 		$('#login').click(function() {
// 			window.location.href = "login.jsp";
// 		})
// 		$('#upload').click(function() {
// 			window.location.href = "upload.jsp";
// 		})
		
		<!-- APlayer -->
		toggleFlag = true;
		$('#listToggle').click(function() {
			$('#player1').slideToggle(500);
			if(toggleFlag) {
				$(this).removeClass( "fa-arrow-down" );
				$(this).addClass ("fa-arrow-up" );
				toggleFlag = !toggleFlag;
			} else {
			$(this).removeClass( "fa-arrow-up" );
			$(this).addClass ("fa-arrow-down" );
			toggleFlag = !toggleFlag;
			}
		})
		$('#addtest').click(function() {
			ap.list.add([{
				title : 'addtest',
				author : 'addtest',
				url : 'jPlayer-2.9.2/examples/blue.monday/addtest.mp3',
				pic : 'jPlayer-2.9.2/examples/blue.monday/addtest.gif'
			}]);
		})
	})
</script>
<div id="player2">
	<p class="fa-arrow-down" id="listToggle" />
	<input id="addtest" type="button" value="addtest">
	<div id="player1">
		<pre class="aplayer-lrc-content">
                [00:00.00] 作曲 : 林一峰
                [00:01.00] 作词 : 易家扬
                [00:24.898]听见 冬天的离开
                [00:29.697]我在某年某月 醒过来
                [00:34.768]我想 我等 我期待
                [00:40.598]未来却不能因此安排
                [00:53.398]阴天 傍晚 车窗外
                [00:58.758]未来有一个人在等待
                [01:04.298]向左向右向前看
                [01:09.599]爱要拐几个弯才来
                [01:14.369]我遇见谁 会有怎样的对白
                [01:19.638]我等的人 他在多远的未来
                [01:24.839]我听见风来自地铁和人海
                [01:30.399]我排着队 拿着爱的号码牌
                [01:56.388]阴天 傍晚 车窗外
                [02:02.298]未来有一个人在等待
                [02:06.650]向左向右向前看
                [02:12.000]爱要拐几个弯才来
                [02:16.980]我遇见谁 会有怎样的对白
                [02:22.289]我等的人 他在多远的未来
                [02:27.989]我听见风来自地铁和人海
                [02:32.688]我排着队 拿着爱的号码牌
                [02:43.380]我往前飞 飞过一片时间海
                [02:48.298]我们也曾在爱情里受伤害
                [02:53.689]我看着路 梦的入口有点窄
                [02:58.748]我遇见你是最美丽的意外
                [03:05.888]总有一天 我的谜底会揭开
            </pre>
	</div>
	<script>
		var ap = new APlayer({
			element : document.getElementById('player1'),
			narrow : false,
			autoplay : true,
			showlrc : true,
			audio : [ {
				title : 'addtest',
				author : 'addtest',
				url : 'music/addtest.mp3',
				pic : 'music/addtest.gif'
			}, {
				title : 'addtest',
				author : 'addtest',
				url : 'jPlayer-2.9.2/examples/blue.monday/addtest.mp3',
				pic : 'jPlayer-2.9.2/examples/blue.monday/addtest.gif'
			} ]
		});
		ap.init();
	</script>
</div>
</html>