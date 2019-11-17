<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BookTypeDAO" %>
<%@ page import="com.actionForm.BookTypeForm" %>
<%@ page import="java.util.*"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("bookType");
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
				<div id="place_left">当前位置：图书管理 &gt; 图书类型设置&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
		<div style="width:97%;text-align: right;"> <a href="#" onClick="window.open('bookType_add.jsp','','width=452,height=175')">添加图书类型信息</a> </div>
<%
if(coll==null || coll.isEmpty()){
%>
						<div style="width:100%;height:80px;padding:30px 0px;">
		暂无图书类型信息！
		</div>

 <%
}else{
  //通过迭代方式显示数据
  Iterator it=coll.iterator();
  int ID=0;
  String typename="";
  int days=0;
  %>
  
  <table width="91%" class="table">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="35%" bgcolor="#F9D16B">图书类型名称</td>
    <td width="35%" bgcolor="#F9D16B">可借天数</td>
    <td width="16%" bgcolor="#F9D16B">修改</td>
    <td width="14%" bgcolor="#F9D16B">删除</td>
  </tr>
<%
  while(it.hasNext()){
    BookTypeForm bookTypeForm=(BookTypeForm)it.next();
	ID=bookTypeForm.getId().intValue();
	typename=bookTypeForm.getTypeName();
	days=bookTypeForm.getDays();
	%> 
  <tr>
    <td style="padding:5px;"><%=typename%></td>
    <td style="padding:5px;"><%=days%></td>
    <td align="center"><a href="#" onClick="window.open('bookType?action=bookTypeModifyQuery&ID=<%=ID%>','','width=452,height=175')">修改</a></td>
    <td align="center"><a href="bookType?action=bookTypeDel&ID=<%=ID%>">删除</a></td>
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
