<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<!-- BEGIN: Head-->
<head>

<title>마이페이지 - 개인 정보 관리(수정)</title>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/pickadate/pickadate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/toggle/switchery.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/forms/validation/form-validation.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/pickers/daterange/daterange.css">
<!-- END: Page CSS-->

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->

<body>

	<!-- BEGIN: Content-->
    <div style="bottom:30px;" class="content-header-left col-md-6 col-12 mb-2">
			<h3 class="content-header-title mb-0"><b>개인 정보 관리</b></h3>
			<div class="row breadcrumbs-top">
				<div class="breadcrumb-wrapper col-12"></div>
			</div>
		</div>
			<div class="content-body">
				<!-- account setting page start -->
				<section id="page-account-settings">
					<div class="row">
						<!-- right content section -->
						<div class="col-md-9">
							<div class="card" style="width:800px;">
								<div class="card-content">
									<div class="card-body">
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane active"
												id="account-vertical-general"
												aria-labelledby="account-pill-general" aria-expanded="true">
												<div class="media">
													<a href="javascript: void(0);"> <img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-18.png"
														class="rounded mr-75" alt="profile image" height="64"
														width="64">
													</a>
													<div class="media-body mt-75">
														<div
															class="col-12 px-0 d-flex flex-sm-row flex-column justify-content-start">
															<label
																class="btn btn-sm btn-primary ml-50 mb-50 mb-sm-0 cursor-pointer"
																for="account-upload">프로필 사진 변경</label> <input
																type="file" id="account-upload" hidden>
														</div>
														<p class="text-muted ml-75 mt-50">
															<small>나를 보여줄 프로필 사진을 지정해보세요!</small>
														</p>
													</div>
												</div>
												<hr>
												<form novalidate>
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<div class="controls">
																	<label for="account-username">이름</label> <input
																		type="text" class="form-control" id="account-username"
																		required>
																</div>
															</div>
														</div>
														<div class="col-12">
															<div class="form-group">
																<div class="controls">
																	<label for="account-old-password">현재 비밀번호</label> <input
																		type="password" class="form-control" required>
																</div>
															</div>
														</div>
														<div class="col-12">
															<div class="form-group">
																<div class="controls">
																	<label for="account-new-password">비밀번호 변경</label> <input
																		type="password" class="form-control" required>
																</div>
															</div>
														</div>
														<div class="col-12">
															<div class="form-group">
																<div class="controls">
																	<label for="account-new-password">비밀번호 변경 확인</label> <input
																		type="password" class="form-control" required>
																</div>
															</div>
														</div>
														<div class="col-12">
															<div class="form-group">
																<div class="controls">
																	<label for="account-phoneNumber">핸드폰 번호</label> <input
																		type="text" class="form-control"
																		id="account-phoneNumber" required>
																</div>
															</div>
														</div>
														<div class="col-12">
															<div class="form-group">
																<div class="controls">
																	<label>분야</label> <select
																		class="select2-data-array form-control select2-hidden-accessible"
																		id="select2-array" data-select2-id="select2-array"
																		tabindex="-1" aria-hidden="true"><option
																			value="0" data-select2-id="342">분야를 선택하세요.</option>
																		<option value="1" data-select2-id="be">백엔드</option>
																		<option value="2" data-select2-id="fe">프론트엔드</option>
																		<option value="3" data-select2-id="pb">퍼블리셔</option>
																		</select>
																</div>
															</div>
														</div>

														<div class="col-12">
															<div class="form-group">
																<div class="controls">
																	<label>기술 스택</label> <select
																		class="select2 form-control select2-hidden-accessible"
																		multiple="" data-select2-id="12" tabindex="-1"
																		aria-hidden="true">
																		<optgroup label="보유한 기술 스택을 선택하세요.">
																			<option value="spring">SPRING</option>
																			<option value="vue">Vue</option>
																			<option value="js">JS</option>
																			<option value="mysql">MYSQL</option>
																		</optgroup>
																	</select>
																</div>
															</div>
														</div>
														<div
															class="col-12 d-flex flex-sm-row flex-column justify-content-end">
															<button type="submit"
																class="btn btn-primary mr-sm-1 mb-1 mb-sm-0">저장</button>
															<button type="reset" class="btn btn-light">취소</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- account setting page end -->
			</div>
	<!-- END: Content-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/toggle/switchery.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>

	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/account-setting.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/forms/select/form-select2.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>