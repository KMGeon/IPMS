<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<head>

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->

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
								<form class="form">
									<div class="row justify-content-md-center">
										<div class="col-md-6">
											<div class="form-body">
												<div class="form-group">
													<label for="eventInput1">제목</label> <input
														type="text" id="eventInput1" class="form-control"
														placeholder="제목을 입력해주세요." name="title" required>
												</div>

									<!-- 체크박스로 일감 관련된 이슈/관련없는 이슈 나눠서 일감관련에 체크할 경우에만 일감을 선택하여 연결할 수 있는 div를 밑에 뜨게 했으면 좋겠다는 의견 -->
												<div class="form-group">
													<label for="eventInput2">관련 일감</label> <input type="text"
														id="eventInput2" class="form-control" placeholder="이 부분은 더 찾아봐야함.. text말고 일감을 어떤 방법으로 연결시킬지"
														name="work">
												</div>
												<div class="form-group">
													<label for="eventInput3">내용</label> <input type="text"
														id="eventInput3" class="form-control"
														placeholder="내용을 입력해주세요." name="content" id="content" required>
												</div>

												<div class="form-group">
													<label>첨부파일</label><br><label id="projectinput7"
														class="file center-block"> <input type="file"
														id="file"> <span class="file-custom"></span>
													</label>
												</div>
												
												<!-- 												<div class="form-group"> -->
<!-- 													<label>Existing Customer</label> -->
<!-- 													<div class="input-group"> -->
<!-- 														<div -->
<!-- 															class="d-inline-block custom-control custom-radio mr-1"> -->
<!-- 															<input type="radio" name="customer1" -->
<!-- 																class="custom-control-input" id="yes"> <label -->
<!-- 																class="custom-control-label" for="yes">Yes</label> -->
<!-- 														</div> -->
<!-- 														<div class="d-inline-block custom-control custom-radio"> -->
<!-- 															<input type="radio" name="customer1" -->
<!-- 																class="custom-control-input" id="no"> <label -->
<!-- 																class="custom-control-label" for="no">No</label> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->

										</div>
									<div class="form-actions center">
										<button type="submit" class="btn btn-primary">
											<i class="fa fa-check-square-o"></i> 등록
										</button>
										<button type="reset" class="btn btn-secondary mr-1">
											<i class="feather icon-x"></i> 취소
										</button>
									</div>
									</div>
								</form>

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

<script type="text/javascript">
CKEDITOR.replace('content');
</script>