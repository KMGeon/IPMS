<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<head>
<title>관리자 페이지 - 프로젝트 관리</title>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/extensions/rowReorder.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/extensions/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/icheck.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/custom.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-contacts.css">
<!-- END: Page CSS-->

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->

<body>
	<!-- BEGIN: Content-->
	<section class="row all-contacts">
		<div class="col-12">
			<div class="card">
				<div class="card-content">
					<div class="card-body">
						<!-- Task List table -->
						<div class="table-responsive">
							<div>
								<div class="col">
									<h3>프로젝트 관리</h3>
								</div>
								<div style="float: right;">
									<div class="btn-group mr-1 mb-1">
										<button type="button"
											class="btn btn-outline-secondary dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">진행 여부 선택</button>
										<div class="dropdown-menu" x-placement="bottom-start"
											style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
											<a class="dropdown-item" href="#">취소</a> <a
												class="dropdown-item" href="#">진행중</a> <a
												class="dropdown-item" href="#">완료</a>
										</div>
									</div>
								</div>
							</div>
							<table id="users-contacts"
								class="table table-white-space table-borderless row-grouping display no-wrap icheck table-middle text-center">
								<thead style="background: #3F4E89; color: white;">
									<tr>
										<th>No.</th>
										<th>프로젝트 명</th>
										<th>프로젝트 생성자</th>
										<th>진행 여부</th>
										<th>등록 일자</th>
										<th>시작 일자</th>
										<th>종료 일자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2345</td>
										<td><a href="#" style="color: #455DBD;">병원 관리 시스템 </a>
											<button type="button"
												class="btn btn-outline-secondary btn-sm">
												<i class="feather icon-search"></i>
											</button></td>
										<td>김현석</td>
										<td><span class="badge badge-success">진행중</span></td>
										<td>2022-10-01</td>
										<td>2022-10-15</td>
										<td>2023-01-08</td>
									</tr>
									<tr>
										<td>2346</td>
										<td><a href="#" style="color: #455DBD;">학사 관리 시스템 </a>
											<button type="button"
												class="btn btn-outline-secondary btn-sm">
												<i class="feather icon-search"></i>
											</button></td>
										<td>김연수</td>
										<td><span class="badge badge-secondary">완료</span></td>
										<td>2022-10-01</td>
										<td>2022-10-15</td>
										<td>2023-01-08</td>
									</tr>
									<tr>
										<td>2347</td>
										<td><a href="#" style="color: #455DBD;">프로젝트 관리 시스템 </a>
											<button type="button"
												class="btn btn-outline-secondary btn-sm">
												<i class="feather icon-search"></i>
											</button></td>
										<td>이문주</td>
										<td><span class="badge badge-success">진행중</span></td>
										<td>2022-10-01</td>
										<td>2022-10-15</td>
										<td>2023-01-08</td>
									</tr>
									<tr>
										<td>2348</td>
										<td><a href="#" style="color: #455DBD;">SaaS기반 그룹웨어 </a>
											<button type="button"
												class="btn btn-outline-secondary btn-sm">
												<i class="feather icon-search"></i>
											</button></td>
										<td>윤동기</td>
										<td><span class="badge badge-success">진행중</span></td>
										<td>2022-10-01</td>
										<td>2022-10-15</td>
										<td>2023-01-08</td>
									</tr>
									<tr>
										<td>2349</td>
										<td><a href="#" style="color: #455DBD;">쇼핑몰 관리 시스템</a>
											<button type="button"
												class="btn btn-outline-secondary btn-sm">
												<i class="feather icon-search"></i>
											</button></td>
										<td>홍길동</td>
										<td><span class="badge badge-warning">취소</span></td>
										<td>2022-10-01</td>
										<td>2022-10-15</td>
										<td>2023-01-08</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<!-- END: Content-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/jquery.dataTables.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/jquery.raty.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/dataTables.rowReorder.min.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-contacts.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>