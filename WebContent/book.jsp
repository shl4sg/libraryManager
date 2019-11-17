<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BookDAO" %>
<%@ page import="com.actionForm.BookForm" %>
<%@ page import="java.util.*"%>
<%@ page import="com.core.ChStr"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("book");
ChStr chStr=new ChStr();
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
				<div id="place_left">当前位置：图书管理 &gt; 图书档案管理&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
		<div style="width:97%;text-align: right;"> <a href="book_add.jsp">添加图书信息</a></div>
<%
if(coll==null || coll.isEmpty()){
%>
						<div style="width:100%;height:80px;padding:30px 0px;">
		暂无图书信息！
		</div>

 <%
}else{
  //通过迭代方式显示数据
  Iterator it=coll.iterator();
  int ID=0;
  String bookname="";
  String barcode="";
  String typename="";
  String publishing="";
  String bookcase="";
  int storage=0;
  %>
<table class="table">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="13%" bgcolor="#F9D16B">条形码</td>  
    <td width="26%" bgcolor="#F9D16B">图书名称</td>
    <td width="15%" bgcolor="#F9D16B">图书类型</td>
    <td width="14%" bgcolor="#F9D16B">出版社</td>
    <td width="12%" bgcolor="#F9D16B">书架</td>
    <td width="9%" bgcolor="#F9D16B">修改</td>
    <td width="5%" bgcolor="#F9D16B">删除</td>
  </tr>
<%
  while(it.hasNext()){
    BookForm bookForm=(BookForm)it.next();
	ID=bookForm.getId().intValue();
	bookname=bookForm.getBookName();
	barcode=chStr.nullToString(bookForm.getBarcode(),"&nbsp;");
	typename=bookForm.getTypeName();
	publishing=bookForm.getPublishing();
	bookcase=chStr.nullToString(bookForm.getBookcaseName(),"&nbsp;");
	%> 
  <tr>
    <td style="padding:5px;">&nbsp;<%=barcode%></td>  
    <td style="padding:5px;"><a href="book?action=bookDetail&ID=<%=ID%>"><%=bookname%></a></td>
    <td style="padding:5px;">&nbsp;<%=typename%></td>  
    <td style="padding:5px;">&nbsp;<%=publishing%></td>  
    <td style="padding:5px;">&nbsp;<%=bookcase%></td>  
	
    <td align="center"><a href="book?action=bookModifyQuery&ID=<%=ID%>">修改</a></td>
    <td align="center"><a href="book?action=bookDel&ID=<%=ID%>">删除</a></td>
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
