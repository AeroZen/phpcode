<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>订餐情况</title>
<script src="/person/js/jquery.min.js"></script>
<?php
include ('../include/conn.php');
session_start();
date_default_timezone_set("Asia/Shanghai");
$y=date("Y",time());
$m=date("m",time());
$nowTime=date("Y-m-d",time());

/*判断当前是否月末*/
function DateOut($year,$month){
	return date("Y-m-d",mktime(0,0,0,$month+1,0,$year));
}
$thismonth=$y.$m;
?>

<script>
$(document).ready(function(e) {
	$(".botton").click(function(){
		var typeTemp=($(this).attr("type"));
		var Tstatus=($(this).attr("status"));
		$.post("/person/load/submit.php",{Action:"post",Type:typeTemp,status:Tstatus,Ttime:<?php echo ($thismonth+1) ?>},function(data){
			if(data==1){
				if($(".poker").html()=="已订餐"){
					$(".poker").html("未订餐");
					$("#poker").html("我要订餐").attr("status","0").addClass("confirm");
				}else{
					$(".poker").html("已订餐");
					$("#poker").html("取消订餐").attr("status","1").removeClass("confirm");
				}
			}else{
				$(".addtips").html('已取消订餐!');
			};
		})
	})
})
</script>

</head>

<body>
<table>
	<tr>
		<th colspan="2">
			<?php echo $y ?>年<?php echo ($m+1) ?>月订餐情况
		</th>
	</tr>
	<tr>
		<td class="b r" width="100">
			订餐状态：
		</td>
		<td>
			<?php
				/*订餐查询*/
				@$sql = 'select * from `signup` where `code` = "'.$_SESSION["code"].'" and `date`="'.($thismonth+1).'" and `type`="1"';
				$ret = $mysqli->query($sql);
				$num = $ret->num_rows;
				if($num>0){
					echo "<span class='poker'>未订餐</span>";
					echo "<a href='javascript:void(0)' id='poker' type='1' status='0' class='botton confirm'>我要订餐</a>";
				}else{
					echo "<span class='poker'>已订餐</span>";
					echo "<a href='javascript:void(0)' id='poker' type='1' status='1' class='botton'>取消订餐</a>";
				}
				/*订餐结束*/				
			?>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<?php echo $y ?>年<?php echo $m ?>月订餐情况
		</th>
	</tr>
	<tr>
		<td class="b r" width="100">
			订餐状态：
		</td>
		<td>
			<?php
				/*订餐查询*/
				@$sql = 'select * from `signup` where `code` = "'.$_SESSION["code"].'" and `date`="'.$thismonth.'" and `type`="1"';
				$ret = $mysqli->query($sql);
				$num = $ret->num_rows;
				if($num>0){
					echo "<span>未订餐</span>";
				}else{
					echo "<span>已订餐</span>";
				}
				/*订餐结束*/
				
			?>
		</td>
	</tr>
	<tr>
		<td class="b r">
			已取消订餐人数：
		</td>
		<td>
			<?php
				/*已订餐查询*/
				@$sql = 'select * from `signup` as m,`users` as t where m.code=t.code and `date`="'.$thismonth.'" and `type`="1" ORDER BY m.id ASC';
				$ret = $mysqli->query($sql);
				$num = $ret->num_rows;
				if($num>0){
					for ( $i = 0; $i < $num; $i++ ) {
						$ret->data_seek($i);
						$row = $ret->fetch_assoc();
						echo $row["cname"].";";
					}
					echo "(共".$num."人)";
				}else{
					echo "暂无人数";
				}
				/*订餐结束*/
			?>
		</td>
	</tr>
</table>
</body>
</html>