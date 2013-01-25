<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>订餐情况</title>
</head>

<body>
<?php
	include ('../include/conn.php');
	$sql = 'select * from `signup` as m,`users` as t where m.code=t.code and `type`="0" ORDER BY m.id ASC';
	$ret = $mysqli->query($sql);
	$num = $ret->num_rows;
	while($row = mysqli_fetch_array($ret)){
		//$sql = "update `signup` set `date` = '201301' where `code` = '".$row["code"]."'";
		$sql = 'delete from `signup` where `code` = "'.$row["code"].'"';
		$mysqli->query($sql);
	}
?>
</body>
</html>