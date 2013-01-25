<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>博雅互动</title>
<script src="http://auth.boyaa.com/"></script>
<script src="js/jquery.min.js"></script>
</head>
<body>
<?php
if($_POST["Action"]=="post"&&$_POST["Type"]!=""){
	include ('include/conn.php');
	@session_start();
	@$_SESSION['code'] = $user['code'];
	$nowTime=date("Y-m-d",time());
	$sql = 'select * from `signup` where `code` = "'.@$_SESSION["code"].'" and `date`="'.$nowTime.'" and `type`="'.$_POST["Type"].'"';
	$ret = $mysqli->query($sql);
	$num = $ret->num_rows;
	if($num>0){
		$sql = 'delete from `signup` where `code` = "'.@$_SESSION["code"].'" and `date`="'.$nowTime.'" and `type`="'.$_POST["Type"].'"';
		$mysqli->query($sql);
		if($_POST["Type"]==0){
			echo "0";
		}else{
			echo "2";
		}
	}else{
		$sql = 'insert into `signup` (`code`,`type`,`date`) values ("'.@$_SESSION["code"].'","'.$_POST["Type"].'","'.$nowTime.'")';
		$mysqli->query($sql);
		if($_POST["Type"]==0){
			echo "1";
		}else{
			echo "3";
		}
	}
}else{
	echo "请勿非法递交数据！";
}
?>
</body>
</html>
