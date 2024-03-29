<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.dao.BorrowDAO" %>
<%@ page import="com.actionForm.BorrowForm" %>
<%@ page import="com.actionForm.ReaderForm" %>
<%@ page import="java.util.*"%>
<html>
<%
ReaderForm readerForm=(ReaderForm)request.getAttribute("readerinfo");
Collection coll=(Collection)request.getAttribute("borrowinfo");
%>
<head>
<title>图书馆管理系统</title>
<link href="CSS/style.css" rel="stylesheet">
	<script type="text/javascript">
		function checkreader(form){
			if(form.barcode.value==""){
				alert("请输入读者条形码!");form.barcode.focus();return;
			}
			form.submit();
		}
	</script>
</head>
<body onLoad="clockon(bgclock)">
<%@include file="navigation.jsp"%>
	<div class="section">
		<div class="mainbg">
			<div id="maintable">
				<div id="place_left">当前位置：图书借还 &gt; 图书续借&gt;&gt;&gt;&nbsp;</div>
				<img src="Images/borrowBackRenew_r.gif" width="1000px">
				<div id="mainbody">
<%
int ID=0;
String name="";
String sex="";
String barcode="";
String birthday="";
String paperType="";
String paperNO="";
int number=0;
String typename="";
if(readerForm!=null){
	ID=readerForm.getId().intValue();
	name=readerForm.getName();
	sex=readerForm.getSex();
	barcode=readerForm.getBarcode();
	birthday=readerForm.getBirthday();
	paperType=readerForm.getPaperType();
	paperNO=readerForm.getPaperNO();
	number=readerForm.getNumber();
	typename=readerForm.getTypename();
}
%>
<div style="border:#FAE9A3 1px solid;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				<form name="form1" method="post" action="borrow?action=bookrenew">
				
                  <tr>
                    <td><table width="90%" height="21" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="24%" height="18" style="padding-left:7px;padding-top:7px;"><img src="Images/reader_checkbg.jpg" width="142" height="18"></td>
                          <td width="76%" style="padding-top:7px;">读者条形码：
                            <input name="barcode" type="text" id="barcode" value="<%=barcode%>" size="24">
                            &nbsp;
                            <input name="Button" type="button" class="btn_grey" value="确定" onClick="checkreader(form1)"></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="13" align="left" style="padding-left:7px;"><hr width="90%" size="1"></td>
                    </tr>
                  <tr>
                    <td align="center"><table width="96%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="37">姓&nbsp;&nbsp;&nbsp;&nbsp;名：
                            <input name="readername" type="text" id="readername" value="<%=name%>"></td>
                          <td>性&nbsp;&nbsp;&nbsp;&nbsp;别：
                            <input name="sex" type="text" id="sex" value="<%=sex%>"></td>
                          <td>读者类型：
                            <input name="readerType" type="text" id="readerType" value="<%=typename%>"></td>
                        </tr>
                        <tr>
                          <td height="37">证件类型：
                            <input name="paperType" type="text" id="paperType" value="<%=paperType%>"></td>
                          <td>证件号码：
                            <input name="paperNo" type="text" id="paperNo" value="<%=paperNO%>"></td>
                          <td>可借数量：
                            <input name="number" type="text" id="number" value="<%=number%>" size="17">
                            册
                            &nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
				 </form>
              </table>
              </div>
               <table  class="table">
                <tr align="center" bgcolor="#e3F4F7">
                  <td width="24%" height="25" bgcolor="#FFF9D9">图书名称</td>
                  <td width="12%" bgcolor="#FFF9D9">借阅时间</td>
                  <td width="13%" bgcolor="#FFF9D9">应还时间</td>
                  <td width="14%" bgcolor="#FFF9D9">出版社</td>
                  <td width="12%" bgcolor="#FFF9D9">书架</td>
                  <td bgcolor="#FFF9D9">定价(元)</td>
                  <td width="12%" bgcolor="#FFF9D9"><input name="Button22" type="button" class="btn_grey" value="完成续借" onClick="window.location.href='bookRenew.jsp'"></td>
                </tr>
<%
int id=0;
String bookname="";
String borrowTime="";
String backTime="";
Float price=new Float(0);
String pubname="";
String bookcase="";
if(coll!=null && !coll.isEmpty()){
	Iterator it=coll.iterator();
	while(it.hasNext()){
	BorrowForm borrowForm=(BorrowForm)it.next();
        id=borrowForm.getId().intValue();
	bookname=borrowForm.getBookName();
	borrowTime=borrowForm.getBorrowTime();
	backTime=borrowForm.getBackTime();
	price=borrowForm.getPrice();
	pubname=borrowForm.getPubName();
	bookcase=borrowForm.getBookcaseName();
%>
                   <tr>
                     <td height="25" style="padding:5px;">&nbsp;<%=bookname%></td>
                     <td style="padding:5px;">&nbsp;<%=borrowTime%></td>
                     <td style="padding:5px;">&nbsp;<%=backTime%></td>
                     <td align="center">&nbsp;<%=pubname%></td>
                     <td align="center">&nbsp;<%=bookcase%></td>
                     <td width="13%" align="center">&nbsp;<%=price%></td>
                     <td width="12%" align="center"><a href="borrow?action=bookrenew&barcode=<%=barcode%>&id=<%=id%>">续借</a>&nbsp;</td>
                   </tr>
                <%	}
}%>
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
