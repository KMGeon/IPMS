<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!-- BEGIN: Head-->
<head>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body>

	<!-- BEGIN: Content-->
	<div class="content-wrapper">
		<!-- 		<div class="content-header row"> -->
		<!-- 			<div class="content-header-left col-md-6 col-12 mb-2"> -->
		<!-- 				<h3 class="content-header-title mb-0">NOTICE DETAIL</h3> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
		<div class="content-body">
			<!-- App invoice wrapper -->
			<section class="app-invoice-wrapper">
				<div class="row justify-content-md-center">
					<div style="width: 1200px;">
						<!-- using a bootstrap card -->
						<div class="card">
							<!-- card body -->
							<div class="card-body p-2">
								<!-- card-header -->
								<div class="card-header px-0">
									<div class="row">
										<div class="col-md-12 col-lg-7 col-xl-4 mb-50">
											<input type="hidden" class="form-control" id="projId" name="projId" value="${data.projId}">
											<input type="hidden" class="form-control" id="memCode" name="memCode" value="${data.memCode}" />
											<span class="invoice-id font-weight-bold">No. </span> <span>${data.projNtNum}</span>
											<input type="hidden" class="form-control" id="projNtNum" name="projNtNum" value="${data.projNtNum}" />
										</div>
										<div class="col-md-12 col-lg-5 col-xl-8">
											<div
												class="d-flex align-items-center justify-content-end justify-content-xs-start">
												<div class="issue-date pr-2">
													<span><fmt:formatDate value="${data.projNtWriteDate}" pattern="yyyy-MM-dd" /> </span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- invoice logo and title -->
								<div class="invoice-logo-title row py-2">
									<div
										class="col-6 d-flex flex-column justify-content-center align-items-start">
										<h2 class="text-primary"
											style="font-family: 'MICEGothic Bold';">${data.projNtTitle}</h2>
										<span>작성자: ${data.memCode}</span>
									</div>
								</div>
								<hr>
								<!-- 글 내용 -->
								<div class="row invoice-adress-info py-2">
									<div class="col-6 mt-1 from-info">
										${data.projNtCts}
									</div>
								</div>
								<hr>
								<div>
									<!--data.intgAttachFileVOList => List<IntgAttachFileVO> intgAttachFileVOList -->
									<i class="feather icon-link"></i>첨부파일:&nbsp;
									<c:forEach var="intgAttachFileVO" items="${data.intgAttachFileVOList}">
									      <a href="/resources/uploadNt/${intgAttachFileVO.saveFileName}" download="${intgAttachFileVO.fileName}" style="color:#02b5b8;">${intgAttachFileVO.fileName}</a>
									</c:forEach>
								</div>
								<div style="float: right;">
									<c:if test="${memCheck eq 'true' }">
										<button type="button" class="btn btn-danger" id="ntDel">
												<i class="feather icon-trash-2 mr-25 common-size"></i>삭제
										</button>
										<a href="/proj/${projId}/noticeUpdate?projNtNum=${data.projNtNum}" class="btn btn-warning">
												<i class="feather icon-edit mr-25 common-size"></i>수정</a>
									</c:if>
									<a href="/proj/${projId}/noticeBoard" class="btn btn-primary"><i
										class="fa fa-reply-all mr-25 common-size"></i>목록</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-invoice.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>

<script type="text/javascript">

$(function() {
	
	$("#ntDel").on("click",function() {
		
//		alert("삭제 눌렀엉");
		
		let projNtNum = $("#projNtNum").val(); // 공지 글 번호
		let projId = $("#projId").val();
		
		let data = {"projNtNum":projNtNum,"projId":projId};
		console.log("data: " + JSON.stringify(data));
		
		
		$.ajax({
			url:"/proj/${projId}/noticeBoardDelete",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
			success: function(result) {
				
				console.log("result: " + JSON.stringify(result));
				
				// result가 0보다 크면 성공, 아니면 실패
				if(result > 0) {
					alert("글을 삭제하였습니다.");
					location.href="/proj/${projId}/noticeBoard";
				} else {
					alert("삭제 실패. 다시 시도해주세요.");
				}
			}
		}); // ajax end
		
	});
	
	
	
	
});

</script>
