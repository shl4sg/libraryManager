<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.util.*"%>

<html>
<%
String flag="mr";
Collection coll=(Collection)request.getAttribute("managerQuery");
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
				<div id="place_left">当前位置：系统设置 &gt; 管理员设置&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
				<div style="width:97%;text-align: right;"> <a href="#" onClick="window.open('manager_add.jsp','','width=454,height=179')">添加管理员信息</a></div>
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
  String name="";
  int sysset=0;
  int readerset=0;
  int bookset=0;
  int borrowback=0;
  int sysquery=0;
  %>

  <table class="table">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="26%" bgcolor="#F9D16B">管理员名称</td>
    <td width="12%" bgcolor="#F9D16B">系统设置</td>
    <td width="12%" bgcolor="#F9D16B">读者管理</td>
    <td width="12%" bgcolor="#F9D16B">图书管理</td>
    <td width="11%" bgcolor="#F9D16B">图书借还</td>
    <td width="10%" bgcolor="#F9D16B">系统查询</td>
    <td width="9%" bgcolor="#F9D16B">权限设置</td>
    <td width="8%" bgcolor="#F9D16B">删除</td>
  </tr>
<%
  while(it.hasNext()){

    ManagerForm managerForm=(ManagerForm)it.next();
	ID=managerForm.getId().intValue();
	name=managerForm.getName();
	sysset=managerForm.getSysset();
	readerset=managerForm.getReaderset();
	bookset=managerForm.getBookset();
	borrowback=managerForm.getBorrowback();
	sysquery=managerForm.getSysquery();
	%> 
  <tr>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(sysset==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if(readerset==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if(bookset==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if(borrowback==1){out.println("checked");}%>></td>
    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if(sysquery==1){out.println("checked");}%>></td>
    <td align="center"><%if(!name.equals(flag)){ %><a href="#" onClick="window.open('manager?action=managerModifyQuery&id=<%=ID%>','','width=452,height=185')">权限设置</a><%}else{%>&nbsp;<%}%></td>
    <td align="center">
	<%if(!name.equals(flag)){ %><a href="manager?action=managerDel&id=<%=ID%>">删除</a><%}else{%>&nbsp;<%}%></td>
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
