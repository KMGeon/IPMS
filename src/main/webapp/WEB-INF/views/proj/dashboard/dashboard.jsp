<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<!-- END: Page CSS-->

<!-- BEGIN: font CSS-->
<link rel="stylesheet" type="text/css" href="/resources/css/commonFont.css">
<!-- END: font CSS-->

<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<div class="content-header row">
	<div class="content-header-left col-md-6 col-12 mb-2">
		<h3 class="content-header-title mb-0">Project Dashboard</h3>
		<div class="row breadcrumbs-top">
			<div class="breadcrumb-wrapper col-12"></div>
		</div>
	</div>
</div>
<div class="content-detached content-left">
	<div class="content-body">
		<!-- 첫번째 -->
		<div style="display: flex;">
			<div class="col-xl-8 col-lg-12">
				<div class="card" style="">
					<div class="card-header">
						<h3 class="content-header-title mb-0">일감</h3>
							<p>
								<span class="float-right"><a
									href="project-summary.html" target="_blank">더보기
										<i class="feather icon-arrow-right"></i>
								</a></span>
							</p>
						<a class="heading-elements-toggle"><i
							class="fa fa-ellipsis-v font-medium-3"></i></a>
						<div class="heading-elements">
						</div>
					</div>
					<div class="card-content">
						<div class="table-responsive">
							<table id="recent-orders"
								class="table table-hover mb-0 ps-container ps-theme-default">
								<thead>
									<tr>
										<th>SKU</th>
										<th>Invoice#</th>
										<th>Customer Name</th>
										<th>Status</th>
										<th>Amount</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-truncate">PO-10521</td>
										<td class="text-truncate"><a href="#">INV-001001</a></td>
										<td class="text-truncate">Elizabeth W.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1200.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-10521</td>
										<td class="text-truncate"><a href="#">INV-001001</a></td>
										<td class="text-truncate">Elizabeth W.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1200.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-10521</td>
										<td class="text-truncate"><a href="#">INV-001001</a></td>
										<td class="text-truncate">Elizabeth W.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1200.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-532521</td>
										<td class="text-truncate"><a href="#">INV-01112</a></td>
										<td class="text-truncate">Doris R.</td>
										<td class="text-truncate"><span
											class="badge badge-warning">Overdue</span></td>
										<td class="text-truncate">$ 5685.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-05521</td>
										<td class="text-truncate"><a href="#">INV-001012</a></td>
										<td class="text-truncate">Andrew D.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 152.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-15521</td>
										<td class="text-truncate"><a href="#">INV-001401</a></td>
										<td class="text-truncate">Megan S.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1450.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-32521</td>
										<td class="text-truncate"><a href="#">INV-008101</a></td>
										<td class="text-truncate">Walter R.</td>
										<td class="text-truncate"><span
											class="badge badge-warning">Overdue</span></td>
										<td class="text-truncate">$ 685.00</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>


			<div class="col-xl-8 col-lg-12">
				<div class="card" style="">
					<div class="card-header">
						<h3 class="content-header-title mb-0">이슈</h3>
						<p>
								<span class="float-right"><a
									href="project-summary.html" target="_blank">더보기
										<i class="feather icon-arrow-right"></i>
								</a></span>
							</p>
						<a class="heading-elements-toggle"><i
							class="fa fa-ellipsis-v font-medium-3"></i></a>
						<div class="heading-elements">
						</div>
					</div>
					<div class="card-content">
						<div class="table-responsive">
							<table id="recent-orders"
								class="table table-hover mb-0 ps-container ps-theme-default">
								<thead>
									<tr>
										<th>SKU</th>
										<th>Invoice#</th>
										<th>Customer Name</th>
										<th>Status</th>
										<th>Amount</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-truncate">PO-10521</td>
										<td class="text-truncate"><a href="#">INV-001001</a></td>
										<td class="text-truncate">Elizabeth W.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1200.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-10521</td>
										<td class="text-truncate"><a href="#">INV-001001</a></td>
										<td class="text-truncate">Elizabeth W.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1200.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-10521</td>
										<td class="text-truncate"><a href="#">INV-001001</a></td>
										<td class="text-truncate">Elizabeth W.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1200.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-532521</td>
										<td class="text-truncate"><a href="#">INV-01112</a></td>
										<td class="text-truncate">Doris R.</td>
										<td class="text-truncate"><span
											class="badge badge-warning">Overdue</span></td>
										<td class="text-truncate">$ 5685.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-05521</td>
										<td class="text-truncate"><a href="#">INV-001012</a></td>
										<td class="text-truncate">Andrew D.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 152.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-15521</td>
										<td class="text-truncate"><a href="#">INV-001401</a></td>
										<td class="text-truncate">Megan S.</td>
										<td class="text-truncate"><span
											class="badge badge-success">Paid</span></td>
										<td class="text-truncate">$ 1450.00</td>
									</tr>
									<tr>
										<td class="text-truncate">PO-32521</td>
										<td class="text-truncate"><a href="#">INV-008101</a></td>
										<td class="text-truncate">Walter R.</td>
										<td class="text-truncate"><span
											class="badge badge-warning">Overdue</span></td>
										<td class="text-truncate">$ 685.00</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 첫번째 끝 -->

		<!-- 두번째 시작 -->

		<div style="display: flex; width: 1440px">

			<div class="row">

				<div class="col-xl-4 col-lg-5">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="content-header-title mb-0">공지사항</h3>
<p>
								<span class="float-right"><a
									href="project-summary.html" target="_blank">더보기
										<i class="feather icon-arrow-right"></i>
								</a></span>
							</p>
							</div>
							<div class="card-content collapse show">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">First Name</th>
												<th scope="col">Last Name</th>
												<th scope="col">Username</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>Larry</td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-xl-4 col-lg-6">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h3 class="content-header-title mb-0">프로젝트 게시판</h3>
								<a class="heading-elements-toggle"><i
									class="fa fa-ellipsis-v font-medium-3"></i></a>
<p>
								<span class="float-right"><a
									href="project-summary.html" target="_blank">더보기
										<i class="feather icon-arrow-right"></i>
								</a></span>
							</p>
							</div>
							<div class="card-content collapse show">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">First Name</th>
												<th scope="col">Last Name</th>
												<th scope="col">Username</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>Larry</td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div class="col-xl-4 col-lg-6">
					<div class="col-14">
						<div class="card">
                                <div class="card-header">
                                    <h3 class="content-header-title mb-0">진척도</h3>
                                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                </div>
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <div style="height: 178px;">
                                            <canvas id="simple-pie-chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
					</div>
				</div>

			</div>

			<!-- 두번째 끝 -->


		</div>
		

		<!-- Task Progress -->
	</div>
</div>
<script>
	const ctx = document.getElementById('simple-pie-chart').getContext('2d');
</script>
<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/chart.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/charts/chartjs/pie-doughnut/pie.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/charts/chartjs/pie-doughnut/pie-simple.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/charts/chartjs/pie-doughnut/doughnut.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/charts/chartjs/pie-doughnut/doughnut-simple.js"></script>
<!-- END: Page JS-->
