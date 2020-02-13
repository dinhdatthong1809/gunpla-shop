<%@ page isErrorPage="true" language="java"	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<%@ include file="lock/css-links.html"%>
</head>
<body>
	<h1>Error</h1>

	<%=exception.getMessage()%>
	<%=session.getAttribute("thongbao")%>
</body>
</html>