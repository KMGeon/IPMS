<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Dashboard eCommerce - Stack Responsive Bootstrap 4 Admin
	Template</title>
<link rel="apple-touch-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/unslider.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/weather-icons/climacons.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/fonts/meteocons/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/charts/morris.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/components.css">
<!-- END: Theme CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/fonts/simple-line-icons/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/timeline.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->

<!-- BEGIN: font CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/commonFont.css">
<!-- END: font CSS-->

<style>
#chatOpen {
	position: fixed;
	height:50px;
	width:50px;
	bottom: 30px;
	right: 30px;
	width: $base-button-size;
	height: $base-button-size;
	color: $background-color;
	background-color: $primary-color;
	background-position: center center;
	background-repeat: no-repeat;
	box-shadow: 12px 15px 20px 0 rgba(46, 61, 73, 0.15);
	border: 0;
	border-radius: 50%;
	cursor: pointer;
}
</style>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu 2-columns   fixed-navbar"
	data-open="click" data-menu="vertical-menu" data-col="2-columns">

	<!-- projHeader 시작 -->
	<tiles:insertAttribute name="projHeader" />
	<!-- projHeader 끝 -->

	<!-- projAside 시작 -->
	<tiles:insertAttribute name="projAside" />
	<!-- projAside 끝 -->


	<!-- projBody 시작 -->
	<div class="app-content content">
		<div class="content-overlay"></div>
		<div class="content-wrapper">
			<div class="content-header row"></div>
			<div class="content-body">
				<tiles:insertAttribute name="projBody" />
				<div id="justify-content" class="container">
					<div id="chatOpen" class="justify-content-end"
						style="float: right;">
						<i class="fa fa-comment fa-2x" aria-hidden="true" style="font-size: 44px;color: #02b5b8;"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- projBody 끝 -->


	<div class="sidenav-overlay"></div>
	<div class="drag-target"></div>

	<!-- projFooter 시작 -->
	<tiles:insertAttribute name="projFooter" />
	<!-- projFooter 끝 -->

	<!-- chatbox 시작 -->
	<script type="text/javascript">
		$("#chatOpen").on("click",function(){
			window.open("http://192.168.142.9/proj/${projId}/chat",
					"_blank", "menubar=no, toolbar=no,resizable=no, location=no, width=550,height=700,left=300");
		});
	</script>
	<!-- chatbox 끝 -->
	
	<!-- BEGIN: Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/raphael-min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/morris.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/unslider-min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/timeline/horizontal-timeline.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/dashboard-ecommerce.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</body>
</html>

