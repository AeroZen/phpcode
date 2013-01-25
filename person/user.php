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

.tab{border-collapse:collapse; margin:auto; width:560px;}
.tab th,.tab td{padding:5px;}
.tab th{background:#3B5998; border:1px solid #3B5998; color:#FFF; font-size:14px;}
.tab td{background:#E7EBF2; border:1px solid #BDC7D8;}
.confirm{background:#5A74A8; border:1px solid #29447E; color:#FFF;}
</style>

</head>
<body>
<?php
include ('include/conn.php');
date_default_timezone_set("Asia/Shanghai");
$nowTime=date("Y-m-d",time());
?>
<table class="tab">
	<tr>
		<th colspan="2">
			博雅互动员工管理系统
		</th>
	</tr>	
	<tr>
		<td width="120">
			已取消订餐人：
		</td>
		<td>
			<?php
				/*订餐查询*/
				/*SELECT * FROM a LEFT JOIN b ON a.a1=b.b1 AND a.a2=b.b2*/
				@$sql = 'select * from `signup` as m,`users` as t where m.code=t.code and `type`="1"';
				$ret = $mysqli->query($sql);
				$num = $ret->num_rows;
					if($num>0){
						for ( $i = 0; $i < $num; $i++ ) {
							$ret->data_seek($i);
							$row = $ret->fetch_assoc();
							echo $row["cname"].";";
						}
					}else{
						echo "暂无列表";
					}
				echo "(共".$num."人)";
				/*订餐结束*/
				
			?>
		</td>
	</tr>
	<tr>
		<td colspan="2"><a href="ex.php">下载表格</a> </td>
	</tr>
</table>
<?php

?>
</body>
</html>