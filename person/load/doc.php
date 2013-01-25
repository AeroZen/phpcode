<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>文档下载</title>
<script src="/person/js/jquery.min.js"></script>
<style>
.cl:before,.cl:after{content:"";display:table;}
.cl:after{clear:both;}
.cl{zoom:1;}
.tell{overflow:hidden;}
.tellTitle{height:30px;line-height:30px; background:#FCFCFC url(/person/images/awhite.gif) repeat-x; margin-left:-1px;}
.tellTitle a{width:125px;display:inline;float:left;text-align:center;background:#F9F9F9;height:30px;cursor:pointer;color:#2969A9; border-bottom:1px solid #C8D1D5}
.tellTitle a.tags{border-width:0 1px;border-style:solid;border-color: #C8D1D5;background:#FFFFFF;font-weight:bold;border-bottom:none;height:30px;border-bottom:1px solid #FFF}
</style>
</head>
<script>
$(document).ready(function(e) {
	$(".tellTitle > a:eq(0)").trigger("click");
})
function loadoc(index,id){
	$(".loading").show();
	$index=$(index);
	$index.addClass("tags").siblings().removeClass("tags");
	$(".docbox").load("/person/load/docs.php?class="+id,function(){
		$(".loading").hide();
	});
}
</script>
<body>
<div class="tell cl">
	<div class="tellTitle">
		<a class="tags" href="javascript:void(0);" onclick="loadoc(this,0)">全部</a>
		<a href="javascript:void(0);" onclick="loadoc(this,14)">财务类</a>
		<a href="javascript:void(0);" onclick="loadoc(this,15)">法务类</a>
		<a href="javascript:void(0);" onclick="loadoc(this,16)">人事类</a>
		<a href="javascript:void(0);" onclick="loadoc(this,17)">行政类</a>
		<a href="javascript:void(0);" onclick="loadoc(this,21)">其它类</a>
	</div>
</div>
<div class="docbox"></div>
</body>
</html>