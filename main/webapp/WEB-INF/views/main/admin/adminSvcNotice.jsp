<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
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
<style>
.nav.nav-tabs.nav-underline .nav-item a.nav-link:before{
	background: #3F4E89;
}
.nav.nav-tabs.nav-underline .nav-item a.nav-link{
	color: #3F4E89;
}
</style>
</head>
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
					        <div class="breadcrumb-wrapper col-12">
     					        <ul class="nav nav-tabs nav-underline" role="tablist" style="color: #3F4E89;">
									 <c:if test="${page eq 'faq'}">
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link" id="baseIcon-tab21" aria-controls="tabIcon21" href="/main/adminSvcNotice" role="tab" aria-selected="false"><i class="feather icon-volume-1"></i>공지사항 관리</a>
									</li>
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link active" id="baseIcon-tab22" aria-controls="tabIcon22" href="/main/adminSvcFaq" role="tab" aria-selected="true"><i class="feather icon-info"></i>자주묻는질문 관리</a>
									</li>
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link" id="baseIcon-tab23" aria-controls="tabIcon23" href="/main/adminSvcQaA" role="tab" aria-selected="false"><i class="feather icon-help-circle"></i>Q&A 관리</a>
									</li>
								</c:if>
								<c:if test="${page eq 'notice'}">
								<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link active" id="baseIcon-tab21" aria-controls="tabIcon21" href="/main/adminSvcNotice" role="tab" aria-selected="false"><i class="feather icon-volume-1"></i>공지사항 관리</a>
									</li>
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link" id="baseIcon-tab22" aria-controls="tabIcon22" href="/main/adminSvcFaq" role="tab" aria-selected="true"><i class="feather icon-info"></i>자주묻는질문 관리</a>
									</li>
									<li class="nav-item" style="border-bottom: 1px solid #3F4E89;color: #3F4E89;">
									<a class="nav-link" id="baseIcon-tab23" aria-controls="tabIcon23" href="/main/adminSvcQaA" role="tab" aria-selected="false"><i class="feather icon-help-circle"></i>Q&A 관리</a>
									</li>
								</c:if>
								</ul>
					        </div>
					    </div>
						<!-- Task List table -->
						<div class="table">
							<div>
								<br>
								<div class="bug-list-search" style="padding-bottom: 15px; width:1115px;">
									<div class="bug-list-search-content">
										<div class="sidebar-toggle d-block d-lg-none">
											<i class="feather icon-menu font-large-1"></i>
										</div>
										<form action="#">
											<div class="position-relative">
												<div class="row">
													<div style="width: 15px"></div>
														<select class="selectpicker" id="seachCategory">
															<option value="title">제목</option>
															<option value="cts">내용</option>
														</select>
													
													<div class="col-4">
														<input type="search" id="search-contacts"
														class="form-control" placeholder="Search">
													</div>
													<div class="col-3">
														<input type="date" class="form-control" id="searchDate">
													</div>
													<div class="col-1">
														<button type="button" class="btn btn-secondary" id="searchBtn">검색</button>
													</div>	
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
							    	<col width="10%" />
							        <col width="10%" />
							        <col width="50%" />
							        <col width="30%" />
					 		   </colgroup>
								<thead style="background: #3F4E89; color: white;">
									<tr>
										<th>선택</th>
										<th>공지사항 번호</th>
										<th>제목</th>
										<th>등록일자</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${list}" var="noticeList" varStatus="stat">
									<tr>
										<td><input type='checkbox' id="ckbox" class="ckbox" name="ckbox" value="${noticeList.siteNtNum}"></td>
										<td>${stat.count}</td>
										<td><b><a href="/main/adminSvcNoticeDetail?siteNtNum=${noticeList.siteNtNum}" style="color: #455DBD;">${noticeList.siteNtTitle}</a></b>
										</td>
										<td><fmt:formatDate value="${noticeList.siteNtWriteDate}" pattern="yyyy-MM-dd" /></span></td>
									</tr>
								
								</c:forEach>
								</tbody>
							</table>
							<div class="row" style="padding-top: 20px; margin: auto;">
								<div class="col-sm-12 col-md-7">
									<div style="float: left; padding-left:7px;">
										<button type="button" class="btn btn-secondary btn-sm"
											style="background-color: #546E7A; color: white;" id="chkDeleteBtn">삭제</button>
									</div>
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate" style="padding-left: 400px;">
										<ul class="pagination">
										<c:if test="${pageVO.prev }">
											<li class="paginate_button page-item previous disabled"
												id="DataTables_Table_0_previous"><a href="/main/adminSvcNotice?pageNum=${pageVO.pageNum - 1}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}&searchDate=${date}"
												aria-controls="DataTables_Table_0" data-dt-idx="0"
												tabindex="0" class="page-link">이전</a></li>
										</c:if>
										 <c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
										 	<c:choose>
	                                    	<c:when test="${pageVO.pageNum eq num }">
												<li class="paginate_button page-item active"><a href="/main/adminSvcNotice?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}&searchDate=${date}"
													aria-controls="DataTables_Table_0" data-dt-idx="1"
													tabindex="0" class="page-link">${num}</a></li>
											</c:when>
                                    			<c:otherwise>
                                    				<li class="paginate_button page-item "><a href="/main/adminSvcNotice?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}&searchDate=${date}"
													aria-controls="DataTables_Table_0" data-dt-idx="2"
													tabindex="0" class="page-link">${num}</a></li>
                                    			</c:otherwise>
	                                  	  </c:choose>
	                                    </c:forEach>
										<c:if test="${pageVO.next }">
		                               
			                                    <li class="paginate_button page-item next"
													id="DataTables_Table_0_next"><a href="/main/adminSvcNotice?pageNum=${pageVO.pageNum + 1}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}&searchDate=${date}"
													aria-controls="DataTables_Table_0" data-dt-idx="7"
													tabindex="0" class="page-link">다음</a></li>
		                                   
                                    	</c:if>
											
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
	<script type="text/javascript">
			
			$("#searchBtn").on("click",function(){
				let keyword = $("#search-contacts").val();
				let category = $("#seachCategory").val();
				let date = $("#searchDate").val();
				location.href = '?keyword='+keyword+'&category='+category+"&searchDate="+date;
			});
	
	
			$("#chkDeleteBtn").on("click",function(){
				var param = [];
				var storeOrder=[];
				
				if($('.ckbox:checked').length==0){
					alert("선택한 게시물이 없습니다.");
				}else{
					$(".ckbox:checked").each(function(i) {
					 
					    storeOrder = {
					    	"siteNtNum"	: $(this).val()
					    };
					   
				    	//param 배열에 storeOrder 오브젝트를 담는다.
					      param.push(storeOrder);
					  });
					
				}
				$.ajax({
					 type : 'post',           // 타입 (get, post, put 등등)
					    url : '/main/adminSvcNoticeChkDelete',           // 요청할 서버url
					    contentType : "application/json; charset=utf-8",
					    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
					    data : JSON.stringify(param),
					    beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					  	},
					    success : function(result) { // 결과 성공 콜백함수
					        console.log(result);
					    	location.reload();
					    }
				});
				}
			);
	</script>
</body>
<!-- END: Body-->

</html>