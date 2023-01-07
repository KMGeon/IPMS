<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

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
<style>
.nav.nav-tabs.nav-underline .nav-item a.nav-link:before{
	background: #3F4E89;
}
.nav.nav-tabs.nav-underline .nav-item a.nav-link{
	color: #3F4E89;
}
</style>
<!-- END: Head-->
<!-- BEGIN: Body-->

<body>
	<!-- BEGIN: Content-->
	<section class="row all-contacts">
		<div class="col-12">
			<div class="card" style="width: 1000px;">
				<div class="card-content">
					<div class="card-body">
						<div class="row breadcrumbs-top" >
					        <div class="breadcrumb-wrapper col-12" >
					        	<ul class="nav nav-tabs nav-underline" role="tablist" style="color: #3F4E89;">
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link" id="baseIcon-tab21"  aria-controls="tabIcon21" href="/main/adminSvcNotice" role="tab" aria-selected="true"><i class="feather icon-volume-1"></i>공지사항 관리</a>
									</li>
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link" id="baseIcon-tab22"  aria-controls="tabIcon22" href="/main/adminSvcFaq" role="tab" aria-selected="false"><i class="feather icon-info"></i>자주묻는질문 관리</a>
									</li>
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link active" id="baseIcon-tab23"  aria-controls="tabIcon23" href="/main/adminSvcQaA" role="tab" aria-selected="false"><i class="feather icon-help-circle"></i>Q&A 관리</a>
									</li>
								</ul>
					        </div>
					    </div>
						<!-- Task List table -->
						<div class="table-responsive">
							<div>
								<br>
								<div style="float: right;">
									<div class="btn-group mr-1 mb-1" style="padding-right: 32px;">
										<button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">진행 여부 선택</button>
										<div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 42px, 0px);">
											<a class="dropdown-item" href="#">응답중</a> 
											<a class="dropdown-item" href="#">응답완료</a>
										</div>
									</div>
								</div>
								<div class="bug-list-search" style="padding-bottom: 15px; width:950px;">
									<div class="bug-list-search-content">
										<div class="sidebar-toggle d-block d-lg-none">
											<i class="feather icon-menu font-large-1"></i>
										</div>
										<form action="#">
											<div class="position-relative">
												<input type="search" id="search-contacts"
													class="form-control" placeholder="검색어를 입력해주세요." style="width: 300px; float: right;">
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
								style="width: 945px;">
								<colgroup>
							    	<col width="5%" />
							        <col width="5%" />
							        <col width="50%" />
							        <col width="10%" />
							        <col width="10%" />
							        <col width="15%" />
							        <col width="15%" />
					 		   </colgroup>
								<thead style="background: #3F4E89; color: white;">
									<tr>
										<th>선택</th>
										<th>Q&A 번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>답변 유무</th>
										<th>등록 일자</th>
										<th>답변 일자</th>
									</tr>
								</thead>
								<tbody>
									<!-- 리스트 조회 시작 -->
                                    <c:forEach var="adminSvcQaA" items="${adminSvcQaASelect}" varStatus="stat">
                                    <tr role="row" class="odd">
										<td> <!-- 선택 -->
											<input type='checkbox' id="ckbox" name="ckbox" value="">
										</td>
                                        <td style="padding-left: 35px;"> <!-- Q&A 번호 -->
                                            ${stat.count}
                                        </td>
                                        <td> <!-- 제목 --> 
                                            <b><a href="javascript:f_qnaDetail('${adminSvcQaA.qnaNum}')" style="color: #455DBD;">${adminSvcQaA.qnaTitle}</a></b>
                                        </td>
                                        <td> <!-- 작성자 -->
                                            ${adminSvcQaA.writer}
                                        </td> 
                                        <td style=""> <!-- 답변 유무 -->
                                        	<c:if test="${adminSvcQaA.qnaStatus eq '응답중'}">
                                            <span class="badge badge-danger">${adminSvcQaA.qnaStatus}</span>
                                            </c:if>
                                        	<c:if test="${adminSvcQaA.qnaStatus eq '응답완료'}">
                                            <span class="badge badge-secondary">${adminSvcQaA.qnaStatus}</span>
                                            </c:if>
                                            <!-- <span class="badge badge-success">${adminSvcQaA.qnaStatus}</span> -->
                                        </td>
                                        <td> <!-- 등록 일자 -->
                                            <fmt:formatDate value="${adminSvcQaA.qnaWriteDate}" pattern="yyyy-MM-dd"/> 
                                        </td>
                                        <td> <!-- 답변 일자 -->
                                            <fmt:formatDate value="${adminSvcQaA.qnaWriteDate}" pattern="yyyy-MM-dd"/> 
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <!-- 리스트 조회 끝 -->
								</tbody>
							</table>
							<div class="row" style="padding-top: 20px; margin: auto;">
								<div class="col-sm-12 col-md-7">
									<div style="float: left; padding-left:7px;">
										<button type="button" class="btn btn-secondary btn-sm"
											style="background-color: #546E7A; color: white;" id="chkDeleteBtn">삭제</button>
									</div>
									<div class="dataTables_paginate paging_simple_numbers" id="app-invoice-table_paginate" style="padding-left: 400px;">
										<ul class="pagination">
											<!-- 이전 버튼 시작 -->
											<c:if test="${pageVO.prev }">
											<li class="paginate_button page-item previous" id="app-invoice-table_previous">
												<a href="/main/adminSvcQaA?pageNum=${pageVO.pageNum - 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="0" tabindex="0" class="page-link" style="width:50px;">이전</a>
											</li>
											</c:if>
											<!-- 이전 버튼 끝 -->
											
											<!-- 페이지 블록 시작 -->
											<!-- 현재페이지 -->
											<c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
											<c:choose>
											<c:when test="${pageVO.pageNum eq num }">
												<li class="paginate_button page-item active">
													<a href="/main/adminSvcQaA?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="paginate_button page-item">
													<a href="/main/adminSvcQaA?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
												</li>
											</c:otherwise>
											</c:choose>
											</c:forEach>
											<!-- 페이지 블록 끝 -->
		
											<!-- 다음 버튼 시작 -->
											<c:if test="${pageVO.next }">
											<li class="paginate_button page-item next" id="app-invoice-table_next">
												<a href="/main/adminSvcQaA?pageNum=${pageVO.pageNum + 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="6" tabindex="0" style="width:50px;" class="page-link">다음</a>
											</li>
											</c:if>
											<!-- 다음 버튼 끝 -->
		
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
	
	<script>
		function f_qnaDetail(param) {
			let v_open = "/main/adminPopUp/adminSvcQaADetail?qnaNum="+param;

			let v_option = "width=750, height=800, top=100px, left=450px, scrollbars=yes";
		
			window.open(v_open, "Q&A 조회", v_option);
			
		}

	</script>

</body>
<!-- END: Body-->

</html>