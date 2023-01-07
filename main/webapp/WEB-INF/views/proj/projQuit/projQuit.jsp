<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<!DOCTYPE html>
<head>
<title>프로젝트 - 프로젝트 하차</title>
<style>
.my-hr2 {
	border: 0;
	height: 2px;
	background: #ccc;
	background-color: #404e67;
}
</style>

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->
<body>

	<!-- Outline variants section start -->
		<section id="outline-variants">
			<div class="row">
				<div class="col-12 mt-3 mb-1"></div>
			</div>
			<div class="row match-height">
				<div class="col-md-6 col-sm-8" style="margin: auto;margin-top: 100px;">
					<div class="card border-secondary text-center bg-transparent">
						<div class="card-content">
							<div class="card-body pt-3">
								<img
									src="/resources/logoImage/IPMSlogo.png"
									class="rounded mr-75" height="55" width="140"
									style="margin-bottom: 15px;">
								<h4 style="color: #404e67;">GET OFF PROJECT</h4>
								<hr class="my-hr2">
								<br>
								<form action="/proj/${projId}/projQuitProcess" method="post">
								<input type="hidden" name="projId" value="${projId}"/>
								<input type="hidden" name="memCode" value="${mvo.member.memCode}"/>
								<p class="card-text">프로젝트를 하차하시려면 버튼을 누르세요.</p>
								<br> <br> <br> <br>
								<button id="quitBtn" class="btn btn-secondary">하차하기</button>
								<br> <br>
									<input type="hidden" name="projId" value="${projId}"/>
									<sec:csrfInput/>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
</html>

