<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<!DOCTYPE html>

<!-- BEGIN: Head-->

<!-- ★스크롤바 추가 해야함 -->

<head>
<title>마이 페이지 - 초대/신청 현황 조회</title>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/forms/validation/form-validation.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/pickadate/pickadate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/datatables.min.css">
<!-- END: Vendor CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body>
	<!-- BEGIN: Content-->
	<!-- users edit start -->
	<h3>초대/신청 현황 프로젝트</h3><br>
	<section class="users-edit">
		<div class="card" style="width: 65%;">
			<div class="card-content">
				<div class="card-body">
					<ul class="nav nav-tabs mb-2" role="tablist">
						<li class="nav-item"><a
							class="nav-link d-flex align-items-center active"
							id="account-tab" data-toggle="tab" href="#account"
							aria-controls="account" role="tab" aria-selected="true"> <i
								class="feather icon-user mr-25"></i><span
								class="d-none d-sm-block">초대된 프로젝트</span>
						</a></li>
						<li class="nav-item"><a
							class="nav-link d-flex align-items-center" id="information-tab"
							data-toggle="tab" href="#information" aria-controls="information"
							role="tab" aria-selected="false"> <i
								class="feather icon-info mr-25"></i><span
								class="d-none d-sm-block">신청한 프로젝트</span>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="account"
							aria-labelledby="account-tab" role="tabpanel">
							<!-- users edit account form start -->
							<form novalidate>
								<div class="col-xl-8 col-lg-12" style="overflow: auto;">
									<div class="card">
										<div class="card-content">
											<div class="table-responsive">
												<table id="recent-orders"
													class="table table-hover mb-0 ps-container ps-theme-default">
													<thead>
														<tr>
															<th>시작일</th>
															<th>프로젝트명</th>
															<th>기간</th>
															<th>승인 여부</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">수락</button>
																<button type="button" class="btn btn-danger btn-sm">거절</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">수락</button>
																<button type="button" class="btn btn-danger btn-sm">거절</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">수락</button>
																<button type="button" class="btn btn-danger btn-sm">거절</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">수락</button>
																<button type="button" class="btn btn-danger btn-sm">거절</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">수락</button>
																<button type="button" class="btn btn-danger btn-sm">거절</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">수락</button>
																<button type="button" class="btn btn-danger btn-sm">거절</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">수락</button>
																<button type="button" class="btn btn-danger btn-sm">거절</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- users edit account form ends -->
						</div>
						<div class="tab-pane" id="information"
							aria-labelledby="information-tab" role="tabpanel">
							<!-- users edit Info form start -->
							<form novalidate>
								<div class="col-xl-8 col-lg-12">
									<div class="card" style="">
										<div class="card-content">
											<div class="table-responsive">
												<table id="recent-orders"
													class="table table-hover mb-0 ps-container ps-theme-default">
													<thead>
														<tr>
															<th>시작일</th>
															<th>프로젝트명</th>
															<th>기간</th>
															<th>초대 승인</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate"><span
																class="badge badge-warning">응답중</span>
																<button type="button" class="btn btn-danger btn-sm">취소</button>
															</td>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate"><span
																class="badge badge-warning">응답중</span>
																<button type="button" class="btn btn-danger btn-sm">취소</button>
															</td>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate"><span
																class="badge badge-warning">응답중</span>
																<button type="button" class="btn btn-danger btn-sm">취소</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- users edit Info form ends -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card" style="width: 65%;">
			<div class="card-content">
				<div class="card-body">
					<ul class="nav nav-tabs mb-2" role="tablist">
						<li class="nav-item"><a
							class="nav-link d-flex align-items-center active" id="invite-tab"
							data-toggle="tab" href="#invite" aria-controls="invite"
							role="tab" aria-selected="true"> <i
								class="feather icon-user mr-25"></i><span
								class="d-none d-sm-block">초대한 회원</span>
						</a></li>
						<li class="nav-item"><a
							class="nav-link d-flex align-items-center" id="apply-tab"
							data-toggle="tab" href="#apply" aria-controls="apply" role="tab"
							aria-selected="false"> <i class="feather icon-info mr-25"></i><span
								class="d-none d-sm-block">신청한 회원</span>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="invite"
							aria-labelledby="invite-tab" role="tabpanel">
							<!-- users edit account form start -->
							<form novalidate>
								<div class="col-xl-8 col-lg-12">
									<div class="card" style="">
										<div class="card-content">
											<div class="table-responsive">
												<table id="recent-orders"
													class="table table-hover mb-0 ps-container ps-theme-default">
													<thead>
														<tr>
															<th>시작일</th>
															<th>프로젝트명</th>
															<th>기간</th>
															<th>승인 여부</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate"><span
																class="badge badge-warning">응답중</span>
																<button type="button" class="btn btn-danger btn-sm">취소</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate"><span
																class="badge badge-warning">응답중</span>
																<button type="button" class="btn btn-danger btn-sm">취소</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate"><span
																class="badge badge-warning">응답중</span>
																<button type="button" class="btn btn-danger btn-sm">취소</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름입니다</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate"><span
																class="badge badge-warning">응답중</span>
																<button type="button" class="btn btn-danger btn-sm">취소</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- users edit account form ends -->
						</div>
						<div class="tab-pane" id="apply" aria-labelledby="apply-tab"
							role="tabpanel">
							<!-- users edit Info form start -->
							<form novalidate>
								<div class="col-xl-8 col-lg-12">
									<div class="card" style="">
										<div class="card-content">
											<div class="table-responsive">
												<table id="recent-orders"
													class="table table-hover mb-0 ps-container ps-theme-default">
													<thead>
														<tr>
															<th>시작일</th>
															<th>프로젝트명</th>
															<th>기간</th>
															<th>초대 승인</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">승인</button>
																<button type="button" class="btn btn-danger btn-sm">반려</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">승인</button>
																<button type="button" class="btn btn-danger btn-sm">반려</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">승인</button>
																<button type="button" class="btn btn-danger btn-sm">반려</button>
															</td>
														</tr>
														<tr>
															<td class="text-truncate">2022-12-01</td>
															<td class="text-truncate"><a href="#">프로젝트 이름</a></td>
															<td class="text-truncate">2022-12-10</td>
															<td class="text-truncate">
																<button type="button" class="btn btn-success btn-sm">승인</button>
																<button type="button" class="btn btn-danger btn-sm">반려</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- users edit Info form ends -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- users edit ends -->
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
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/page-users.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/navs/navs.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/tables/datatables/datatable-styling.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>