<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<!-- BEGIN: Head-->

<head>
    <title>Email Application - Stack Responsive Bootstrap 4 Admin Template</title>
    <link rel="apple-touch-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/quill/quill.snow.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-email.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
    <!-- END: Custom CSS-->
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/join.css">
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="horizontal-layout horizontal-menu horizontal-menu-padding 2-columns d-flex flex-column min-vh-100" data-open="hover" data-menu="horizontal-menu" data-col="content-left-sidebar">

    <!-- mypageHeader 시작 -->
	<tiles:insertAttribute name="mypageHeader"/>
	<!-- mypageHeader 끝 -->
	
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="display: flex;">
	<!-- mypageAside 시작 -->
	<tiles:insertAttribute name="mypageAside"/>
	<!-- mypageAside 끝 -->
	
    

    <!-- BEGIN: Content-->
    <div class="content-right">
            <div class="content-overlay"></div>
            <div class="content-wrapper">
                <div class="content-header row"></div>
                <div class="content-body offset-1">
					<tiles:insertAttribute name="mypageBody"/>
            	</div>
        </div>
    </div>
    <!-- END: Content-->
	</div>

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

	<!-- projFooter 시작 -->
<%-- 	<tiles:insertAttribute name="mypageFooter"/> --%>
	<!-- projFooter 끝 -->


    <!-- BEGIN: Vendor JS-->
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/quill/quill.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
    <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-email.js"></script>
    <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>