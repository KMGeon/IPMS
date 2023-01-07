<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/datatables.min.css">


<div class="content-body">
	<!-- Base style table -->
	<div class="row" style="text-align: center;">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">
						<b>ISSUE BOARD</b>
					</h4>
				</div>
				<div class="card-content collapse show">
					<div class="card-body card-dashboard">
						<h1 style="font-family: 'MICEGothic Bold';">이슈 게시판</h1>
					</div>
					<div>
						<div>
							<a href="/proj/issueInsert"
								class="mr-1 mb-1 btn btn-outline-secondary btn-min-width">이슈
								등록 <i class="icon-pencil"></i>
							</a>
						</div>
						<div
							style="float: right; padding-right: 10px; padding-bottom: 10px;"
							class="input-group col-3">
							<input type="text"
								class="form-control form-control-xl input-xl border-grey border-lighten-1 "
								placeholder="Search..." aria-describedby="button-addon2">
							<span class="input-group-append" id="button-addon2">
								<button class="btn btn-secondary border-grey border-lighten-1"
									type="button">
									<i class="feather icon-search"></i>
								</button>
							</span>
						</div>
					</div>
					<div>
						<table
							class="table table-striped table-bordered base-style table-hover">
							<thead>
								<tr role="row">
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending"
										style="width: 5px;">선택</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending"
										style="width: 5px;">이슈번호</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Position: activate to sort column ascending"
										style="width: 450px;">제목</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending"
										style="width: 30px;">작성자</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending"
										style="width: 97.9531px;">상태</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending"
										style="width: 250px;">작성일자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>1</td>
									<td><a href="/proj/issueDetail">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>2</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-warning">미해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>3</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>4</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-warning">미해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-warning">미해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-warning">미해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-warning">미해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-warning">미해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-warning">미해결</span></td>
									<td>2022-12-05</td>
								</tr>
								<tr>
									<td><input type='checkbox' id="ckbox" name="ckbox" value=""></td>
									<td>5</td>
									<td><a href="#">title test</a></td>
									<td>writer</td>
									<td><span class="badge badge-success">해결</span></td>
									<td>2022-12-05</td>
								</tr>
						</table>
						<div class="row">
							<div class="col-sm-12 col-md-7">
								<div style="float: left; padding-left: 32px;">
									<button type="button" class="btn"
										style="background-color: #546E7A; color: white;">삭제</button>
								</div>
								<div class="dataTables_paginate paging_simple_numbers"
									id="DataTables_Table_0_paginate" style="float: right;">
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

<!-- BEGIN: Vendor JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/tables/datatables/datatable-styling.js"></script>
<!-- END: Page JS-->

<!-- END: Body-->

