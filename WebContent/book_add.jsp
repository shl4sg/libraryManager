<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.dao.BookTypeDAO"%>
<%@ page import="com.actionForm.BookForm"%>
<%@ page import="com.actionForm.BookTypeForm"%>
<%@ page import="com.dao.BookCaseDAO"%>
<%@ page import="com.actionForm.BookCaseForm"%>
<%@ page import="com.dao.PublishingDAO"%>
<%@ page import="com.actionForm.PublishingForm"%>
<%@ page import="java.util.*"%>
<html>
<%
	String str = null;
	BookTypeDAO bookTypeDAO = new BookTypeDAO();
	Collection coll_type = (Collection) bookTypeDAO.query(str);
	if (coll_type == null || coll_type.isEmpty()) {
		out.println("<script>alert('请先录入图书类型信息!');history.back(-1);</script>");
	} else {
		Iterator it_type = coll_type.iterator();
		int typeID = 0;
		String typename = "";
		BookCaseDAO bookcaseDAO = new BookCaseDAO();
		String str1 = null;
		Collection coll_bookcase = (Collection) bookcaseDAO.query(str1);
		if (coll_bookcase == null || coll_bookcase.isEmpty()) {
			out.println("<script>alert('请先录入书架信息!');history.back(-1);</script>");
		} else {
			Iterator it_bookcase = coll_bookcase.iterator();
			int bookcaseID = 0;
			String bookcasename = "";
			PublishingDAO pubDAO = new PublishingDAO();
			String str2 = null;
			Collection coll_pub = (Collection) pubDAO.query(str2);
			if (coll_pub == null || coll_pub.isEmpty()) {
				out.println("<script>alert('请先录入出版社信息!');history.back(-1);</script>");
			} else {
				Iterator it_pub = coll_pub.iterator();
				String isbn = "";
				String pubname = "";
%>
<script language="jscript">
	
function check(form){
	if(form.barcode.value==""){
		alert("请输入条形码!");form.barcode.focus();return false;
	}
	if(form.bookName.value==""){
		alert("请输入图书名称!");form.bookName.focus();return false;
	}
	if(form.price.value==""){
		alert("请输入图书定价!");form.price.focus();return false;
	}
}

</script>
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body onLoad="clockon(bgclock)">
	<%@include file="navigation.jsp"%>
	<div class="section">
		<div class="mainbg">
			<div id="maintable">
				<div id="place_left">当前位置：图书管理 &gt; 图书档案管理 &gt; 添加图书信息	&gt;&gt;&gt;</div>
				<div id="mainbody">
					<form name="form1" method="post" action="book?action=bookAdd">
						<table width="80%" height="432">
							<tr>
								<td width="173" align="center">条&nbsp;形&nbsp;码：</td>
								<td width="427" height="39"><input name="barcode"
									type="text" id="barcode"> *</td>
							</tr>
							<tr>
								<td align="center">图书名称：</td>
								<td height="39"><input name="bookName" type="text"
									id="bookName" size="50"> *</td>
							</tr>
							<tr>
								<td align="center">图书类型：</td>
								<td><select name="typeId" class="wenbenkuang" id="typeId">
										<%
											while (it_type.hasNext()) {
															BookTypeForm bookTypeForm = (BookTypeForm) it_type.next();
															typeID = bookTypeForm.getId().intValue();
															typename = bookTypeForm.getTypeName();
										%>

										<option value="<%=typeID%>"><%=typename%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td align="center">作者：</td>
								<td><input name="author" type="text" id="author" size="40"></td>
							</tr>
							<tr>
								<td align="center">译者：</td>
								<td><input name="translator" type="text" id="translator"
									size="40"></td>
							</tr>
							<tr>
								<td align="center">出版社：</td>
								<td><select name="isbn" class="wenbenkuang">
										<%
											while (it_pub.hasNext()) {
															PublishingForm pubForm = (PublishingForm) it_pub.next();
															isbn = pubForm.getIsbn();
															pubname = pubForm.getPubname();
										%>

										<option value="<%=isbn%>"><%=pubname%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td align="center">价格：</td>
								<td><input name="price" type="text" id="price"> (元)
									*</td>
							</tr>
							<tr>
								<td align="center">页码：</td>
								<td><input name="page" type="text" id="page"></td>
							</tr>
							<tr>
								<td align="center">书架：</td>
								<td><select name="bookcaseid" class="wenbenkuang"
									id="bookcaseid">
										<%
											while (it_bookcase.hasNext()) {
															BookCaseForm bookCaseForm = (BookCaseForm) it_bookcase.next();
															bookcaseID = bookCaseForm.getId().intValue();
															bookcasename = bookCaseForm.getName();
										%>

										<option value="<%=bookcaseID%>"><%=bookcasename%></option>
										<%
											}
										%>
								</select> <input name="operator" type="hidden" id="operator"
									value="<%=manager%>"></td>
							</tr>
							<tr>
								<td align="center">&nbsp;</td>
								<td><input name="Submit" type="submit" class="btn_grey"
									value="保存" onClick="return check(form1)"> &nbsp; <input
									name="Submit2" type="button" class="btn_grey" value="返回"
									onClick="history.back()"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- end maintable -->
		</div>
		<!-- end mainbg -->
	</div>
	<!-- end  section -->
	<%
		}
			}
		}
	%>
	<%@ include file="copyright.jsp"%>
</body>
</html>
