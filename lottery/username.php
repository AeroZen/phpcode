<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>博雅互动</title>
<style type="text/css">
body{font:12px/1.5 Verdana, Geneva, sans-serif;}
body,ul,li{margin:0; padding:0;}
ul{list-style:none;}
a{text-decoration:none;}
img{border:none; vertical-align:middle;}
.tips{position:absolute; background:#FFF; border:1px solid #ccc; display:none}
.tips li{cursor:pointer; padding:5px;}
.tips li:hover{background:#dddddd;}
.red{color:#F00;}
</style>
<script src="js/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$valtemp=0;
	$("input[type=text]").each(function(i){
		$(this).keyup(function(){
			$(".tips").css({
				"top":($(this).position().top+20),
				"left":$(this).position().left,
				"display":"block"
			});
			$valtemp=i;
			$.post("operate.php", {name:$(this).val(),operate:"select"},
			function(data){
				$(".tips").html(data);
				$(".tips li").click(function(){
					$("input[type=text]:eq("+$valtemp+")").val($(this).html());
				})
			});	
		})
		$(this).blur(function(){
			var thisid=$(this).parent().prev().html();			
			setTimeout(function(){
				$(".tips").css({
					"display":"none"
				});
				$.post("operate.php", {name:$("input[type=text]:eq("+$valtemp+")").val(),codeid:thisid,operate:"update"},
					function(data){
						if(data==1){
							$("input[type=text]:eq("+$valtemp+")").addClass("red");
						}						
				});	
				
			},1000)				
			if($(this).val()!=""){
				
			}
		})
	})
	
})
</script>
</head>
<body>
<ul class="tips"></ul>
<table class="adtab">
	<tr>
		<th>ID</th>		
		<th>奖品</th>
		<th>编号</th>
		<th>领奖人</th>
	</tr>
<?php
include ("include/conn.php");
$sql = 'select * from `by_prize` as m,`by_user` as t where m.id=t.prizeid and t.prizeid!="0" ORDER BY t.prizeid ASC';
$ret = $mysqli->query($sql);;
$num = $ret->num_rows;

for ( $i = 0; $i < $num; $i++ ) {
	$ret->data_seek($i);
	$row = $ret->fetch_assoc();//以关联数组显示
	// $row = $ret->fetch_row();//以索引数组显示
	// $row = $ret->fetch_array();//以关联数组和索引数组两种方式显示

	echo "<tr><td>".($i+1)."</td><td>".($row["prizeid"])."号奖品：".($row["prize"])."</td><td>".($row["codeid"])."</td><td><input type='text' value='".$row["prizename"]."' />"."</td></tr>";
}

?>
</table>
</body>
</html>