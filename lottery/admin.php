<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>后台操作页面</title>
<style type="text/css">
body{font:12px/1.5 Verdana, Geneva, sans-serif;}
body,ul,li{margin:0; padding:0;}
ul{list-style:none;}
a{text-decoration:none;}
img{border:none; vertical-align:middle;}
.fl{float:left;}
.fr{float:right;}
.tc{text-align:center;}
.cl:before,.cl:after{content:"";display:table;}
.cl:after{clear:both;}
.cl{zoom:1;}
.lotadmin{margin:auto; width:760px; border:1px solid #BDBDBD; background:#E7EBF2;}
.lotadmin h3{background:#135BA5; margin:0; padding:10px 0; color:#FFF;}
.lotl{width:169px;}
.lotl li{padding:5px; border-bottom:1px dotted #ccc; font-weight:bold}
.lotl a{color:#222; font-size:14px;}
.lotr{width:580px; padding:5px; border-left:1px solid #BDBDBD; background:#F2F2F2; min-height:300px;}
.adtab{width:100%; border-collapse:collapse}
.adtab th,.adtab td{padding:5px; border:1px solid #BDBDBD}
.adtab th{background:#E7EBF2; color:#F00; font-size:14px;}
.red{color:#ff0000; display:inline-block; padding:0 5px;}
.gray{color:#999}
.s{background:#FFF;}
.s a{color:#F00}
</style>
<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(e) {
	$(".lotl>ul>li").each(function(i) {
		$(this).click(function(){
			$(this).addClass("s").siblings().removeClass("s");
			$(".lotr>ul>li:eq("+i+")").slideDown().siblings().slideUp();
			if(i==6){
				$(".lotr>ul>li:eq("+i+")").load("username.php");
			}
		})
	});
	
	$(".adduser").click(function(){
		if(confirm('修改人数将会清空已发奖品，您是否确定？')){
			$.post("operate.php", {usernum:$("[name='usernum']").val(),operate:"adduser"},
			function(data){
				if(data==1){
					$(".addtips").html('操作成功!');
				}else{
					$(".addtips").html('操作失败!');
				};
			});
        }
	})	
	$(".clearuser").click(function(){
		if(confirm('删除空号将被取消资格，您是否确定？')){
			$.post("operate.php", {nulluser:$("[name='nulluser']").val(),operate:"clearuser"},
			function(data){
				if(data==1){
					$(".cleartips").html('操作成功!');
				}else{
					$(".cleartips").html('操作失败!');
				};
			});
        }
	})
	$(".addprize").click(function(){
		if(confirm('增加奖品将会影响到抽奖结果，您是否确定？')){
			$.post("operate.php", {prizename:$("[name='prizename']").val(),prizenum:$("[name='prizenum']").val(),operate:"addprize"},
			function(data){
				if(data==1){
					$(".addptips").html('操作成功!');
				}else{
					$(".addptips").html('操作失败!');
				};
			});
        }
	})
	
	$(".delprize").click(function(){
		if(confirm('删除奖品将会影响到抽奖结果，您是否确定？')){
			$.post("operate.php", {prizeid:$("[name='delprize']").val(),operate:"delprize"},
			function(data){
				if(data==1){
					$(".delptips").html('操作成功!');
				}else{
					$(".delptips").html('操作失败!');
				};
			});
        }
	})	
	
	$(".prizeindex").click(function(){
		if(confirm('更改奖品位置将会影响到抽奖结果，您是否确定？')){
			$.post("operate.php", {prizeindex:$("[name='prizeindex']").val(),operate:"prizeindex"},
			function(data){
				if(data==1){
					$(".indextips").html('操作成功!');
				}else{
					$(".indextips").html('操作失败!');
				};
			});
        }
	})
	
	$(".resetting").click(function(){
		if(confirm('您确定要修改奖品及数量？')){
			$("#resetting").submit();
        }
	})
	
})
</script>
</head>

<body>
<div class="lotadmin">
	<h3 class="tc">博雅互动年会抽奖后台管理系统</h3>
	<div class="cl">
		<div class="lotl fl tc">
			<ul>
				<li class="s"><a href="#@">抽奖人数设置</a></li>
				<li><a href="#@">删除抽奖空号</a></li>
				<li><a href="#@">添加抽奖奖品</a></li>				
				<li><a href="#@">删除抽奖奖品</a></li>
				<li><a href="#@">设置抽奖位置</a></li>
				<li><a href="#@">奖品数量设置</a></li>
				<li><a href="#@">查询中奖情况</a></li>
			</ul>
		</div>
		<div class="lotr fr">
			<ul>
				<li>
				<table class="adtab">
					<tr>
						<th colspan="2">参加抽奖人数设置</th>
					</tr>
					<tr>
						<td width="120">
							<label>参加人数：</label>
						</td>
						<td>
							<input type="text" value="" class="usernum" name="usernum" /><span class="addtips red">人数必须大于263</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="adduser" type="button" value="递交">
						</td>
					</tr>
				</table>
				</li>
				<li style="display:none">
				<table class="adtab">
					<tr>
						<th colspan="2">删除编号</th>
					</tr>
					<tr>
						<td width="120">		
							<label>编号：</label>
						</td>
						<td>
							<textarea name="nulluser" cols="30" rows="3"></textarea><span class="cleartips red">多个编号请回车；</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">	
							<input class="clearuser" type="button" value="递交">
						</td>
					</tr>
				</table>
				</li>
				<li style="display:none">
				<table class="adtab">
					<tr>
						<th colspan="2">添加抽奖奖品</th>
					</tr>
					<tr>
						<td width="120">奖品名称：</td>
						<td><input type="text" value="" name="prizename" /><span class="addptips red"></span></td>
					</tr>
					<tr>
						<td>数量：</td>
						<td><input type="text" value="" name="prizenum" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="addprize" type="button" value="递交">
						</td>
					</tr>
				</table>
				</li>
				<li style="display:none">
				<table class="adtab">
					<tr>
						<th colspan="2">删除抽奖奖品</th>
					</tr>
					<tr>
						<td>奖品ID：</td>
						<td><input type="text" value="" name="delprize" /><span class="delptips red"></span></td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="delprize" type="button" value="递交">
						</td>
					</tr>
				</table>
				</li>
				<li style="display:none">
				<table class="adtab">
					<tr>
						<th colspan="2">设置抽奖位置</th>
					</tr>
					<tr>
						<td>当前抽奖位置：</td>
						<td>
						<?php
							include ("include/conn.php");
							$sql = 'select * from `by_current` where id="1"';
							$ret = $mysqli->query($sql);
							while($trow = mysqli_fetch_array($ret)){	
								echo '<input type="text" value="'.$trow["curnum"].'" name="prizeindex" />';
							}
						?>
						<span class="indextips red"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="prizeindex" type="button" value="递交">
						</td>
					</tr>
				</table>
				</li>
				<li style="display:none">
				<table class="adtab">
					<tr>
						<th colspan="2">设置奖品及数量</th>
					</tr>
					<tr>
						<td width="120">奖品名称</td>
						<td>奖品数量</td>
					</tr>
					<form action="resetting.php" method="post">
					<?php
					include ("include/conn.php");
					$sql = 'select * from `by_prize` ORDER BY id ASC';
					$ret = $mysqli->query($sql);;
					$num = $ret->num_rows;
					while($row = mysqli_fetch_array($ret)){	
						echo "<tr><td>".$row["id"].".".$row["prize"]."</td><td><input name='".$row["id"]."' type='text' value='".$row["num"]."' /></td></tr>";
					}
					?>
					<tr>
						<td colspan="2">	
							<input class="resetting" type="submit" value="递交"> <span class="resettips red"></span>
						</td>
					</tr>
					</form>
				</table>
				</li>
				<li>
					
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="gray tc">
	技术支持：博雅互动 前端开发组
</div>
</body>
</html>
