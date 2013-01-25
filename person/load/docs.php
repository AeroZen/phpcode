<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>文档下载</title>
</head>
<body>
<table width="100%">
<?php
include ('../include/conn.php');
if(@$_GET['class']=="0"||@$_GET['class']==null){
	$sql = 'select * from `articles` as m,`category` as t where m.category_id=t.id and t.pid="13" ORDER BY m.id ASC limit 20';
}else{
	$sql = 'select * from `articles` as m,`category` as t where m.category_id=t.id and t.pid="13" and t.id='.$_GET['class'].' ORDER BY m.id ASC';
}
$ret = $mysqli->query($sql);;
$num = $ret->num_rows;
for ( $i = 0; $i < $num; $i++ ) {
	$ret->data_seek($i);
	$row = $ret->fetch_assoc();//以关联数组显示
	// $row = $ret->fetch_row();//以索引数组显示
	// $row = $ret->fetch_array();//以关联数组和索引数组两种方式显示

	echo "<tr><td>".($row["cate_name"])."</td><td><a href='/".($row["attachment"])."'><b>".($row["title"])."</b></a></td><td><a href='/".($row["attachment"])."'>下载</a></td></tr>";
}
?>
</table>
</body>
</html>