<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>添加读者类型信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="jscript">
function check(form){
	if(form.name.value==""){
		alert("请输入类型名称!");form.name.focus();return false;
	}
	if(form.number.value==""){
		alert("请输入可借数量!");form.number.focus();return false;
	}	
}
</script>
<body>
<div class="openwindowbox">
<form name="form1" method="post" action="readerType?action=readerTypeAdd">
	<table height="100">
      <tr>
        <td width="84" align="center">类型名称：</td>
        <td width="191" height="39">
          <input name="name" type="text" size="28">        </td>
      </tr>
      <tr>
        <td width="84" align="center">可借数量：</td>
        <td height="35"><input name="number" type="text" id="number">
          (本)</td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
        <td><input name="Submit" type="submit" class="btn_grey" value="保存" onClick="return check(form1)">
          &nbsp;
          <input name="Submit2" type="button" class="btn_grey" value="关闭" onClick="window.close();"></td>
      </tr>
    </table>
	        </form>
</div>
</body>
</html>
