<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>添加管理员</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function check(form){
	if(form.name.value==""){
		alert("请输入管理员名称!");form.name.focus();return;
	}
	if(form.pwd.value==""){
		alert("请输入管理员密码!");form.pwd.focus();return;
	}
	if(form.pwd1.value==""){
		alert("请确认管理员密码!");form.pwd1.focus();return;
	}		
	if(form.pwd.value!=form.pwd.value){
		alert("您两次输入的管理员密码不一致，请重新输入!");form.pwd.focus();return;
	}
	form.submit();
}
</script>
<body>
<div class="openwindowbox" style="padding-top:21px;">
	<form name="form1" method="post" action="manager?action=managerAdd">
	<table height="123">
      <tr>
        <td width="83" height="30" align="center">管理员名称：</td>
        <td width="192">
          <input name="name" type="text">        </td>
      </tr>
      <tr>
        <td height="28" align="center">管理员密码：</td>
        <td><input name="pwd" type="password" id="pwd"></td>
      </tr>
      <tr>
        <td height="28" align="center">确认 &nbsp;密码：</td>
        <td><input name="pwd1" type="password" id="pwd1"></td>
      </tr>
      <tr>
        <td height="37" align="center">&nbsp;</td>
        <td><input name="Button" type="button" class="btn_grey" value="保存" onClick="check(form1)">
&nbsp;
<input name="Submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();"></td>
      </tr>
    </table>
	</form>
</div>
</body>
</html>
