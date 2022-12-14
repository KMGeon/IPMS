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
										<span>?????????: ${data.memCode}</span>
									</div>
								</div>
								<hr>
								<!-- ??? ?????? -->
								<div class="row invoice-adress-info py-2">
									<div class="col-6 mt-1 from-info">
										${data.projNtCts}
									</div>
								</div>
								<hr>
								<div>
									<!--data.intgAttachFileVOList => List<IntgAttachFileVO> intgAttachFileVOList -->
									<i class="feather icon-link"></i>????????????:&nbsp;
									<c:forEach var="intgAttachFileVO" items="${data.intgAttachFileVOList}">
									      <a href="/resources/uploadNt/${intgAttachFileVO.saveFileName}" download="${intgAttachFileVO.fileName}" style="color:#02b5b8;">${intgAttachFileVO.fileName}</a>
									</c:forEach>
								</div>
								<div style="float: right;">
									<c:if test="${memCheck eq 'true' }">
										<button type="button" class="btn btn-danger" id="ntDel">
												<i class="feather icon-trash-2 mr-25 common-size"></i>??????
										</button>
										<a href="/proj/${projId}/noticeUpdate?projNtNum=${data.projNtNum}" class="btn btn-warning">
												<i class="feather icon-edit mr-25 common-size"></i>??????</a>
									</c:if>
									<a href="/proj/${projId}/noticeBoard" class="btn btn-primary"><i
										class="fa fa-reply-all mr-25 common-size"></i>??????</a>
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
		
		alert("?????? ?????????");
		
		let projNtNum = $("#projNtNum").val(); // ?????? ??? ??????
		
		let data = {"projNtNum":projNtNum};
		console.log("data: " + JSON.stringify(data));
		
		
		$.ajax({
			url:"/proj/${projId}/noticeBoardDelete",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend : function(xhr) {   // ????????? ?????? ??? ????????? csrf??? ??????
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
			success: function(result) {
				
				console.log("result: " + JSON.stringify(result));
				
				// result??? 0?????? ?????? ??????, ????????? ??????
				if(result > 0) {
					alert("?????? ?????????????????????.");
					location.href="/proj/${projId}/noticeBoard";
				} else {
					alert("?????? ??????. ?????? ??????????????????.");
				}
			}
		}); // ajax end
		
	});
	
	
	
	
});

</script>
