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
include ('include/lib/PHPExcel.php');
header('Content-type: text/html; charset=utf-8');
date_default_timezone_set("Asia/Shanghai");
$nowTime=date("Y-m-d",time());
$objExcel = new PHPExcel();
$objExcel->getProperties()->setTitle("Office 2007 XLSX Test Document");
$objExcel->getProperties()->setSubject("Office 2007 XLSX Test Document");

//设置当前的sheet索引，用于后续的内容操作，一般只有在使用多个sheet的时候才需要显示调用，缺省情况下，PHPExcel会自动创建第一个sheet被设置SheetIndex=0
$objExcel->setActiveSheetIndex(0);
$objActSheet = $objExcel->getActiveSheet();
//设置当前活动sheet的名称
$objActSheet->setTitle('报名人员');
//设置宽度
$objActSheet->getColumnDimension('B')->setWidth(10);
$objActSheet->getColumnDimension('A')->setWidth(10);
//设置内容
$objActSheet->setCellValue('A1', '姓名');
$objActSheet->setCellValue('B1', '工号');

@$sql = 'select * from `signup` as m,`users` as t where m.code=t.code and `type`="1"';
$ret = $mysqli->query($sql);
$num = $ret->num_rows;
for ( $i = 0, $j = 2; $i < $num; $i++, $j++ ) {
	$ret->data_seek($i);
	$row = $ret->fetch_assoc();
    $objActSheet->setCellValue('A'.$j, $row["cname"]);
    $objActSheet->setCellValue('B'.$j, $row["code"]);
}
//输出保存
$outputFileName = "output.xls";
header("Content-Type: application/force-download");
header("Content-Type: application/octet-stream");
header("Content-Type: application/download");
header('Content-Disposition:inline;filename="'.$outputFileName.'"');
header("Content-Transfer-Encoding: binary");
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Pragma: no-cache");
$objWriter = new PHPExcel_Writer_Excel2007($objExcel); // 用于 2007 格式
$objWriter->save('php://output');

?>
</body>
</html>