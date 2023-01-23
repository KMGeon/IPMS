<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-climacon.css">
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/fonts/simple-line-icons/style.min.css">

  <link rel="apple-touch-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
  <link rel="shortcut icon" type="image/x-icon" href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <!-- BEGIN: Vendor CSS-->
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/charts/jquery-jvectormap-2.0.3.css">
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/charts/morris.css">
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/unslider.css">
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/weather-icons/climacons.min.css">
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
  <!-- link(rel='stylesheet', type='text/css', href=app_assets_path+'/css'+rtl+'/pages/users.css')-->
  <!-- END: Page CSS-->

  <!-- BEGIN: Custom CSS-->
  <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
  <!-- END: Custom CSS-->
  <link rel="stylesheet" href="/resources/css/reset.css">
  <link rel="stylesheet" href="/resources/css/join.css">
</head>
<body class="horizontal-layout horizontal-menu horizontal-menu-padding 2-columns d-flex flex-column min-vh-100" data-open="hover" data-menu="horizontal-menu" data-col="2-columns">

<!-- mainHeader 시작 -->
<tiles:insertAttribute name="header"/>
<!-- mainHeader 끝 -->

<div class="header-navbar" role="navigation" data-menu="menu-wrapper"></div>


      <!-- mainBody 시작 -->
      <tiles:insertAttribute name="body"/>
      <!-- mainBody 끝 -->


<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<!-- mainFooter 시작 -->
<tiles:insertAttribute name="footer"/>
<!-- mainFooter 끝 -->

<!-- BEGIN: Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/jquery.knob.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/extensions/knob.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/raphael-min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/morris.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jvector/jquery-jvectormap-2.0.3.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jvector/jquery-jvectormap-world-mill.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/data/jvector/visitor-data.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/chart.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/unslider-min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/dashboard-analytics.js"></script>
<!-- END: Page JS-->
</body>
</html>