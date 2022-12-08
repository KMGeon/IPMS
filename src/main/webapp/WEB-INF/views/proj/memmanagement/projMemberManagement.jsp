<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
td {
	padding-right: 53px;
	text-align: center;
}
.card-content{
	overflow: auto;
}
</style>
<h3 class="text-uppercase">
	<b>프로젝트 멤버 관리</b>
</h3>
<div class="content-wrapper">

	<div class="content-body">
		<!-- Shopping cards section start -->
		<div class="container-fluid" >
			<div class="row" style="height: 70px;">
				<div class="col-6  mt-3 mb-1 " style="height: 30px;">
					<h3 class="text-uppercase ml-5">
						<b>프로젝트 멤버</b>
					</h3>
				</div>
				<div class="col-4  mt-3 mb-1 ml-5" style="float: left;">
					<h3 class="text-uppercase">
						<b>하차 멤버</b>
					</h3>
				</div>
			</div>
			<div class="row" >
				<div class="col-lg-5 ml-5"  >
					<div class="card text-center" style="height: 300px;  width:670px; ">
						<div class="card-content" >
<!-- 							<div class="container-fluid" style="width: 100%; height: 100%"> -->
								<div class="table-responsive"  >
									<table id="recent-orders" 
										class="table table-hover mb-0 ps-container ps-theme-default">
										<thead>
											<tr>
												<th>회원명</th>
												<th>분야</th>
												<th>권한</th>
												<th>미완료 일감</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-truncate">박종환</td>
												<td class="text-truncate">백엔드</td>
												<td class="text-truncate">팀원</td>
												<td class="text-truncate"><span class="badge badge-success">10</span></td>
												<td class="text-truncate"><i class="fa fa-times"></i></td>
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
												<td class="text-truncate">PO-05521</td>
												<td class="text-truncate"><a href="#">INV-001012</a></td>
												<td class="text-truncate">Andrew D.</td>
												<td class="text-truncate"><span
													class="badge badge-success">Paid</span></td>
												<td class="text-truncate">$ 152.00</td>
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
												<td class="text-truncate">PO-05521</td>
												<td class="text-truncate"><a href="#">INV-001012</a></td>
												<td class="text-truncate">Andrew D.</td>
												<td class="text-truncate"><span
													class="badge badge-success">Paid</span></td>
												<td class="text-truncate">$ 152.00</td>
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
												<td class="text-truncate">PO-05521</td>
												<td class="text-truncate"><a href="#">INV-001012</a></td>
												<td class="text-truncate">Andrew D.</td>
												<td class="text-truncate"><span
													class="badge badge-success">Paid</span></td>
												<td class="text-truncate">$ 152.00</td>
											</tr>
											<tr>
												<td class="text-truncate">PO-05521</td>
												<td class="text-truncate"><a href="#">INV-001012</a></td>
												<td class="text-truncate">Andrew D.</td>
												<td class="text-truncate"><span
													class="badge badge-success">Paid</span></td>
												<td class="text-truncate">$ 152.00</td>
											</tr>

										</tbody>
									</table>
								</div>
<!-- 							</div> -->

						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-1" >
					<div class="card" style="height: 300px; width:670px; ">
						<div class="card-content"    >
<!-- 							<div class="container-fluid"> -->
							<div class="table-responsive"   >
								<table id="recent-orders"
									class="table table-hover mb-0 ps-container ps-theme-default" >
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
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
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
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
										</tr>
										<tr>
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
										</tr>

									</tbody>
								</table>
								</div>
<!-- 							</div> -->
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row" style="height: 70px;">
				<div class=" col-6  mt-3 mb-1 " style="height: 30p; display: flex;">
					<h3 class="text-uppercase ml-5">
						<b> 프로젝트 초대한 회원</b>
					</h3>
					<i onclick="letter()"
						style="float: right; width: 50%; text-align: right;"
						class="icon-envelope-open ml-5"></i>
				</div>
				<div class="col-4  mt-3 mb-1 ml-5" style="float: left;">
					<h3 class="text-uppercase">
						<b>하차 멤버</b>
					</h3>

				</div>
			</div>
			<div class="row">
				<div class="col-lg-5 ml-5">
					<div class="card text-center" style="height: 300px; width:670px;">
						<div class="card-content">
<!-- 								<div class="container-fluid"> -->
									<div class="table-responsive" >
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
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
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
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
										</tr>
										<tr>
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
										</tr>

									</tbody>
								</table>
								</div>
<!-- 								</div> -->
						</div>
					</div>
				</div>

				<div class="col-lg-5 offset-1">
					<div class="card" style="height: 300px; width:670px;">
						<div class="card-content" >
<!-- 								<div class="container-fluid"> -->
									<div class="table-responsive" >
								<table id="recent-orders"
									class="table table-hover mb-0 ps-container ps-theme-default" >
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
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
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
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
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
											<td class="text-truncate">PO-05521</td>
											<td class="text-truncate"><a href="#">INV-001012</a></td>
											<td class="text-truncate">Andrew D.</td>
											<td class="text-truncate"><span
												class="badge badge-success">Paid</span></td>
											<td class="text-truncate">$ 152.00</td>
										</tr>

									</tbody>
								</table>
								</div>
<!-- 								</div> -->
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- // Shopping cards section end -->
	</div>
</div>
<script>
	function letter() {
		location.href = "http://www.naver.com";
	}
</script>