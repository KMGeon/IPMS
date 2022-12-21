<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<!-- BEGIN: Head-->
<head>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body>

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
											<span class="invoice-id font-weight-bold">No. </span> <span>${list.issueId}</span>
										</div>
										<div class="col-md-12 col-lg-5 col-xl-8">
											<div
												class="d-flex align-items-center justify-content-end justify-content-xs-start">
												<div class="issue-date pr-2">
													<span><fmt:formatDate value="${list.issueRgstDate}" pattern="yyyy-MM-dd"/></span>
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
											style="font-family: 'MICEGothic Bold';">${list.issueCts}</h2>
										<span>${list.writer }</span>
									</div>
								</div>
								<hr>
								<div>일감 번호: ${list.taskId}</div>
								<br>
								<!-- 몰라서 일단 만들어만 놓음.... 클릭하면 일감 이동..?? -->
								<hr>

								<!-- 글 내용 -->
								<div class="row invoice-adress-info py-2">
									<div class="col-6 mt-1 from-info">
											${list.issueCts}
									</div>
								</div>
								<hr>
								<div>
									<i class="feather icon-link"></i>첨부파일:
									___________________________
								</div>
								<div style="float: right;">
									<button type="button" class="btn btn-secondary">
										<i class="feather icon-trash-2 mr-25 common-size"></i>삭제
									</button>
									<button type="button" class="btn btn-secondary">
										<i class="feather icon-edit mr-25 common-size"></i>수정
									</button>
									<a href="/proj/issueboard" class="btn btn-primary"><i
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
											<input type="text" class="form-control" id="repContent"
												placeholder="댓글을 입력하세요." />
										</div>
										<div class='col-sm-2'>
											<button type="button" class="btn btn-secondary"
												style="width: 150px;" id="repAdd" onclick="repAdd()">댓글
												등록</button>
										</div>
									</div>
									<div>
										<input type="file" id="	" name="repfile" style="padding-top: 8px;">
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
							<!-- 							<form class="form-horizontal"> -->
							<!-- 								<div class="user-block"> -->
							<!-- 									<div> -->
							<!-- 										<div style="padding-bottom: 5px;"> -->
							<!-- 											<span class="username"> <a href="#" style="font-size:15px;">김효정</a>&nbsp;&nbsp;<span -->
							<!-- 												style="font-size: 8px; color: grey;">2022-12-09 17:20</span><a -->
							<!-- 												href="#" class="float-right btn-box-tool replyDelBtn" -->
							<!-- 												data-toggle="modal" data-target="#delModal"><i -->
							<!-- 													class="fa fa-times" style="color: #D32F2F;">삭제</i> </a><a -->
							<!-- 												href="#" class="float-right btn-box-tool replyModBtn" -->
							<!-- 												data-toggle="modal" data-target="#modModal"> <i -->
							<!-- 													class="fa fa-edit" style="color: #00838F;">수정</i> -->
							<!-- 											</a> -->
							<!-- 											</span> <span class="description"></span> -->
							<!-- 										</div> -->
							<!-- 										<div id="repContent">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</div> -->
							<!-- 										<div style="padding-top: 10px;"> -->
							<!-- 											<button type="button" -->
							<!-- 												class="btn mr-1 mb-1 btn-secondary btn-sm">ㄴ 댓글</button> -->
							<!-- 										</div> -->
							<!-- 										<hr> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 							</form> -->
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

$(function(){
	
	// 댓글 등록
	$("#repAdd").on("click", function(){
//  		alert("댓글 등록 떠라");
 		let repCon = $("#repContent").val();
 		$("#repListAdd").append(
 		"<form class='form-horizontal'><div class='user-block'><div><div style='padding-bottom: 5px;'><span class='username'> <a href='#' style='font-size:15px;'>김효정</a>&nbsp;&nbsp;<span style='font-size: 8px; color: grey;'>2022-12-09 17:20</span><a href='#' class='float-right btn-box-tool replyDelBtn' data-toggle='modal' data-target='#delModal'><i class='fa fa-times' style='color: #D32F2F;'>삭제</i></a><a href='#' class='float-right btn-box-tool replyModBtn' data-toggle='modal' data-target='#modModal'><i class='fa fa-edit' style='color: #00838F;'>수정</i></a></span><span class='description'></span></div><div id='repContent'>"+repCon+"</div><div style='padding-top: 10px;'><button type='button' class='btn mr-1 mb-1 btn-secondary btn-sm'>ㄴ 댓글</button></div><hr></div></div></form>"		
 		);
 		$("#repContent").val("");
	});
	
});
</script>
