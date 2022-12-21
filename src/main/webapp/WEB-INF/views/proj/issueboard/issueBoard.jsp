<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
						<b>Issue Board</b>
					</h4>
				</div>
				<div class="card-content collapse show">
					<div class="card-body card-dashboard">
						<h1 style="font-family: 'MICEGothic Bold';">프로젝트 이슈 게시판입니다!</h1>
					</div>
					<div>
						<div><a href="/proj/issueInsert" class="mr-1 mb-1 btn btn-outline-secondary btn-min-width">이슈 등록 <i class="icon-pencil"></i></a></div>
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
						<table class="table table-striped table-bordered base-style table-hover">
							<thead>
									<tr role="row">
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
							
							<c:forEach var="vo" items="${vo}">
								<tr>
									<td>${vo.issueId}</td>
									<td><a href="/proj/issueDetail?issueTitle=${vo.issueTitle}">${vo.issueTitle }</a></td>
									<td>${vo.writer}</td>
									
									<td>
									<c:if test="${vo.issueStusCode eq '미해결' }">
										<span class="badge badge-warning">${vo.issueStusCode}</span>
									</c:if>
									<c:if test="${vo.issueStusCode eq '해결' }">
										<span class="badge badge-success">${vo.issueStusCode}</span>
									</c:if>
									</td>
									<td> <fmt:formatDate value="${vo.issueRgstDate}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
								
						</table>
						<div class="row">
                        <!-- 페이징 처리 버튼 시작 -->
                        <div class="col-sm-12 col-md-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="app-invoice-table_paginate">
                                <ul class="pagination"  style="text-align: center; float: right;">

                                    <!-- 이전 버튼 시작 -->
                                    <c:if test="${pageVO.prev }">
                                    <li class="paginate_button page-item previous" id="app-invoice-table_previous">
                                        <a href="/proj/issueboard?pageNum=${pageVO.pageNum - 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                    </li>
                                    </c:if>
                                    <!-- 이전 버튼 끝 -->
									
                                    <!-- 페이지 블록 시작 -->
                                    <!-- 현재페이지 -->
                                    <c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
                                    <c:choose>
                                    <c:when test="${pageVO.pageNum eq num }">
	                                    <li class="paginate_button page-item active">
	                                        <a href="/proj/issueboard?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
	                                    </li>
                                    </c:when>
                                    <c:otherwise>
                                    	<li class="paginate_button page-item">
	                                        <a href="/proj/issueboard?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
	                                    </li>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                    <!-- 페이지 블록 끝 -->

                                    <!-- 다음 버튼 시작 -->
                                    <c:if test="${pageVO.next }">
                                    <li class="paginate_button page-item next" id="app-invoice-table_next">
                                        <a href="/proj/issueboard?pageNum=${pageVO.pageNum + 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="6" tabindex="0" class="page-link">Next</a>
                                    </li>
                                    </c:if>
                                    <!-- 다음 버튼 끝 -->

                                </ul>
                            </div>
                        </div>
                        <!-- 페이징 처리 버튼 끝 -->
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

