<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>博雅互动</title>
<style type="text/css">
body{font:12px/1.5 "Microsoft Yahei","SimSun","Arial Narrow"; color:#34649D; background:url(images/body-bg.png)}
body,ul,li{margin:0; padding:0;}
ul{list-style:none;}
a{text-decoration:none; outline:none; blr:expression(this.onFocus=this.blur()); color:#3B5998;}
img{border:none; vertical-align:middle;}
textarea{font:12px 1.5 Arial, Helvetica, sans-serif;}
.b{font-weight:bold;}
.r{text-align:right}
.e{text-align:center;}
.red{color:#ff3300}
.cl:before,.cl:after{content:"";display:table;}
.cl:after{clear:both;}
.cl{zoom:1;}
.p5{padding:5px;}

table{width:100%;}
th,td{padding:5px;}
.content th{background:url(images/awhite.gif); border-bottom:1px solid #C8D1D5; color:#34649D;}
.content td{border-bottom:1px dotted #C8D1D5;}
.user{margin:20px auto 0; width:760px; position:relative}
.user label{font-weight:bold;}
.info{border:1px solid #C8D1D5; background:#FFF}
.content{margin-top:10px;}
.content div.tags{ background:url(images/1-1.gif) left bottom repeat-x ; height:33px;}
.content div.tags a{color:#FFF; height:32px; border:1px solid #2A6BAA; color:#FFF; cursor:pointer; float:left; font-size:14px; border-bottom:none; line-height:32px; padding:0 20px; overflow:hidden; text-align:center;background:url(images/ablue.gif) repeat-x left; margin-right:5px; display:inline-block;}
.content div.tags a.on{ background:#FFF; border:1px solid #C8D1D5; border-bottom:none;color:#2A6BAA; font-weight:bold}
.content .conbox {border:1px solid #C8D1D5; border-top:none;clear:both;font-size:12px; background:#FFFFFF;}
.content .conbox .tagContent{ display:none; padding:9px; background:#FFF url(/images/domainhead_bg.gif) right top no-repeat; }
.botton{background:url(images/awhite.gif); border:1px solid #C8D1D5; display:inline-block; padding:5px; margin-left:10px; color:#333; border-radius:5px; font-weight:bold}
.confirm{background:url(images/ablue.gif); color:#FFF;}

.container{width: 760px; margin:auto; overflow: hidden;}
.contents{width:760px; margin:auto; padding-top:50px;}
.contentBar{width:90px; margin:0 auto; padding-top:50px; padding-bottom:50px;}

.loading{padding-top:120px;}

/* STOP ANIMATION */
.stop {
	-webkit-animation-play-state:paused;
	-moz-animation-play-state:paused;
}
/* Loading Circle */
.ball {
	background-color: rgba(0,0,0,0);
	border:5px solid rgba(0,183,229,0.9);
	opacity:.9;
	border-top:5px solid rgba(0,0,0,0);
	border-left:5px solid rgba(0,0,0,0);
	border-radius:50px;
	box-shadow: 0 0 35px #2187e7;
	width:50px;
	height:50px;
	margin:0 auto;
	-moz-animation:spin .5s infinite linear;
	-webkit-animation:spin .5s infinite linear;
}

.ball1 {
	background-color: rgba(0,0,0,0);
	border:5px solid rgba(0,183,229,0.9);
	opacity:.9;
	border-top:5px solid rgba(0,0,0,0);
	border-left:5px solid rgba(0,0,0,0);
	border-radius:50px;
	box-shadow: 0 0 15px #2187e7; 
	width:30px;
	height:30px;
	margin:0 auto;
	position:relative;
	top:-50px;
	-moz-animation:spinoff .5s infinite linear;
	-webkit-animation:spinoff .5s infinite linear;
}

@-moz-keyframes spin {
	0% { -moz-transform:rotate(0deg); }
	100% { -moz-transform:rotate(360deg); }
}
@-moz-keyframes spinoff {
	0% { -moz-transform:rotate(0deg); }
	100% { -moz-transform:rotate(-360deg); }
}
@-webkit-keyframes spin {
	0% { -webkit-transform:rotate(0deg); }
	100% { -webkit-transform:rotate(360deg); }
}
@-webkit-keyframes spinoff {
	0% { -webkit-transform:rotate(0deg); }
	100% { -webkit-transform:rotate(-360deg); }
}

</style>
<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(e) {	
	$(".tags > a:eq(0)").trigger("click");
})
function loads(index,url){
	$(".loading").show();
	$index=$(index);
	$index.addClass("on").siblings().removeClass("on");
	$(".conbox").load("load/"+url,function(){
		$(".loading").hide();
	});
}
</script>
</head>
<body>
<?php
include ('include/conn.php');
include ('include/system.php');
?>
<div class="user">
	<div class="loading" style="display:none; position:absolute; left:0; top:0;">
		<div class="container">
			<div class="contents">
				<div class="ball"></div>
				<div class="ball1"></div>
			</div>
		</div>
	</div>
	<div class="info p5">
		<table>
			<tr>
				<td>
					<label>姓名：</label><?php echo $user['cname'];?>
				</td>
				<td>
					<label>英文名：</label><?php echo $user['username'];?>
				</td>
				<td>
					<label>工号：</label><?php echo $user['code'];?>
				</td>
		</table>	
	</div>
	<div class="content">
		<div class="tags cl">
			<a href="javascript:void(0);" onClick="loads(this,'doc.php')">文档下载</a>
			<a href="javascript:void(0);" onClick="loads(this,'poker.php')">扑克报名</a>
			<a href="javascript:void(0);" onClick="loads(this,'dinner.php')">每月订餐</a>			
			<a href="javascript:void(0);" onClick="loads(this,'gbook.php')">建议反馈</a>			
		</div>
		<div class="conbox">
			
		</div>
	</div>
</div>
</body>
</html>