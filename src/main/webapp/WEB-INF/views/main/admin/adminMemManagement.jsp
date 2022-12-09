<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<head>
<title>관리자 페이지 - 회원 관리</title>

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
			<div class="card" style="width:1200px;">
				<div class="card-content">
					<div class="card-body">
						<!-- Task List table -->
						<div class="table-responsive">
							<h3>회원 관리</h3>
							<br>
							<div class="bug-list-search" style="padding-bottom: 15px;">
								<div class="bug-list-search-content">
									<div class="sidebar-toggle d-block d-lg-none">
										<i class="feather icon-menu font-large-1"></i>
									</div>
									<form action="#">
										<div class="position-relative">
											<input type="search" id="search-contacts"
												class="form-control" placeholder="Search">
											<div class="form-control-position">
												<i
													class="fa fa-search text-size-base text-muted la-rotate-270"></i>
											</div>
										</div>
									</form>
								</div>
							</div>
							<table id="users-contacts"
								class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center">
								<thead style="background: #3F4E89; color: white;">
									<tr>
										<th>No.</th>
										<th>회원명</th>
										<th>아이디</th>
										<th>핸드폰 번호</th>
										<th>개발 분야</th>
										<th>가입 일자</th>
										<th>경고 횟수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">이문주</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">lee@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-info">백엔드</span></td>
										<td>2022-12-01</td>
										<td class="text-center">1회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">박종환</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">park@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-warning">프론트엔드</span></td>
										<td>2022-12-02</td>
										<td class="text-center">1회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>3</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">송중호</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">song@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-primary">퍼블리셔</span></td>
										<td>2022-12-03</td>
										<td class="text-center">2회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">이문주</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">lee@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-info">백엔드</span></td>
										<td>2022-12-01</td>
										<td class="text-center">1회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">박종환</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">park@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-warning">프론트엔드</span></td>
										<td>2022-12-02</td>
										<td class="text-center">1회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>3</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">송중호</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">song@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-primary">퍼블리셔</span></td>
										<td>2022-12-03</td>
										<td class="text-center">2회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">이문주</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">lee@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-info">백엔드</span></td>
										<td>2022-12-01</td>
										<td class="text-center">1회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">박종환</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">park@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-warning">프론트엔드</span></td>
										<td>2022-12-02</td>
										<td class="text-center">1회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>3</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">송중호</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">song@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-primary">퍼블리셔</span></td>
										<td>2022-12-03</td>
										<td class="text-center">2회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
									<tr>
										<td>1</td>
										<td>
											<div class="media">
												<div class="media-left pr-1">
													<span class="avatar avatar-sm avatar-online rounded-circle"><img
														src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
														alt="avatar"><i></i></span>
												</div>
												<div class="media-body media-middle">
													<a class="media-heading name">이문주</a>
												</div>
											</div>
										</td>
										<td class="text-center"><a class="email"
											href="mailto:email@example.com" style="color: #455DBD;">lee@example.com</a></td>
										<td class="phone">010-1234-5678</td>
										<td class="text-center"><span class="badge badge-info">백엔드</span></td>
										<td>2022-12-01</td>
										<td class="text-center">1회 <a class="danger delete mr-1"><i
												class="fa fa-trash-o"></i></a></td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="padding-top: 20px; margin: auto;">
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate" style="padding-left: 400px;">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="DataTables_Table_0_previous"><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="0"
												tabindex="0" class="page-link">Previous</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="1"
												tabindex="0" class="page-link">1</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="2"
												tabindex="0" class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="3"
												tabindex="0" class="page-link">3</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="4"
												tabindex="0" class="page-link">4</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="5"
												tabindex="0" class="page-link">5</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="6"
												tabindex="0" class="page-link">6</a></li>
											<li class="paginate_button page-item next"
												id="DataTables_Table_0_next"><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="7"
												tabindex="0" class="page-link">Next</a></li>
										</ul>
									</div>
								</div>
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