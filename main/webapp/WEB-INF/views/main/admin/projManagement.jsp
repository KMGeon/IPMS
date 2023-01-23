<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
<title>관리자 페이지 - 프로젝트 관리</title>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

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
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
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
						<!-- Task List table -->
						<div class="table-responsive">
							<h3 style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">프로젝트 관리</h3>
							<br />
							<br>
							<div style="width:100%;">
								<div class="bug-list-search" style="float: left;padding-bottom: 15px; width:60%;">
									<div class="bug-list-search-content">
										<div class="sidebar-toggle d-block d-lg-none">
											<i class="feather icon-menu font-large-1"></i>
										</div>
										<form action="#">
											<div class="position-relative">
												<div class="row">
													<div style="width: 15px"></div>
														<select class="selectpicker" id="searchCategory">
															<option value="projName">프로젝트 명</option>
															<option value="memCode">프로젝트 생성자</option>
														</select>
													<div class="col-6">
														<input type="search" id="search-contacts"
														class="form-control" placeholder="Search">
													</div>
													<div class="col-2">
														<button type="button" class="btn btn-secondary" id="searchBtn">검색</button>
													</div>	
												</div>
											</div>
										</form>
									</div>
								</div>
								<div style="float: right;width:20%;">
									<div class="btn-group mr-1 mb-1" style="float: right;">
										<button type="button"
											class="btn btn-outline-secondary dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">진행 상태 정렬</button>
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
										<th><input type='checkbox' id="allCkbox" name="allCkbox">&nbsp;선택</th>
										<th>프로젝트 명</th>
										<th>프로젝트 생성자</th>
										<th>진행 여부</th>
<!-- 										<th>등록 일자</th> -->
										<th>시작 일자</th>
										<th>종료 일자</th>
									</tr>
								</thead>
								<tbody>
									<!-- 오늘 날짜 구해서 프로젝트 일자와 비교 후 프로젝트 진행 상황 출력 -->									
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
									<c:forEach var="ProjManaVO" items="${ProjManaVO}">
									<fmt:formatDate value="${ProjManaVO.projEndDate}" pattern="yyyy-MM-dd" var="endDate"/>
										<tr>
											<td><input type='checkbox' id="ckbox" name="ckbox"
												data-projId="${ProjManaVO.projId}" value="${ProjManaVO.projId}"></td>
											<td><b><a href="javascript:f_projInfo('${ProjManaVO.projId}')" style="color: #455DBD;">${ProjManaVO.projName}</a></b></td>
											<td>${ProjManaVO.memCode}</td>
											<c:if test="${endDate < today && ProjManaVO.deleteWhth eq 'n'}">
												<td><span class="badge badge-secondary">종료</span></td>
											</c:if>
											<c:if test="${endDate >= today && ProjManaVO.deleteWhth eq 'n'}">
												<td><span class="badge badge-primary" style="font-weight:bold;">진행중</span></td>
											</c:if>
											<c:if test="${ProjManaVO.deleteWhth eq 'y'}">
												<td><span class="badge badge-danger">중단</span></td>
											</c:if>
										
<%-- 											<td><fmt:formatDate value="${ProjManaVO.projCreatnDate}" pattern="yyyy-MM-dd" /></td> --%>
											<td><fmt:formatDate value="${ProjManaVO.projStrtDate}" pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${ProjManaVO.projEndDate}" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row" style="padding-top: 20px; margin: auto;">
								<div class="col-sm-12 col-md-7">
									<div style="float: left;">
										<button type="button" class="btn btn-danger btn-sm" id="selectDel"
											style="background-color: #546E7A; color: white;">삭제</button>
										<button type="button" class="btn btn-secondary btn-sm" id="ckRestoreProj"
											style="background-color: #546E7A; color: white;">복구</button>
									</div>
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate" style="padding-left: 400px;">
										<ul class="pagination">
										<c:if test="${pageVO.prev}">
										<li class="paginate_button page-item previous"
											id="DataTables_Table_0_previous"><a href="/main/projManagement?pageNum=${pageVO.startPage-5}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}"
											aria-controls="DataTables_Table_0" data-dt-idx="0"
											tabindex="0" class="page-link" style="width:50px;">이전</a></li>
										</c:if>
										
										<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
										<c:choose>
										<c:when test="${pageVO.pageNum eq num}">
											<li class="paginate_button page-item active">
												<a href="/main/projManagement?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button page-item">
												<a href="/main/projManagement?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
											</li>
										</c:otherwise>
										</c:choose>
										</c:forEach>
										<c:if test="${pageVO.next}">
										<li class="paginate_button page-item next"
											id="DataTables_Table_0_previous"><a href="/main/projManagement?pageNum=${pageVO.startPage+5}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}"
														
											aria-controls="DataTables_Table_0" data-dt-idx="0"
											tabindex="0" class="page-link" style="width:50px;">다음</a></li>
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

<script>

	function f_projInfo(param) {
		
		let v_open = "/main/adminProjDetail?projId="+param;
		
		let v_option = "width=700, height=855, top=80px, left=550px, scrollbars=yes";
		
		window.open(v_open, "프로젝트 정보", v_option);
		
	}
	
	// 검색
	$("#searchBtn").on("click",function(){
		let keyword = $("#search-contacts").val();
		let category = $("#searchCategory").val();
	//	let date = $("#searchDate").val();
		location.href = '?keyword='+keyword+'&category='+category;
	});
	
	$(function(){
		
		// 체크박스 전체 선택
		$("#allCkbox").on("click",function(){
			
			if($("#allCkbox").prop("checked")) {
			//	$("#ckbox").prop("checked", true);
				$("input[type=checkbox]").prop("checked",true);
			} else {
			//	$("#ckbox").prop("checked", false);
				$("input[type=checkbox]").prop("checked",false);
			}
		});

		// 선택 삭제 ---------------------------
		$("#selectDel").on("click",function(){
			
			var confirmDel = confirm("선택한 프로젝트를 삭제하시겠습니까?");

			if(confirmDel) {
				
				var ckArr = new Array();

				$("input[id='ckbox']:checked").each(function(){
					ckArr.push($(this).attr("data-projId"));
				});

				$.ajax({
					url: "/main/ckDelProj",
					type: "post",
					data: {ckbox : ckArr},
					beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		 			},
					success: function(result){
						if(result == 1) {
							alert("삭제하였습니다.")
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
				});	// ajax end
			} // if end
		});
			
		// 선택 복구 ---------------------------
		$("#ckRestoreProj").on("click",function(){
			
			var confirmDel = confirm("선택한 프로젝트를 복구하시겠습니까?");

			if(confirmDel) {
				
				var ckArr = new Array();

				$("input[id='ckbox']:checked").each(function(){
					ckArr.push($(this).attr("data-projId"));
				});

				$.ajax({
					url: "/main/ckRestoreProj",
					type: "post",
					data: {ckbox : ckArr},
					beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		 			},
					success: function(result){
						if(result == 1) {
							alert("복구하였습니다.")
							location.reload();
						} else {
							alert("복구 실패");
						}
					}
				});	// ajax end
			} // if end

		}); // ---------------------------------
		
	});
</script>

</body>
<!-- END: Body-->

</html>
