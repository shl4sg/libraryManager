<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.ReaderTypeDAO" %>
<%@ page import="com.actionForm.ReaderTypeForm" %>
<%@ page import="java.util.*"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("readerType");
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
				<div id="place_left">当前位置：读者管理 &gt; 读者类型管理&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
		<div style="width:97%;text-align: right;"> <a href="#" onClick="window.open('readerType_add.jsp','','resize=no,width=454,height=179')">添加读者类型信息</a></div>
<%
if(coll==null || coll.isEmpty()){
%>
						<div style="width:100%;height:80px;padding:30px 0px;">
		暂无读者类型信息！
		</div>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=coll.iterator();
  int ID=0;
  String name="";
  int number=0;
  %>

  <table class="table">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="35%" bgcolor="#F9D16B">读者类型名称</td>
    <td width="35%" bgcolor="#F9D16B">可借数量</td>
    <td width="16%" bgcolor="#F9D16B">修改</td>
    <td width="14%" bgcolor="#F9D16B">删除</td>
  </tr>
<%
  while(it.hasNext()){
    ReaderTypeForm readerTypeForm=(ReaderTypeForm)it.next();
	ID=readerTypeForm.getId().intValue();
	name=readerTypeForm.getName();
	number=readerTypeForm.getNumber();
	%> 
  <tr>
    <td style="padding:5px;">&nbsp;<%=name%></td>
    <td style="padding:5px;">&nbsp;<%=number%></td>
    <td align="center"><a href="#" onClick="window.open('readerType?action=readerTypeModifyQuery&ID=<%=ID%>','','scrollbars=0,width=454,height=179')">修改</a></td>
    <td align="center"><a href="readerType?action=readerTypeDel&ID=<%=ID%>">删除</a></td>
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
