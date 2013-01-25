<?php
include ("include/conn.php");
header("Content-Type:text/html;charset=utf-8");
$sql = "select * from `by_users` where  CONCAT(`code`,`cname`,`username`) like '%".$_POST['name']."%'";
$ret = $mysqli->query($sql);
$num = $ret->num_rows;
$userarray="";
while($row = mysqli_fetch_array($ret)){
	$userarray.="<li>".$row["cname"]."(".$row["username"].",".$row["code"].")</li>";
}
echo $userarray;
?>