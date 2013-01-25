<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>建议反馈</title>
<script src="/person/js/jquery.min.js"></script>
<script>
$(document).ready(function(e) {
	$(".button").click(function(){
		var typeTemp=($(this).attr("stype"));
		var tgbcon=$(".gbcon").val();
		if(tgbcon==""){
			$(".red").html("提交内容不能为空！")
		}else{
			$.post("/person/load/submit.php",{Action:"post",Type:typeTemp,gbcon:tgbcon},function(data){
				if(data==1){
					$(".red").html("反馈成功！")
				}else{
					$(".red").html("反馈失败，请重新递交！")
				};
			})
		}
	})
})
</script>

</head>

<body>
<table>
	<tr>
		<td colspan="2" class="e">对于公司您有什么建议或是意见都可以在这里反馈，我们将第一时间为您回馈！</td>
	</tr>
	<tr>
		<td>您的建议：</td>
		<td><textarea class="gbcon" cols="60" rows="5"></textarea><span class="red"></span></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input class="button" stype="gbook" name="" type="button" value="递交">
		</td>
	</tr>	
</table>
</body>
</html>