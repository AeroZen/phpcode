<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>扑克报名</title>
<script src="/person/js/jquery.min.js"></script>
<?php
$nowTime=date("Y-m-d",time());
$datearr = getdate();
$year = strtotime($datearr['year'].'-1-1');
$startdate = getdate($year);
$firstweekday = 7-$startdate['wday'];//获得第一周几天
$yday = $datearr['yday']+1-$firstweekday;//今年的第几天
/*判断当前是否月末*/
function DateOut($year,$month){
	return date("Y-m-d",mktime(0,0,0,$month+1,0,$year));
}
/*判断第几周*/
function weekNumber($timestamp = 'today') {
	if($timestamp == 'today') $timestamp = time();
	return date("W", $timestamp) - date("W", strtotime(date("Y-m-01", $timestamp))) + 1;
}

$thisweek=(ceil($yday/7)+1);
?>

<script>
$(document).ready(function(e) {
	$(".botton").click(function(){
		var typeTemp=($(this).attr("type"));
		var Tstatus=($(this).attr("status"));
		$.post("/person/load/submit.php",{Action:"post",Type:typeTemp,status:Tstatus,Ttime:<?php echo $thisweek ?>},function(data){
			if(data==1){
				if($(".poker").html()=="已报名"){
					$(".poker").html("未报名");
					$("#poker").html("我要报名").attr("status","1").addClass("confirm");
				}else{
					$(".poker").html("已报名");
					$("#poker").html("取消报名").attr("status","0").removeClass("confirm");
				}
			}else{
				$(".addtips").html('已取消报名!');
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
			2013年第<?php echo $thisweek ?>周德州扑克周赛报名
		</th>
	</tr>
	<tr>
		<td class="b r">
			德州扑克报名状态：
		</td>
		<td>
			<?php
				include ('../include/conn.php');
				session_start();
				if(date("w")==5&&date("H")<19){
					/*报名查询*/
					@$sql = 'select * from `signup` where `code` = "'.$_SESSION["code"].'" and `date`="'.$thisweek.'" and `type`="0"';
					$ret = $mysqli->query($sql);
					$num = $ret->num_rows;
					if($num>0){
						echo "<span class='poker'>已报名</span>";
						echo "<a href='javascript:void(0)' id='poker' type='0' status='0' class='botton'>取消报名</a>";
					}else{
						echo "<span class='poker'>未报名</span>";
						echo "<a href='javascript:void(0)' id='poker' type='0' status='1' class='botton confirm'>我要报名</a>";
					}
					/*报名结束*/
				}
				else{
					echo "报名时间：<span class='red'>周五(0:00-18:00)</span>";
				}
				
			?>
		</td>
	</tr>
	<tr>
		<td class="b r">
			已报名人数：
		</td>
		<td>
			<?php
				/*已报名查询*/
				@$sql = 'select * from `signup` as m,`users` as t where m.code=t.code and `date`="'.$thisweek.'" and `type`="0" ORDER BY m.id ASC';
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
					echo "暂无报名";
				}
				
				if(@$_SESSION["code"]=="00008"){
					echo "<a href='rtx.php' class='botton confirm'>发送RTX</a>";
				}
				/*报名结束*/
			?>
		</td>
	</tr>
</table>
</body>
</html>