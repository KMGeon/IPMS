<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

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
	<div class="col-md-12" style="height: 90%; width: 100%">
		<div class="card h-100 d-inline-block w-100">
			<div class="card-header">
				<div class="card-title" id="basic-layout-colored-form-control" style="font-size: 23px; color: #455DBD; font-family: noto sans, malgun gothic, AppleGothic, dotum;">
					${adminSvcQaAVO.qnaTitle}
				</div>
				<br>
				<div>
					<b>작성자</b> : ${adminSvcQaAVO.writer} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>등록 일자</b> : <fmt:setLocale value="ko_kr"/><fmt:formatDate value="${adminSvcQaAVO.qnaWriteDate}" pattern="yyyy-MM-dd"/>
				</div>
				<hr>
			</div>
			<div class="card-content collapse show">
				<div class="card-body">
					<div class="">
						${adminSvcQaAVO.qnaCts} 	
					</div>
					<br><br><br>
					<hr>
					<div class="row">
						<input type="hidden" id="qnaNum" name="qnaNum" value="${adminSvcQaAVO.qnaNum}">
						<div class='col-sm-10'>
							<input type="text" class="form-control" id="qnaAnswCts" name="qnaAnswCts" placeholder="답변을 입력하세요." />
						</div>
						<div class='col-sm-2'>
							<button type="submit" class="btn btn-secondary" style="width: 150px;" id="repAdd">답변 등록</button>
						</div>
					</div>
					<hr>
					<div class="" style="color: #455DBD; font-size: 15px;">
						Comments&nbsp;<i class="fa fa-comment fa"></i>
					</div>
					<br>
					<div id="replyDiv" class="card">
					<c:if test="${adminSvcQaACommentVO.qnaAnswCts ne null}">
						<h4 class="card-title" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;"><i class="fa fa-user-o"></i>&nbsp;&nbsp;관리자&nbsp;&nbsp;<div style="font-size: 8px;"><fmt:setLocale value="ko_kr"/><fmt:formatDate value="${adminSvcQaACommentVO.qnaAnswWriteDate}" pattern="yyyy-MM-dd"/></div></h4>
						
						<div class="card-content">
							${adminSvcQaACommentVO.qnaAnswCts}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a style=' color : red; font-size: 12px; text-decoration: underline;' type='button'>삭제</a>
                            <a style='color : grey; font-size: 12px; text-decoration: underline;' type='button'>수정</a>
						</div>
					</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="form-actions right" >
			<button type="reset" class="btn btn-secondary" style="float: right;" onclick="f_close()">닫기</button>
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
	<script>
		// 팝업 창 닫기
		function f_close() {
			window.close();
		}
	
		// 관리자 Q&A 댓글  
		let repAddBtn = document.getElementById("repAdd");
		let replyDiv = document.getElementById("replyDiv");
		let xhr;

		repAddBtn.addEventListener("click", () => {
			let qnaAnswCts = document.getElementById("qnaAnswCts").value;
			let qnaNum = document.getElementById("qnaNum").value;

			let data = JSON.stringify({
				"qnaNum" : qnaNum,
				"qnaAnswCts" : qnaAnswCts
			});

			let token = "${_csrf.token}";
			let header = "${_csrf.headerName}";

			xhr = new XMLHttpRequest();

			xhr.open("post", "/main/adminPopUp/adminSvcQaAReplyInsert", true);
			
			xhr.setRequestHeader(header, token);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(data);

			xhr.onload = () => {
				if(xhr.status == 200){
					console.log(xhr.response);
					console.log("댓글 작성 완료");
					location.reload();
					opener.location.reload();
				}
			}

		})

	</script>
</body>
</html>

