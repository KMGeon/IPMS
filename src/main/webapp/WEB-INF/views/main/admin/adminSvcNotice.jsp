<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
										<td><span class="badge badge-success"><fmt:formatDate value="${noticeList.siteNtWriteDate}" pattern="yyyy-MM-dd" /></span></td>
									</tr>
								
								</c:forEach>
								</tbody>
							</table>
							<div class="row" style="padding-top: 20px; margin: auto;">
								<div class="col-sm-12 col-md-7">
									<div style="float: left;">
										<button type="button" class="btn"
											style="background-color: #546E7A; color: white;" id="chkDeleteBtn">삭제</button>
									</div>
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate" style="padding-left: 400px;">
										<ul class="pagination">
										<c:if test="${pageVO.prev }">
											<li class="paginate_button page-item previous disabled"
												id="DataTables_Table_0_previous"><a href="#"
												aria-controls="DataTables_Table_0" data-dt-idx="0"
												tabindex="0" class="page-link">Previous</a></li>
										</c:if>
										 <c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
										 	<c:choose>
	                                    	<c:when test="${pageVO.pageNum eq num }">
												<li class="paginate_button page-item active"><a href="/main/adminSvcNotice?pageNum=${num}&amount=${pageVO.amount}"
													aria-controls="DataTables_Table_0" data-dt-idx="1"
													tabindex="0" class="page-link">${num}</a></li>
											</c:when>
                                    			<c:otherwise>
                                    				<li class="paginate_button page-item "><a href="/main/adminSvcNotice?pageNum=${num}&amount=${pageVO.amount}"
													aria-controls="DataTables_Table_0" data-dt-idx="2"
													tabindex="0" class="page-link">${num}</a></li>
                                    			</c:otherwise>
	                                  	  </c:choose>
	                                    </c:forEach>
										<c:if test="${pageVO.next }">
		                               
			                                    <li class="paginate_button page-item next"
													id="DataTables_Table_0_next"><a href="/main/adminSvcNotice?pageNum=${pageVO.pageNum + 1}&amount=${pageVO.amount}"
													aria-controls="DataTables_Table_0" data-dt-idx="7"
													tabindex="0" class="page-link">Next</a></li>
		                                   
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