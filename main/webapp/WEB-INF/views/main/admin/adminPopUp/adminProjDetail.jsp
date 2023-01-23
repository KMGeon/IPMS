<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
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
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
</head>
<body>

	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title" id="basic-layout-colored-form-control"
					style="font-size: 23px; color: #455DBD; font-family: noto sans, malgun gothic, AppleGothic, dotum;">프로젝트
					정보</div>
				<hr>
			</div>
			<div class="card-content collapse show">
				<div class="card-body">
					<form class="form">
						<div class="form-body">
							<div class="row">
								<div class="col-4">
									<img src="/upload/file/upload/img/${data.projImgRoute}" class="img-responsive"
										style="width: 170px; height: 170px; margin-left: 5px; margin-top: 40px;">
								</div>
								<div class="col-8">
									<h4 class="form-section"
										style="font-family: noto sans, malgun gothic, AppleGothic, dotum; color: #455DBD;">
										<i class="feather icon-monitor" style="color: #455DBD;"></i> 기본
										정보
									</h4><br>
									<div class="row">
										<div class="col-12">
											<div class="form-group">
													<label for="projName">프로젝트 이름</label> <input type="text"
														id="projName" class="form-control border-secondary"
														name="projName" value="${data.projName}" disabled>
											</div>
										</div>
										<div class="col-6">
											<div class="form-group">
												<label for="projId">프로젝트 아이디</label> <input type="text"
													id="projId" class="form-control border-secondary"
													name="projId" value="${data.projId}" disabled>
											</div>

										</div>
										<div class="col-6">
											<div class="form-group">
												<label for="memCode">프로젝트 생성자</label> <input type="text"
													id="memCode" class="form-control border-secondary"
													name="memCode" value="${data.memCode}" disabled>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-4">
									<div class="form-group">
											<label for="projCreatnDate">프로젝트 생성 일자</label> <input type="text"
											id="projCreatnDate" class="form-control border-secondary"
											name="projCreatnDate" value="<fmt:formatDate value='${data.projCreatnDate}' pattern='yyyy-MM-dd'/>" disabled>
									</div>
								</div>
								<div class="col-4">
									<div class="form-group">
										<label for="projStrtDate">프로젝트 시작 일자</label>
										<input type="text" id="projStrtDate" class="form-control border-secondary"
											name="projStrtDate" value="<fmt:formatDate value='${data.projStrtDate}' pattern='yyyy-MM-dd'/>" disabled>
									</div>
								</div>
								<div class="col-4">
									<div class="form-group">
										<label for="projEndDate">프로젝트 종료 일자</label>
										<input type="text" id="projEndDate" class="form-control border-secondary"
											name="projEndDate" value="<fmt:formatDate value='${data.projEndDate}' pattern='yyyy-MM-dd'/>" disabled>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="projSmry">프로젝트 개요</label> 
								<div class="form-control border-secondary" id="projSmry" style="width:687px; height:130px; overflow: auto; background-color:#ECEFF1">${data.projSmry}</div>
							</div>
								<div class="form-group">
									<h4 class="form-section"
										style="font-family: noto sans, malgun gothic, AppleGothic, dotum; color: #455DBD;">
										<i class="feather icon-users" style="color: #455DBD;"></i>
										프로젝트 참여 회원
									</h4>
								</div>
								<div class="form-group">
<%-- 									<div style="text-size:15px; margin-bottom: 5px;" class="badge badge-secondary">${data.memCode}</div> --%>
									<c:forEach var="ProjManaVO" items="${memData}">
										<a href="javascript:f_memInfo('${ProjManaVO.memCode}')" style="color: #455DBD; text-size:15px; color:white;" class="badge badge-secondary">${ProjManaVO.writer}</a>
									</c:forEach>
								</div>
						</div>
						<div class="form-actions right">
							<button type="reset" class="btn btn-secondary" onclick="f_close()">닫기</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
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
</html>

<script>
	
	// 팝업 창 닫기~~
	function f_close() {
		
		window.close();
	}
	

	// 회원 정보 팝업창 띄우기
	function f_memInfo(param) {
		
	//	alert(param);
	
		let v_open = "/main/adminMemDetail?memCode="+param;

		let v_option = "width=750, height=800, top=100px, left=450px, scrollbars=yes";
		
		window.open(v_open, "회원 정보", v_option);
	}
	
</script>

