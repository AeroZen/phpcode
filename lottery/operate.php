<?php
include ("include/conn.php");
switch($_POST["operate"]){
	//重置抽奖人数
	case adduser:		
		$usernum=(floatval($_POST["usernum"])+1);
		$sql = "TRUNCATE TABLE `by_user`";
		if(!$mysqli->query($sql)){
			echo 0;
			exit;
		}
		for($i=1;$i<$usernum;$i++){	
			$sql = "INSERT INTO by_user (codeid,prizeid) VALUES('".sprintf("%03d",$i)."','0')";
			if(!$mysqli->query($sql)){
				echo 0;exit;
			}
		}
		$sql = 'select * from `by_prize`';
		$ret = $mysqli->query($sql);;
		$num = $ret->num_rows;
		$sql = "update `by_current` set `curnum` = '".$num."' where `id` = '1'";
		if(!$mysqli->query($sql)){
			echo 0;exit;
		};
		echo 1;		
		break;
	//删除空号人员
	case clearuser:
		$username=$_POST["nulluser"];
		$userarray=explode("\n",$username);
		foreach($userarray as $key => $val){
			$sql = 'delete from `by_user` where `codeid` = "'.sprintf("%03d",$val).'"';
			if(!$mysqli->query($sql)){
				echo 0;exit;
			}			
		}
		echo 1;
		break;
	//增加奖品名称
	case addprize:
		$sql = "INSERT INTO by_prize (prize,num) VALUES('".$_POST["prizename"]."','".$_POST["prizenum"]."')";
		if(!$mysqli->query($sql)){
			echo 0;exit;
		}
		echo 1;
		break;
	//删除奖品名称
	case delprize:
		$sql = 'delete from `by_prize` where `id` = "'.$_POST["prizeid"].'"';
		if(!$mysqli->query($sql)){
			echo 0;exit;
		}
		echo 1;
		break;
	//设置奖品位置
	case prizeindex:
		$sql = "update `by_current` set `curnum` = '".$_POST["prizeindex"]."' where `id` = '1'";
		if(!$mysqli->query($sql)){
			echo 0;exit;
		};
		echo 1;	
		break;
	//查询工号及姓名
	case select:
		$sql = "select * from `by_users` where  CONCAT(`code`,`cname`,`username`) like '%".$_POST['name']."%'";
		$ret = $mysqli->query($sql);
		$num = $ret->num_rows;
		$userarray="";
		while($row = mysqli_fetch_array($ret)){
			$userarray.="<li>".$row["cname"]."(".$row["username"].",".$row["code"].")</li>";
		}
		echo $userarray;
		break;
	//更新领奖人
	case update:
		$sql = "update `by_user` set `prizename` = '".$_POST["name"]."' where `id` = '".$_POST["codeid"]."'";
		if(!$mysqli->query($sql)){
			echo 0;exit;
		};
		echo 1;	
		break;
	
}
?>