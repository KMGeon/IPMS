<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:forEach var="item" items="${detailList}" varStatus="idx">
<div class="row" style="margin-top: 10px;">
<div class="col-md-6" style="display: flex; float: left; width: 1000px;">
	<div class="card-content collapse show">
		<div class="card-body offset-2 ">
			<div style="padding-left: 20px;">
					<h4 class="form-section">
						<i class="feather icon-monitor"></i> Project Detail
					</h4>
					<hr style="width:650px; float: left" />
										<br/><br/><br/><br/>
					<div class="content-overlay"></div>
					<div class="content-body">
						<div class="card-content collapse show" >
							<div class="grid-hover"">
								<div class="col-md-6 ml-5" style="width: 1000px; height: 800px;">
									<figure class="effect-romeo" >
										<img src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/18.jpg"alt="img18">
										<figcaption>
											<h2>

												Wild <span>Romeo</span>
											</h2>
											<p>Romeo never knows what he wants. He seemed to be very
												cross about something.</p>
											<a href="#">View more</a>
										</figcaption>
									</figure><br/>
									<div style=" text-align: center;  ">
										<button  type="button" class="btn btn-secondary" style=" padding:11px 60px; background-color: #448AFF; color: white;"><i class="fa fa-handshake-o fa-lg">&nbsp;&nbsp;</i>가입신청</button><br/><br/>
									</div><br/><br/>

									<div style="text-align: center;" class="fonticon-wrap"><i class="icon-users"> Mmeber List</i><br/><br/>

										<div style="text-decoration: underline; margin-bottom: 5px;" class="badge badge-secondary">${item.projName}</div>
									</div>
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
	<div class="card-content collapse show">
		<div class="card-body">
			<div>
				<div class="form-body" >
					<h4 class="form-section" style="padding-bottom: 5px;">
						<i class="fa fa-file-text"></i> information
					</h4>
					<hr />
					<br/><br/>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="userinput1">Project Name</label> <input type="text"
									id="userinput1" class="form-control border-primary"
									placeholder="" name="name" value="${item.projName}" readonly/>

							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="userinput3">Project Period</label> <input
									type="text" id="userinput3" class="form-control border-primary"
									placeholder="Project period"  readonly name="username" value="${item.projStrtDate}~${item.projEndDate}" />
							</div>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="userinput8">Project Introduce</label>
						<textarea style="width:500px; resize: none;" id="userinput8" rows="5"
							class="form-control border-primary"
							placeholder="Project Introduce"  readonly>${item.projSmry}</textarea>
					</div>



					<div style="width:501px;" class="border-primary" style="border-radius: 0.2em;">
						<div  id="gdiv" >
							<label for="userinput8">댓글 목록</label>
							<hr/>
						</div>
						<div  class="form-group" style=" position: relative; top: 55px;" >
							<textarea style="width:500px; resize: none;" id="gtt" rows="5" class="form-control border-primary" placeholder="댓글작성" ></textarea>
							<button id="rgbtn" style="text-align:center; position: relative; bottom: 50px; left: 435px;"  class="btn btn-primary"  >등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</c:forEach>

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

<script type="text/javascript">
$(function(){
	$("#rgbtn").on("click",function(){
		alert("클릭함ㅋ");
		let gtt = $("#gtt").val();
		$("#gdiv").append("<br/>"+gtt+"<br/><button id='dgbtn'>[답글]</button><div id='dgsdiv'></div>");
	});

	$(document).on("click","#dgbtn",function(){
		$("#dgsdiv").append("<div id='ddgscbtn' class='form-group'><textarea id='dgtext' rows='5' class='form-control border-primary' placeholder='댓글작성'></textarea></div><button id='ddgbtn' style='text-align:center; position: relative; bottom: 65px; left: 665px;'  class='btn btn-primary'  >등록</button>");
		$("#dgbtn").remove();
	});
	$(document).on("click","#ddgbtn",function(){
		let dgtext = $("#dgtext").val();
		alert(dgtext);
		$("#rgbtn").append(dgtext);
		alert("ff");


	});

})

</script>


