<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.actionForm.ParameterForm" %>
<html>
<%
ParameterForm form=(ParameterForm)request.getAttribute("parameterModifyif");
int cost=0;
int validity=0;
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
				<div id="place_left">当前位置：系统设置 &gt; 参数设置&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
  <form name="form1" method="post" action="parameter?action=parameterModify">
<%if(form!=null){
	cost=form.getCost();
	validity=form.getValidity();
}
%>
  <table width="60%" style="margin-top: 30px;margin-left: 30%;">
  <tr>
    <td width="24%" align="left" style="padding:5px;">办证费：</td>
    <td width="76%" align="left">
      <input name="cost" type="text" id="cost" value="<%=cost%>" size="30">
      (元)    </td>
    <tr>
    <td align="left" style="padding:5px;">有效期限：</td>
    <td align="left"><input name="validity" type="text" id="validity" size="30" value="<%=validity%>" >
      (月)</td>
    </tr>
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td><input name="Submit" type="submit" class="btn_grey" value="保存">
        &nbsp;
        <input name="Submit2" type="reset" class="btn_grey" value="取消"></td>
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
	<%@ include file="copyright.jsp"%>
</body>
</html>
