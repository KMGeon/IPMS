<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib  uri="http://www.springframework.org/security/tags"  prefix="sec" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Gallery Hover Effects - Stack Responsive Bootstrap 4
	Admin Template</title>
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
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/gallery.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style type="text/css">

.btn btn-secondary round btn-min-width mr-1 mb-1{
background-color: #448AFF;
}

.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}
</style>
</head>
<div class="row">
<div class="col-md-6" style="display: flex; float: left; width: 1000px;">
	<div class="card-content collapse show">
		<div class="card-body">
			<div class="offset-1">
					<h4 class="form-section">
						<i class="feather icon-monitor"></i> new Project
					</h4>
					<hr style="width:750px; float: left" />
										<br/><br/><br/><br/>
					<div class="pace  pace-inactive">
						<div class="pace-progress" data-progress-text="100%"
							data-progress="99"
							style="transform: translate3d(100%, 0px, 0px);">
							<div class="pace-progress-inner"></div>
						</div>
						<div class="pace-activity"></div>
					</div>
					<div class="content-body offset-2 ">
						<div class="card-content collapse show " >
							<div class="grid-hover"">
								<div class="col-md-6 ml-5" style="width: 1000px; height: 800px;">
								<div><i class="feather icon-image">&nbsp;</i><b>대표 이미지</b></div>
									<figure class="effect-romeo" style="width: 120%">
										<img src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/18.jpg"alt="img18">
										<figcaption>
											<h2>
												Wild <span>Romeo</span>
											</h2>
											<p>Romeo never knows what he wants. He seemed to be very
												cross about something.</p>
											<a href="#">View more</a>
										</figcaption>
									</figure><br/><br/>

									<div style=" text-align: center; padding-left:20px; ">
										<button  type="button" class="btn btn-secondary ml-5" style="padding:11px 60px; background-color: #448AFF; color: white;"> <i class="feather icon-settings">&nbsp;&nbsp;</i>대표이미지 설정</button><br/><br/>
									</div>
									<form action="/main/uploadFormAction" method="post" enctype="multipart/form-data">
<%--										?${_csrf.parameterName}=${_csrf.token}--%>
										<input type='file' name='uploadFile' multiple />
										<input type='submit' value="전송" />
										<sec:csrfInput />
									</form>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
<!-- 			zzz---------------------------------------------------------------------------------------------------------------- -->
<div class="col-md-6"
	style=" float: right; width: 1000px;">
	<form action="/main/newProjectPost" method="post">
	<div class="card-content collapse show">
		<div class="card-body">
			<div>
				<div class="form-body" >
					<h4 class="form-section" style="padding-bottom: 5px;">
						<i class="fa fa-file-text"></i> information
					</h4>
					<hr />
					<br/><br/><br/>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="projName">Project Name</label> <input type="text" id="projName"   class="form-control border-primary" placeholder="Project Name" name="projName" />
							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
							<div style="float: left">
								<label for="projStrtDate">Project Start Date</label>
									<input type="date" id="projStrtDate" class="form-control border-primary" placeholder="Start Date" name="projStrtDate" />
							</div>
							<div style="float:right;">
								<label for="projEndDate">Project End Date</label>
									<input type="date" id="projEndDate" class="form-control border-primary" placeholder="End Date" name="projEndDate" />
							</div>
							</div>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="projSmry">Project Introduce</label>
						<textarea style="width:500px; resize: none;" id="projSmry" rows="9" name="projSmry" class="form-control border-primary" placeholder="Project Introduce"></textarea>
					</div>
							<input type="submit" class="btn btn-primary" value="등록"/>
							<input type="button" class="btn btn-primary"  value="목록" onclick="location.href='/main/wholeProject'" />
				</div>
			</div>
		</div>
	</div>

		<input type="hidden" name="projMemVOList[0].memCode" value="2"/>
		<input type="hidden" name="projMemVOList[0].projId" value="3"/>
		<sec:csrfInput/>

		<sec:authorize access="isAuthenticated()">
		<input type="text" name="memEmail" value="<sec:authentication property="principal.username"/>"/>
		</sec:authorize>
	</form>
</div>
</div>

<!-- BEGIN: Footer-->

<!-- END: Footer-->


<!-- BEGIN: Vendor JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<!-- END: Page JS-->
</body>
<!-- END: Body-->
</html>




