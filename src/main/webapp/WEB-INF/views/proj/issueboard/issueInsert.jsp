<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/issueboard.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<head>
<style>
.ck-editor__editable {
    min-height: 300px;
}
</style>

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->
<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
</script>
<body>
	<!-- BEGIN: Content-->
	<div class="content-body">
		<!-- Basic form layout section start -->
		<section id="basic-form-layouts">
			<div class="row match-height">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" style="text-align:center;">
							<h4 class="form-section" style="font-family: 'MICEGothic Bold';">
								<i class="fa fa-exclamation-triangle"
									style="color: #FF6275; padding-right: 5px;"></i>이슈 등록하기
							</h4>
							<hr>
						</div>
						<div class="card-content collapse show">
							<div class="card-body">
									<div class="row justify-content-md-center">
										<div class="col-md-6">
											<div class="form-body">
												<div class="form-group">
													<label for="eventInput1">제목</label> 
													<input type="text" id="issueTitle" name="issueTitle" 
													class="form-control" placeholder="제목을 입력해주세요."  required>
												</div>

									<!-- 체크박스로 일감 관련된 이슈/관련없는 이슈 나눠서 일감관련에 체크할 경우에만 일감을 선택하여 연결할 수 있는 div를 밑에 뜨게 했으면 좋겠다는 의견 -->
												<div class="form-group">
													<label for="eventInput2">관련 일감</label> 
														<select id="taskId" name="taskId">
														</select>
												</div>
												<div class="form-group">
													<label for="eventInput3">내용</label> 
													<textarea cols="" rows="30" id="issueCts" name="issueCts" 
													class="form-control" placeholder="내용을 입력해주세요."  required> </textarea>
												</div>

												<div class="form-group">
													<label>첨부파일</label><br>
													<label id="projectinput7"
														class="file center-block"> 
														<input type="file" id="file" name="itgrnAttachFileNum"> 
														<span class="file-custom"></span>
													</label>
												</div>
										</div>
									<div class="form-actions center" style="text-align: center;">
										<button id="sendbtn" class="btn btn-primary" >
											<i class="fa fa-check-square-o"></i> 등록
										</button>
										<button type="reset" class="btn btn-secondary mr-1">
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

</script>
