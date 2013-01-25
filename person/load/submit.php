<?php
include ("../include/conn.php");
session_start();
if($_POST["Type"]=="gbook"){
	$sql = 'INSERT INTO `guestbook` (`nickname`,`content`,`datetime`) VALUES("'.$_SESSION["code"].'","'.$_POST["gbcon"].'","'.time().'")';		
	if(!$mysqli->query($sql)){
		echo 0;exit;
	}
	echo 1;
}else{
	if($_POST["status"]==1){
		$sql = 'INSERT INTO signup (`code`,`type`,`date`) VALUES("'.$_SESSION["code"].'","'.$_POST["Type"].'","'.$_POST["Ttime"].'")';		
		if(!$mysqli->query($sql)){
			echo 0;exit;
		}
	}else{
		$sql = 'delete from `signup` where `code` = "'.$_SESSION["code"].'"';
		if(!$mysqli->query($sql)){
			echo 0;exit;
		}
	}
	echo 1;
}
