<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script type="text/javascript">
		alert("读者信息添加成功!");
		window.location.href="reader?action=readerQuery";
		</script>	
	<%	break;
	case 2:
	%>
		<script type="text/javascript">
		alert("读者信息修改成功!");
		window.location.href="reader?action=readerQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script type="text/javascript">
		alert("读者信息删除成功!");
		window.location.href="reader?action=readerQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>