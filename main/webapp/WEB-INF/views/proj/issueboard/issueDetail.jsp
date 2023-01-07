<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
	
	
<!-- BEGIN: Head-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->
<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
</script>

	<!-- BEGIN: Content-->
	<div class="content-wrapper">
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
											<span class="invoice-id font-weight-bold">No. </span> <span id="issueId" >${list.issueId}</span>
										</div>
										<div class="col-md-12 col-lg-5 col-xl-8">
											<div
												class="d-flex align-items-center justify-content-end justify-content-xs-start">
												<div class="issue-date pr-2">
													<span>작성일  :  <fmt:formatDate value="${list.issueRgstDate}" pattern="yyyy-MM-dd"/></span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- invoice logo and title -->
										작성자 : <span>${list.writer }</span>
								<div class="invoice-logo-title row py-2">
									<div id="title" class="col-9 d-flex flex-column justify-content-center align-items-start">
										<h2 class="text-primary" style="font-family: 'MICEGothic Bold';">${list.issueTitle}</h2>
										
									</div>
									
										<div id="comnoncombtn" class="col-3" style=" display:none; float: right;">
											<button style="width:80px; outline:none;" id="comple" type="button" class="btn btn-outline-success">해결</button>
											<button style="width:80px; outline:none;" id="noncomple" type="button" class="btn btn-outline-danger">미해결</button>	
										</div>
									
								</div>
								<hr>
								<div >일감 제목 : ${list.taskTitle}</div>
								<br>
								<!-- 몰라서 일단 만들어만 놓음.... 클릭하면 일감 이동..?? -->
								<hr>
								<div>
								<!-- 파일경로 -->
									<c:if test="${list.fileType eq 'image/png' || list.fileType eq 'image/jpeg' }">
										<img alt="사진ㅋ" src="/upload/file/uploadIs${list.saveFileName}">
									</c:if>
								</div>

								<!-- 글 내용 -->
								<div class="row invoice-adress-info py-2">
									<div class="col-6 mt-1 from-info">
											${list.issueCts}
									</div>
								</div>
								<hr>
								
								<c:if test="${list.filePath != null }">
									<div>
										<i class="feather icon-link"></i> 첨부파일:
										<a href="/resources${list.saveFileName}" download="${list.fileName}">"${list.fileName}"</a>
									</div>
								</c:if>
								<c:if test="${list.filePath == null }">
									<div>
										<i class="feather icon-link"></i> &nbsp;등록된 첨부파일이 없습니다.
									</div>
								</c:if>
								<div style="float: right;">
									<c:if test="${list.writer eq mvo.member.memName}">
										<button type="button" class="btn btn-danger">
											<i class="feather icon-trash-2 mr-25 common-size"></i>삭제
										</button>
										<a href="/proj/${list.projId}/issueUpdate/?issueId=${list.issueId}" type="button" id="issueupbtn" class="btn btn-warning">
											<i class="feather icon-edit mr-25 common-size"></i>수정
										</a>
									</c:if>
									<a href="/proj/${list.projId}/issueboard" class="btn btn-secondary"><i
										class="fa fa-reply-all mr-25 common-size"></i>목록</a>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-2" style="width: 1200px; height: auto;">
						<div class="card-body">
							<div>
								<form class="form-horizontal">
									<div class="row">
										<div class='col-sm-10'>
											<input type="text" class="form-control" id="issueCmtCts" name="issueCmtCts" placeholder="댓글을 입력하세요." />
										</div>
										<div class='col-sm-2'>
											<button type="button" class="btn btn-secondary" style="width: 150px;" id="repAdd">댓글 등록</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div
						class="card mb-2 card border-top-info border-top-2 box-shadow-0"
						style="width: 1200px; height: auto;">
						<div class="card-header"
							style="padding: 13px; color: #455A64; font-size: 15px;">
							Comments&nbsp;<i class="fa fa-comment fa"></i>
						</div>
						<div class="card-body" id="repListAdd">
							 <!-- 댓글 인설트 성공 시 데이터 삽입  -->
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-invoice.js"></script>
	<!-- END: Page JS-->
<script>
var issueId = "${issueCd}";
var gwriter = "${list.writer}";
var memCode = "${mvo.member.memCode}";
var writer= "${mvo.member.memName}";
let title = document.querySelector("#title");
console.log("mem: ",memCode);
console.log("writer : " , writer);
console.log(issueId);

let btncheck = "${list.issueStusCode}";
if(btncheck == '해결'){
	$("#comple").attr("class","btn btn-outline-success active");
	$("#title").append("<p>[이슈 종료]</p>");
}else{
	$("#noncomple").attr("class","btn btn-outline-danger active");
	$("#title").append("<p style='color:red;'>[이슈 진행중]</p>");
}

if(gwriter == writer){
	$("#comnoncombtn").css("display","block");
}

</script>
<script type="text/javascript" src="/resources/js/issueboard.js"></script>







