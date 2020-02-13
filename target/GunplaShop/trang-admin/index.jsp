<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="entities.QuanTriVien"%>
<%@ page import="java.io.File"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	if (request.getParameter("route") == null) {
		response.sendRedirect("index.jsp?route=main");
		return;
	}

	String path = getServletContext().getRealPath("/trang-admin/" + request.getParameter("route") + ".jsp");
	File file = new File(path);
	
	if (!file.exists()) {
		session.invalidate();
		response.sendRedirect("index.jsp?route=main");
		return;
	}

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>QTV Gunpla Shop - Trang chủ</title>
<jsp:include page="lock/style-${param.route}.html"/>
<link href="../css/toastr.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>
</head>

<body>
<!-- Code -->
<%@ include file="lock/kiemtra-chuadangnhap.jsp"%>

<!-- Start wrapper-->
<div id="wrapper">

	<!--Start sidebar-wrapper-->
	<jsp:include page="lock/bars/sidebar.jsp"/>
	<!--End sidebar-wrapper-->

	<!--Start topbar header-->
	<jsp:include page="lock/bars/topbar.jsp"/>
	<!--End topbar header-->

	<div class="clearfix"></div>

	<div class="content-wrapper">
		<jsp:include page="${param.route}.jsp"/>
	</div>
	<!--End content-wrapper-->
	
	<!--Start Back To Top Button-->
	<a href="javaScript:void();" class="back-to-top">
		<i class="fa fa-angle-double-up"></i>
	</a>
	<!--End Back To Top Button-->

	<!--Start footer-->
	<footer class="footer">
		<div class="container">
			<div class="text-center"></div>
		</div>
	</footer>
	<!--End footer-->

</div>
<!--End wrapper-->

<jsp:include page="lock/script-${param.route}.html"/>
<script src="../js/toastr.min.js"></script>
</body>
</html>
