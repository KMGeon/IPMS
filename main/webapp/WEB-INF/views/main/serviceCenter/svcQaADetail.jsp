<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->

<!-- BEGIN: Content-->
<div class="content-wrapper">
	<!-- 		<div class="content-header row justify-content-md-center" style="text-align:center;"> -->
	<!-- 			<div class="content-header-left col-md-6 col-12 mb-2"> -->
	<!-- 				<h3 class="content-header-title mb-0">FREE BOARD DETAIL</h3> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<div class="content-body">
		<!-- App invoice wrapper -->
		<section class="app-invoice-wrapper">
			<div class="row justify-content-md-center">
				<div style="width: 1200px;">
					<!-- using a bootstrap card -->
					<div class="card">
						<form id="qnaDelete" action="/main/svcQaADelete" method="post">
						<input type="hidden" id="qnaNum" name="qnaNum" value="${svcQaAVO.qnaNum}">
						<!-- card body -->
						<div class="card-body p-2">
							<!-- card-header -->
							<div class="card-header px-0">
								<div class="row">
									<div class="col-md-12 col-lg-7 col-xl-4 mb-50">
										<span class="invoice-id font-weight-bold">No. </span><span>${svcQaAVO.qnaNum}</span>
									</div>
									<div class="col-md-12 col-lg-5 col-xl-8">
										<div
											class="d-flex align-items-center justify-content-end justify-content-xs-start">
											<div class="issue-date pr-2">
												<span><fmt:setLocale value="ko_kr"/><fmt:formatDate value="${svcQaAVO.qnaWriteDate}" pattern="yyyy-MM-dd"/></span>
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
										style="font-family: 'MICEGothic Bold';">${svcQaAVO.qnaTitle}</h2>
									<br>
									<span>작성자 : ${svcQaAVO.writer}</span>
								</div>
							</div>
							<hr>

							<!-- 글 내용 -->
							<div class="form-group">
								<label for="qnaCts">내용</label> 
								<br>
								<br>
								<div id="qnaCts" >${svcQaAVO.qnaCts}</div>
							</div>
							<hr>
<!-- 							<div> -->
<!-- 								<i class="feather icon-link"></i>첨부파일: -->
<!-- 								___________________________ -->
<!-- 							</div> -->
							<div style="float: right;">
							<c:if test="${svcQaAVO.memCode eq mvo.member.memCode}">
								<button type="button" id="qnaDelBtn" class="btn btn-danger">
									<i class="feather icon-trash-2 mr-25 common-size"></i>삭제
								</button>
								<a href="/main/svcQaAUpdateForm?qnaNum=${svcQaAVO.qnaNum}" id="cancelBtn" class="btn btn-secondary">
									<i class="feather icon-edit mr-25 common-size"></i>수정
								</a>
							</c:if>
								<a href="/main/svcQaA" class="btn btn-primary">
									<i class="fa fa-reply-all mr-25 common-size"></i>목록
								</a>
							</div>
						</div>
						<sec:csrfInput/>
					</form>
					</div>
				</div>
<!-- 				<div class="card mb-2" style="width: 1200px; height: 85px;"> -->
<!-- 					<div class="card-body"> -->
<!-- 						<div> -->
<!-- 							<form class="form-horizontal"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class='col-sm-10'> -->
<!-- 										<input type="text" class="form-control" id="repInsert" -->
<!-- 											placeholder="댓글을 입력하세요." /> -->
<!-- 									</div> -->
<!-- 									<div class='col-sm-2'> -->
<!-- 										<button type="button" class="btn btn-secondary" -->
<!-- 											style="width: 150px;">댓글 등록</button> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div
					class="card mb-2 card border-top-info border-top-2 box-shadow-0"
					style="width: 1200px; height: auto;">
					<div class="card-header"
						style="padding: 13px; color: #455A64; font-size: 15px;">
						Comments&nbsp;<i class="fa fa-comment fa"></i>
					</div>
					<div class="card-body">
						<div id="replyDiv" class="card">
						<c:if test="${svcQaACommentSelect.qnaAnswCts eq null}">
							<div class="card-content">
								아직 답변이 작성되지 않았습니다.
							</div>
						</c:if>
						<c:if test="${svcQaACommentSelect.qnaAnswCts ne null}">
							<h4 class="card-title" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;"><i class="fa fa-user-o"></i>&nbsp;&nbsp;관리자&nbsp;&nbsp;<div style="font-size: 8px;"><fmt:setLocale value="ko_kr"/><fmt:formatDate value="${svcQaACommentSelect.qnaAnswWriteDate}" pattern="yyyy-MM-dd"/></div></h4>
							
							<div class="card-content">
								${svcQaACommentSelect.qnaAnswCts}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						</c:if>
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

<script type="text/javascript">
// 	CKEDITOR.replace('qnaCts',{
// 		toolar: [],
// 		readOnly:true
// 	});

// 	$("#cancelBtn").on("click", function(){
// 		alert("눌림");
// 		CKEDITOR.instances.qnaCts.setReadOnly(false);
// 		CKEDITOR.instances.qnaCts.replace;
// 	});
let memCode1 = "${svcQaAVO.writer}";
let memCode2 = "${mvo.member.memCode}";
console.log(memCode1 + " : "+memCode2);

$("#qnaDelBtn").on("click", function() {
	let result = confirm("Q&A를 삭제하시겠습니까?");
	let data = {};
	if(result){
		$("#qnaDelete").submit();
	}else {
		location.reload();
	}
});
</script>
