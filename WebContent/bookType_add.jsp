<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>添加图书类型信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function check(form){
	if(form.typeName.value==""){
		alert("请输入类型名称!");form.typeName.focus();return false;
	}
	if(form.days.value==""){
		alert("请输入可借天数!");form.days.focus();return false;
	}	
}
</script>
<body>
<div class="openwindowbox"">
<form name="form1" method="post" action="bookType?action=bookTypeAdd">
	<table>
      <tr>
        <td width="29%" align="center">类型名称：</td>
        <td width="71%" height="39">
          <input name="typeName" type="text" size="30">        </td>
      </tr>
      <tr>
        <td width="77" align="center">可借天数：</td>
        <td height="35"><input name="days" type="text" id="days" size="25">
          (天)</td>
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
