<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
String error=(String)request.getAttribute("error");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>错误提示</title>
<link href="CSS/style.css" rel="stylesheet">
</head>

<body>
	<div class="section">
		<div class="mainbg">
			<div id="maintable" style="margin-top:25px;">
				<div id="mainbody"  style="margin-top:15%;">
				<img src="Images/error_b.gif" width="31" height="31">
&nbsp;&nbsp;错误提示信息： <%=error%> <br>
              <br>
              <input name="Submit" type="submit" class="btn_grey" value="返回" onClick="history.back(-1)">				
				</div>
		</div>
			<!-- end maintable -->
		</div>
		<!-- end mainbg -->
	</div>
	<!-- end  section -->
</body>
</html>
