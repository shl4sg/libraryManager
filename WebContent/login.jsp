<%@ page contentType="text/html; charset=utf-8" language="java"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
<script type="text/javascript">
	function check(form) {
		if (form.name.value == "") {
			alert("请输入管理员名称!");
			form.name.focus();
			return false;
		}
		if (form.pwd.value == "") {
			alert("请输入密码!");
			form.pwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="logintable">
		<div style="width: 100%;padding-top: 95px;">
			<form name="form1" method="post" action="manager?action=login">
				<ul class="login_ul">
					<li>管理员名称： <input name="name" type="text" class="logininput"
						id="name" size="27">
					</li>
					<li>管理员密码：<input name="pwd" type="password" class="logininput"
						id="pwd" size="27"></li>
					<li style="padding-left: 138px;"><input name="Submit"
						type="submit" class="btn_grey" value="确定"
						onClick="return check(form1)"> &nbsp; <input
						name="Submit3" type="reset" class="btn_grey" value="重置">&nbsp;
						<input name="Submit2" type="button" class="btn_grey" value="关闭"
						onClick="window.close();"></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>
