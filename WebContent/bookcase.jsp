<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.dao.BookCaseDAO"%>
<%@ page import="com.actionForm.BookCaseForm"%>
<%@ page import="java.util.*"%>
<html>
<%
	Collection coll = (Collection) request.getAttribute("bookcase");
%>
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
	<%@include file="navigation.jsp"%>
	<div class="section">
		<div class="mainbg">
			<div id="maintable">
				<div id="place_left">当前位置：系统设置 &gt; 书架设置</div>
				<div id="mainbody">
					<div style="width: 97%; text-align: right;">
						<a href="#"
							onClick="window.open('bookcase_add.jsp','','width=452,height=175')">添加书架信息</a>
					</div>
					<%
						if (coll == null || coll.isEmpty()) {
					%>
					<div style="width: 100%; height: 80px; padding: 30px 0px;">
						暂无书架信息！</div>
					<%
						} else {
							//通过迭代方式显示数据
							Iterator it = coll.iterator();
							int ID = 0;
							String name = "";
					%>
					<table class="table">
						<tr align="center" bgcolor="#e3F4F7">
							<td width="70%" bgcolor="#F9D16B">书架名称</td>
							<td width="16%" bgcolor="#F9D16B">修改</td>
							<td width="14%" bgcolor="#F9D16B">删除</td>
						</tr>
						<%
							while (it.hasNext()) {
									BookCaseForm bookCaseForm = (BookCaseForm) it.next();
									ID = bookCaseForm.getId().intValue();
									name = bookCaseForm.getName();
						%>
						<tr>
							<td style="padding: 5px;"><%=name%></td>
							<td align="center"><a href="#"
								onClick="window.open('bookCase?action=bookCaseModifyQuery&ID=<%=ID%>','','width=452,height=175')">修改</a></td>
							<td align="center"><a
								href="bookCase?action=bookCaseDel&ID=<%=ID%>">删除</a></td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>
			<!-- end maintable -->
		</div>
		<!-- end mainbg -->
	</div>
	<!-- end  section -->
	<%@ include file="copyright.jsp"%>
</body>
</html>
