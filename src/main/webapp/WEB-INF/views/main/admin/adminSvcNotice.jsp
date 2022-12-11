<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<head>
<title>관리자 페이지 - 고객센터 관리</title>

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
			<div class="card" style="width: 1200px;">
				<div class="card-content">
					<div class="card-body">
						<div class="row breadcrumbs-top" >
					        <div class="breadcrumb-wrapper col-12">
					            <ol class="breadcrumb" style="position: relative;margin-right: 15px; font-size: 25px; font-family: MICEGothic Bold">
					                <li class="breadcrumb-item active"><a href="/main/adminSvcNotice" style="color: #3F4E89">공지사항 관리</a>
					                </li>
					                <li class="breadcrumb-item"><a href="/main/adminSvcFaq" style="color: gray;">자주묻는질문 관리</a>
					                </li>
					                <li class="breadcrumb-item"><a href="/main/adminSvcQaA" style="color: gray;">Q&A 관리</a>
					                </li>
					            </ol>
					        </div>
					    </div>
						<!-- Task List table -->
						<div class="table-responsive">
							<div>
								<br>
								<div class="bug-list-search" style="padding-bottom: 15px; width:1115px;">
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
							</div>
							<table id="users-contacts"
								class="table table-white-space table-borderless row-grouping display no-wrap icheck table-middle text-center"
								style="width: 1115px;">
								<thead style="background: #3F4E89; color: white;">
									<tr>
										<th>선택</th>
										<th>공지사항 번호</th>
										<th>제목</th>
										<th>내용</th>
										<th>등록일자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type='checkbox' id="ckbox" name="ckbox"
											value=""></td>
										<td>111</td>
										<td><b><a href="/main/svcNoticeDetail" style="color: #455DBD;">사이트 사용불가 공지</a></b>
											<button type="button"
												class="btn btn-outline-secondary btn-sm">
												<i class="feather icon-search"></i>
											</button></td>
										<td>사이트가 이용불가요</td>
										<td><span class="badge badge-success">2022-12-09</span></td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="padding-top: 20px; margin: auto;">
								<div class="col-sm-12 col-md-7">
									<div style="float: left;">
										<button type="button" class="btn"
											style="background-color: #546E7A; color: white;">삭제</button>
									</div>
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