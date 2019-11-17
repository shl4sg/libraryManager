<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BorrowDAO" %>
<%@ page import="com.actionForm.BorrowForm" %>
<%@ page import="java.util.*"%>
<html>
<%
Collection coll=(Collection)request.getAttribute("bookBorrowSort");
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
				<div id="place_left">当前位置：图书借阅排行榜&gt;&gt;&gt;&nbsp;</div>
				<div id="mainbody">
<%
if(coll==null || coll.isEmpty()){
%>
						<div style="width:100%;height:80px;padding:30px 0px;">
		暂无图书借阅信息！
		</div>
          <%
}else{
  //通过迭代方式显示数据
  Iterator it=coll.iterator();
  int degree=0;
  String bookname="";
  String typename="";
  String barcode_book="";
  String bookcase="";
  String pub="";
  String author="";
  String translator="";
  Float price=new Float(0);
  %>
<table class="table">
  <tr align="center" bgcolor="#e3F4F7">
  <td width="8%" bgcolor="#F9D16B">借阅次数</td>
    <td width="11%" bgcolor="#F9D16B">图书条形码</td>
    <td width="24%" bgcolor="#F9D16B">图书名称</td>
    <td width="12%" bgcolor="#F9D16B">图书类型</td>
    <td width="12%" bgcolor="#F9D16B">书架</td>
    <td width="14%" bgcolor="#F9D16B">出版社</td>
    <td width="11%" bgcolor="#F9D16B">作者</td>
    <td colspan="2" bgcolor="#F9D16B">定价(元)</td>
    </tr>
<%
  while(it.hasNext()){
    BorrowForm borrowForm=(BorrowForm)it.next();
	bookname=borrowForm.getBookName();
        barcode_book=borrowForm.getBookBarcode();
        typename=borrowForm.getBookType();
	degree=borrowForm.getDegree();
bookcase=borrowForm.getBookcaseName();
        pub=borrowForm.getPubName();
        author=borrowForm.getAuthor();
        price=borrowForm.getPrice();
	%>
  <tr>
    <td align="center">&nbsp;<%=degree%></td>
    <td style="padding:5px;">&nbsp;<%=barcode_book%></td>
    <td style="padding:5px;"><%=bookname%></td>
    <td style="padding:5px;"><%=typename%></td>
    <td align="center">&nbsp;<%=bookcase%></td>
    <td align="center">&nbsp;<%=pub%></td>
    <td width="11%" align="center"><%=author%></td>
    <td width="8%" align="center"><%=price%></td>
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
