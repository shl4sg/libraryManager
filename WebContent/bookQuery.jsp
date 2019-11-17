<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.actionForm.BookForm"%>
<%@ page import="java.util.*"%>
<html>
<%
	Collection coll = (Collection) request.getAttribute("ifbook");
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
				<div id="place_left">当前位置：系统查询 &gt; 图书档案查询&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
					<form action="" method="post" name="form1">
						<div
							style="background-color: #F9D16B; padding: 10px 0px 10px 10px; text-align: left;">
							<img src="Images/search.gif" width="45" height="28">
							请选择查询依据： <select name="f" class="wenbenkuang" id="f">
								<option value="barcode">条形码</option>
								<option value="typename">类别</option>
								<option value="bookname" selected>书名</option>
								<option value="author">作者</option>
								<option value="publishing">出版社</option>
								<option value="bookcasename">书架</option>
							</select> <input name="key" type="text" id="key" size="50"> <input
								name="Submit" type="submit" class="btn_grey" value="查询">
						</div>
						<%
							if (coll == null || coll.isEmpty()) {
						%>
						<div style="width: 100%; height: 80px; padding: 30px 0px;">
							暂无图书信息！</div>
						<%
							} else {
								//通过迭代方式显示数据
								Iterator it = coll.iterator();
								int ID = 0;
								String bookname = "";
								String barcode = "";
								String typename = "";
								String publishing = "";
								String bookcase = "";
								int storage = 0;
						%>
						<table class="table" style="margin-top: 8px;">
							<tr align="center" bgcolor="#e3F4F7">
								<td width="17%" bgcolor="#F9D16B">条形码</td>
								<td width="31%" bgcolor="#F9D16B">图书名称</td>
								<td width="18%" bgcolor="#F9D16B">图书类型</td>
								<td width="19%" bgcolor="#F9D16B">出版社</td>
								<td width="15%" bgcolor="#F9D16B">书架</td>
							</tr>
							<%
								while (it.hasNext()) {
										BookForm bookForm = (BookForm) it.next();
										ID = bookForm.getId().intValue();
										bookname = bookForm.getBookName();
										barcode = bookForm.getBarcode();
										if (barcode == null)
											barcode = "";
										typename = bookForm.getTypeName();
										publishing = bookForm.getPublishing();
										bookcase = bookForm.getBookcaseName();
							%>
							<tr>
								<td style="padding: 5px;">&nbsp;<%=barcode%></td>
								<td style="padding: 5px;"><a
									href="book?action=bookDetail&ID=<%=ID%>"><%=bookname%></a></td>
								<td style="padding: 5px;">&nbsp;<%=typename%></td>
								<td style="padding: 5px;">&nbsp;<%=publishing%></td>
								<td style="padding: 5px;">&nbsp;<%=bookcase%></td>
							</tr>
							<%
								}
								}
							%>
						</table>
					</form>
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
