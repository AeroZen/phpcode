<?php
include ("class/BYAdmin.class.php");
$user=BYAdmin::GetInfo();
if($user['ret']!=1){
	header("location:".BYAdmin::getLoginUrl());
}
?>