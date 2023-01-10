<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/js/issueboardInsert.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>

<head>
<style>
.ck-editor__editable {
    min-height: 300px;
}

taskId {
		max-width: 30%%;
	}
</style>

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->
<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
	var memCode = "${mvo.member.memCode}";
</script>
<body>
	<!-- BEGIN: Content-->
	<div class="content-body">
		<!-- Basic form layout section start -->
		<section id="basic-form-layouts">
			<div class="row match-height">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" style="text-align:center; padding-bottom: 1px">
							<h4 class="form-section" style="font-family: 'MICEGothic Bold';">
								<i class="fa fa-exclamation-triangle"
									style="color: #FF6275; padding-right: 5px;"></i>이슈 등록하기
							</h4>
							<hr>
						</div>
						<div class="card-content collapse show" style="padding-bottom: 1px">
							<div class="card-body" style="padding: 0px">
									<div class="row justify-content-md-center">
										<div class="col-md-10">
											<div class="form-body">
												<div class="form-group">
													<div style="display:flex;">
														<div style="width:50%">
															<label for="eventInput1">제목</label> 
															<input style="width:350px;" type="text" id="issueTitle" name="issueTitle" 
															class="form-control" placeholder="제목을 입력해주세요."  required>
														</div>
														<div style="width:50%">
														 	<label for="eventInput1">일감 제목</label>
														<div>
															<div class="row">
																<div class="col-8">
																	<select style="width:300px;" class="form-control" name="taskId" id="taskId">
																		<option value="" selected>검색</option>
																	</select>
																</div>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button" id="searchBtn" class="btn btn-icon btn-secondary mr-1 mb-1"><i class="ficon feather icon-search"></i>검색</button>
															</div>
														</div>
													</div>
												</div>
												<br/>
												<div class="form-group">
												<div class="form-group">
													<label for="eventInput3">내용</label> 
													<textarea cols="5" rows="30" id="issueCts" name="issueCts" 
													class="form-control" placeholder="내용을 입력해주세요."  required> </textarea>
												</div>
												<br/>
													<div class="form-group">
													
													<label id="projectinput7" class="file center-block"> 
														첨부파일 : <input type="file" id="itgrnAttachFileNum" name="itgrnAttachFileNum"> 
														<span class="file-custom"></span>
													</label>
												</div>
										</div>
									<div class="form-actions center" style="text-align: center;">
										<button id="sendbtn" class="btn btn-secondary" >
											<i class="fa fa-check-square-o"></i> 등록
										</button>
										<button type="reset" class="btn btn-danger mr-1">
											<i class="feather icon-x"></i> 취소
										</button>
									</div>
									</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- // Basic form layout section end -->
	</div>
	<!-- END: Content-->
</body>
<!-- END: Body-->
</html>

<script>

CKEDITOR.replace('issueCts');
$('select').select2();
</script>
