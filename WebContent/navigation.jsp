<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.dao.ManagerDAO"%>
<%@ page import="com.actionForm.ManagerForm"%>
<!-- start Banner -->
<%
	String manager = (String) session.getAttribute("manager");
	//验证用户是否登录
	if (manager == null || "".equals(manager)) {
		response.sendRedirect("login.jsp");
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<div class="header">
	<div class="headerbg ">
		<div class="headerbd">
			您好！&nbsp;<%=manager%>
		</div>
		<!-- end headerbd-->
	</div>
	<!-- end headerbg-->

<!-- start 导航 -->
<%
	ManagerDAO managerDAO = new ManagerDAO();
	ManagerForm form1 = (ManagerForm) managerDAO.query_p(manager);
	int sysset1 = 0;
	int readerset1 = 0;
	int bookset1 = 0;
	int borrowback1 = 0;
	int sysquery1 = 0;
	if (form1 != null) {
		sysset1 = form1.getSysset();
		readerset1 = form1.getReaderset();
		bookset1 = form1.getBookset();
		borrowback1 = form1.getBorrowback();
		sysquery1 = form1.getSysquery();
	}
%>
<script src="JS/onclock.JS"></script>

<script src="JS/menu.JS"></script>
<script type="text/javascript">
	function quit() {
		if (confirm("真的要退出系统吗?")) {
			window.location.href = "logout.jsp";
		}
	}
</script>
<div class=menuskin id=popmenu
	onmouseover="clearhidemenu();highlightmenu(event,'on')"
	onmouseout="highlightmenu(event,'off');dynamichide(event)"
	style="Z-index: 100; position: absolute;"></div>
	<div id="navigationbg">
		<div class="navigationbg_left">
				<div id="bgclock" class="word_white"></div>
		</div>
		<div class="navigationbg_right">
		<a
			href="main.jsp" class="word_white">首页</a> | <%
			if (sysset1 == 1) {
		%><a
			onmouseover=showmenu(event,sysmenu) onmouseout=delayhidemenu()
			class="word_white" style="CURSOR: hand">系统设置</a> | <%
			}
		%>
			<%
				if (readerset1 == 1) {
			%><a onmouseover=showmenu(event,readermenu)
			onmouseout=delayhidemenu() style="CURSOR: hand" class="word_white">读者管理</a>
			| <%
				}
			%>
			<%
				if (bookset1 == 1) {
			%><a onmouseover=showmenu(event,bookmenu)
			onmouseout=delayhidemenu() class="word_white" style="CURSOR: hand">图书管理</a>
			| <%
				}
			%>
			<%
				if (borrowback1 == 1) {
			%><a onmouseover=showmenu(event,borrowmenu)
			onmouseout=delayhidemenu() class="word_white" style="CURSOR: hand">图书借还</a>
			| <%
				}
			%>
			<%
				if (sysquery1 == 1) {
			%><a onmouseover=showmenu(event,querymenu)
			onmouseout=delayhidemenu() class="word_white" style="CURSOR: hand">系统查询</a>
			| <%
				}
			%><a href="manager?action=querypwd" class="word_white">更改口令</a> |
			<a href="#" onClick="quit()" class="word_white">退出系统</a>
		
		

		</div>
	</div>
	<div id="navigationline"></div>

<!-- end 导航 -->
</div>
<!-- end header-->