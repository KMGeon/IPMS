<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- BEGIN: Head-->
<head>

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
								<!-- card body -->
								<div class="card-body p-2">
									<!-- card-header -->
									<div class="card-header px-0">
										<div class="row">
											<div class="col-md-12 col-lg-7 col-xl-4 mb-50">
												<span class="invoice-id font-weight-bold">No. </span> <span>${data.projBdId}</span>
												<input type="hidden" class="form-control" id="projBdId" name="projBdId" value="${data.projBdId}">
											</div>
											<div class="col-md-12 col-lg-5 col-xl-8">
												<div
													class="d-flex align-items-center justify-content-end justify-content-xs-start">
													<div class="issue-date pr-2">
														<span><fmt:formatDate value="${data.projBdWriteDate}" pattern="yyyy-MM-dd" /></span>
														<input type="hidden" class="form-control" id="projBdWriteDate" name="projBdWriteDate"
															value="${data.projBdWriteDate}">
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="invoice-logo-title row py-2">
										<div
											class="col-6 d-flex flex-column justify-content-center align-items-start">
											<h2 class="text-primary"
												style="font-family: 'MICEGothic Bold';">${data.projBdTitle}</h2>
											<input type="hidden" class="form-control" id="projBdTitle" name="projBdTitle" value="${data.projBdTitle}">
											<span>작성자: ${data.writer}</span>
											<input type="hidden" class="form-control" id="writer" name="writer" value="${data.writer}">
										</div>
									</div>
									<hr>

									<!-- 글 내용 -->
									<div class="row invoice-adress-info py-2">
										<div class="col-6 mt-1 from-info">
											${data.projBdCts}
											<input type="hidden" class="form-control" id="projBdCts" name="projBdCts" value="${data.projBdCts}">
										</div>
									</div>
									<hr>
<!-- 								<div class="form-group" id="itgrnAttachFileNum"> -->
<!-- 									<label for="itgrnAttachFileNum"><i -->
<!-- 										class="feather icon-link"></i>첨부파일:</label><br> -->

<!-- 									</label> -->
<!-- 								</div> -->
								<div style="float: right;">
										<button type="button" class="btn btn-danger" id="freeDel">
											<i class="feather icon-trash-2 mr-25 common-size"></i>삭제
										</button>
<!-- 										<button type="button" class="btn btn-secondary" id="updateFree"> -->
<!-- 											<i class="feather icon-edit mr-25 common-size"></i>수정 -->
<!-- 										</button> -->
										<a href="/proj/freeBoardUpdate?projBdId=${data.projBdId}" class="btn btn-warning">
											<i class="feather icon-edit mr-25 common-size"></i>수정
										</a> <a href="/proj/freeboard" class="btn btn-secondary"><i
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
										<input type="file" name="repfile" style="padding-top: 8px;">
									</div>
									<input type="hidden" class="form-control" id="projId" name="projId" value="${data.projId}">
									<input type="hidden" class="form-control" id="deleteYn" name="deleteYn" value="${data.deleteYn}">
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

	$(function() {

		// 글 삭제 버튼 꾸욱
		$("#freeDel").on("click", function() {
			
			let projBdId = $("#projBdId").val(); // 글 번호 가져와
			let deleteYn = $("#deleteYn").val(); // 삭제 여부 가져와
			
			let data = {"projBdId":projBdId,
					"deleteYn":deleteYn};		// 제이슨~
			
			console.log("data: " + JSON.stringify(data));
			
			// 아자작
			$.ajax({
				url:"/proj/freeBoardDelete",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				dataType:"json",
				type:"post",
		   		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
					
					console.log("result: " + JSON.stringify(result));
					
					let str = result.result;
					
					console.log("str : " + str);
					
					// result가 0보다 크면 성공, 아니면 실패
					if(str > 0) {
						alert("글을 삭제하였습니다.");
						location.href="/proj/freeboard";
					} else {
						alert("삭제 실패. 다시 시도해주세요.");
					}
				}
			})	// ajax end
			
		});

		
		
		// 댓글 등록
		$("#repAdd").on("click",function() {
			//  		alert("댓글 등록 떠라");
			let repCon = $("#repContent").val();
			$("#repListAdd")
					.append(
							"<form class='form-horizontal'><div class='user-block'><div><div style='padding-bottom: 5px;'><span class='username'> <a href='#' style='font-size:15px;'>김효정</a>&nbsp;&nbsp;<span style='font-size: 8px; color: grey;'>2022-12-09 17:20</span><a href='#' class='float-right btn-box-tool replyDelBtn' data-toggle='modal' data-target='#delModal'><i class='fa fa-times' style='color: #D32F2F;'>삭제</i></a><a href='#' class='float-right btn-box-tool replyModBtn' data-toggle='modal' data-target='#modModal'><i class='fa fa-edit' style='color: #00838F;'>수정</i></a></span><span class='description'></span></div><div id='repContent'>"
									+ repCon
									+ "</div><div style='padding-top: 10px;'><button type='button' class='btn mr-1 mb-1 btn-secondary btn-sm'>ㄴ 댓글</button></div><hr></div></div></form>");
			$("#repContent").val("");
		});

	});
</script>
