<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.ReaderDAO" %>
<%@ page import="com.dao.ReaderTypeDAO" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="java.util.*"%>
<html>
<%
ReaderForm readerForm=(ReaderForm)request.getAttribute("readerDetail");
%>
<script type="text/javascript">
function check(form){
	if(form.name.value==""){
		alert("请输入读者姓名!");form.name.focus();return false;
	}
	if(form.paperNO.value==""){
		alert("请输入证件号码!");form.paperNO.focus();return false;
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
				<div id="place_left">当前位置：读者管理 &gt; 读者档案管理 &gt; 读者详细信息&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
<%  int ID=0;
  String name=readerForm.getName();
  String sex=readerForm.getSex();  
  String barcode=readerForm.getBarcode();
  String vocation=readerForm.getVocation();
  String birthday=readerForm.getBirthday();
  String paperType=readerForm.getPaperType();
  String paperNO=readerForm.getPaperNO();
  String tel=readerForm.getTel();
  String email=readerForm.getEmail();
  String createDate=readerForm.getCreateDate();
  String remark=readerForm.getRemark();
  String operator=readerForm.getOperator();
  int typeid=readerForm.getTypeid();
  String typename=readerForm.getTypename();
  %>
	<table width="100%" height="532" style="padding-left:20%;">
      <tr>
        <td width="15%" height="30" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
        <td width="75%" height="39">
          <input name="name" type="text" value="<%=name%>"> </td>
      </tr>
      <tr>
        <td height="30" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
        <td height="35"><input name="name" type="text" value="<%=sex%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">条&nbsp;形&nbsp;码：</td>
        <td><input name="barcode" type="text" id="barcode" value="<%=barcode%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">读者类型：</td>
        <td><input name="vocation" type="text" id="vocation" value="<%=typename%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">职&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
        <td><input name="vocation" type="text" id="vocation" value="<%=vocation%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">出生日期：</td>
        <td><input name="birthday" type="text" id="birthday" value="<%=birthday%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">有效证件：</td>
        <td><input name="paperType" type="text" value="<%=paperType%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">证件号码：</td>
        <td><input name="paperNO" type="text" id="paperNO" value="<%=paperNO%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">登记日期：</td>
        <td><input name="paperNO2" type="text" id="paperNO2" value="<%=createDate%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
        <td><input name="tel" type="text" id="tel" value="<%=tel%>"></td>
      </tr>
      <tr>
        <td height="30" align="center">Email：</td>
        <td><input name="email" type="text" id="email" value="<%=email%>" size="50">
          </td>
      </tr>
      <tr>
        <td height="30" align="center">操&nbsp;作&nbsp;员：</td>
        <td><input name="operator" type="text" id="operator" value="<%=operator%>">
          </td>
      </tr>	  
      <tr>
        <td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
        <td><textarea name="remark" cols="50" rows="5" class="wenbenkuang" id="remark"><%=remark%></textarea></td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
        <td>
&nbsp;
<input name="Submit2" type="button" class="btn_grey" value="返回" onClick="history.back()"></td>
      </tr>
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
