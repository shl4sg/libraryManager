<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.BookTypeForm" %>
<%@ page import="com.core.ChStr"%>
<html>
<head>
<title>修改图书类型信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="CSS/style.css">
</head>

<body>
<%
BookTypeForm bookTypeForm=(BookTypeForm)request.getAttribute("bookTypeQueryif");
ChStr chStr=new ChStr();
%>
<div class="openwindowbox">
<form name="form1" method="post" action="bookType?action=bookTypeModify">
 <input name="id" type="hidden" size="50" value="<%=bookTypeForm.getId()%>"> 
  <table width="100%" height="111">
  <tr>
    <td width="29%" align="center">类型名称：      </td>
    <td width="71%"><input name="typeName" type="text" size="30" value="<%=bookTypeForm.getTypeName()%>">
      </td>
  </tr>
  <tr>
    <td align="center">可借天数：</td>
    <td><input name="days" type="text" size="25" value="<%=bookTypeForm.getDays()%>">
      (天)</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input name="Submit" type="submit" class="btn_grey" value="保存">
&nbsp;
<input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" onClick="window.close()" value="关闭"></td>
  </tr>
</table>
</form>
</div>
</body>
</html>
