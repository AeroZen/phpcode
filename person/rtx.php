<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>博雅互动</title>
<style type="text/css">
body{font:12px/1.5 Arial, Helvetica, sans-serif; color:#333;}
body,ul,li{margin:0; padding:0;}
ul{list-style:none;}
a{text-decoration:none;}
img{border:none; vertical-align:middle;}
.status{color:#ff3300}
.botton{background:#EFEFEF; border:1px solid #999; display:inline-block; padding:5px; margin-left:10px; color:#333;}
</style>
</head>
<body>
<?php
include ('include/conn.php');
include 'class/class.rtx.php';
date_default_timezone_set("Asia/Shanghai");
$nowTime=date("Y-m-d",time());
$datearr = getdate();
$year = strtotime($datearr['year'].'-1-1');
$startdate = getdate($year);
$firstweekday = 7-$startdate['wday'];//获得第一周几天
$yday = $datearr['yday']+1-$firstweekday;//今年的第几天
$recevier="CastielZeng;";
@$sql = 'select * from `signup` as m,`users` as t where m.code=t.code and `date`="'.$nowTime.'" and `type`="0"';
$ret = $mysqli->query($sql);
$num = $ret->num_rows;
if($num>0){
	for ( $i = 0; $i < $num; $i++ ) {
		$ret->data_seek($i);
		$row = $ret->fetch_assoc();
		$recevier.=$row["username"].";";
	}
}
$msg = "第".(ceil($yday/7)+1).'周扑克比赛已正式开始了！';
$sendType = 'sendIM';


$rtx = RTX::send($recevier, $msg, $sendType);
if ( $rtx['errno'] == 0 ) {
	echo '<script>alert("发送成功");history.go(-1);</script>';
} else {
	echo '<script>alert("发送失败");history.go(-1);</script>';
}
?>
</body>
</html>