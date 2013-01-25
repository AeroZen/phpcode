<?php
include ("include/conn.php");
$sql = 'select * from `by_current` where `id` = "1" ';
$ret = $mysqli->query($sql);
$row = mysqli_fetch_array($ret);
lottery($row['curnum']);
function lottery($prizetemp){
	include ("include/conn.php");
	$prizeID=intval($prizetemp);
	//设置下次抽奖
	$nextprize=$prizeID;
	//设置当前抽中人
	$username=array();
	$sql = 'select * from `by_prize` where `id` = "'.$prizeID.'"';
	$ret = $mysqli->query($sql);
	$num = $ret->num_rows;
	if($num>0){
		$resetprize=1;
		while($row = mysqli_fetch_array($ret)){	
			//查詢已發出了多少份獎品
			$psql = 'select * from `by_user` where `prizeid` = "'.$row["id"].'"';
			$pret = $mysqli->query($psql);
			$pnum = $pret->num_rows;
			if($pnum==0){
				$resetprize=0;
			}
			//設置獎品總數
			$temprow=(floatval($row["num"])-1-$pnum);
			//查詢沒有獎品的人
			$nsql = 'select * from `by_user` where `prizeid` = "0"';
			$nret = $mysqli->query($nsql);;
			$nnum = $nret->num_rows;
			//將沒有得獎的人存成數組
			$userarray=array();
			while($trow = mysqli_fetch_array($nret)){				
				array_push($userarray,$trow["codeid"]);
			}
			//打乱数组
			shuffle($userarray);
			//判斷已發獎品小於要發獎品		
			if($pnum < $row["num"]){
				//判斷剩餘數量大於10，如果小於10則用相減
				if(($row["num"]-10)>$pnum){
					$lotnum=10;
				}else{
					$lotnum=($row["num"]-$pnum);
				}
				//最多循環抽10次
				for($i=0;$i<$lotnum;$i++){					
					//取得隨機編號存入數據庫
					$sql = "update `by_user` set `prizeid` = '".$row["id"]."' where `codeid` = '".$userarray[$i]."'";
					if($mysqli->query($sql)){
						array_push($username,$userarray[$i]);
					};
					
					//當前發獎編號等於實發獎品則更新數據庫跳下個獎品
					if($i == $temprow){
						//下一個待發獎品
						$nextprize=($prizeID-1);
						$sql = "update `by_current` set `curnum` = '".$nextprize."' where `id` = '1'";
						$mysqli->query($sql);
					}				
				}
			}else if($pnum == $row["num"]){
				$sql = "update `by_current` set `curnum` = '".$nextprize."' where `id` = '1'";
				$mysqli->query($sql);
				//如果當前獎勵發完，直接跳下級獎品
				lottery($nextprize);
			}else{
				echo "奖品已发完";
			}
		}
		$arr=array(
			'nextid'=>$prizetemp,
			'username'=>$username,
			'resetprize'=>$resetprize
		);
		echo json_encode($arr);
	}else{
		echo "没有该奖项";
	}
}
?>