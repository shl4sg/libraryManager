<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>添加书架信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
<div class="openwindowbox">
<form name="form1" method="post" action="bookCase?action=bookCaseAdd">
                <table width="100%" height="114"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="74" align="center">书架名称：
                      <input name="name" type="text"></td>
                    </tr>
                  <tr>
                    <td align="center"><input name="Submit3" type="submit" class="btn_grey" value="保存">
                      &nbsp;
                      <input name="Submit22" type="button" class="btn_grey" value="关闭" onClick="window.close();"></td>
                    </tr>
                </table>
            </form>
</div>
</body>
</html>
