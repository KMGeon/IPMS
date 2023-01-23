<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/datatables.min.css">

<div class="content-body">
	<!-- Base style table -->
	<div class="row" style="text-align: center;">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">
						<b>NOTICE</b>
					</h4>
				</div>
				<div class="card-content collapse show">
					<div class="card-body card-dashboard">
						<h1>프로젝트 공지사항</h1>
					</div>
					<div>
						<c:if test="${authCheck eq 'true' }">
							<div><a href="/proj/${projId}/noticeInsert" class="mr-1 mb-1 btn btn-outline-secondary btn-min-width">글 쓰기 <i class="icon-pencil"></i></a></div>
						</c:if>
						<div
							style="float: right; padding-right: 10px; padding-bottom: 10px;"
							class="input-group col-3">
							<select class="selectpicker" id="searchCategory">
								<option value="projNtTitle">제목</option>
								<option value="projNtCts">내용</option>
							</select>
							<input type="text"
								class="form-control form-control-xl input-xl border-grey border-lighten-1" id="search-contacts">
							<span class="input-group-append" id="button-addon2">
								<button class="btn btn-secondary border-grey border-lighten-1"
									type="button" id="searchBtn">
									<i class="feather icon-search"></i>
								</button>
							</span>
						</div>
					</div>
					<div>
						<table class="table table-striped table-bordered base-style table-hover">
						<c:if test="${authCheck eq 'true' }">
						<colgroup>
					    	<col width="5%" />
					        <col width="5%" />
					        <col width="70%" />
					        <col width="10%" />
					        <col width="15%" />
					    </colgroup>
							<thead>
								<tr role="row">
										<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending">
										<input type='checkbox' id="allCkbox" name="allCkbox">&nbsp;전체 선택</th>
										<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending">번호</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Position: activate to sort column ascending">제목</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending">작성자</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending">작성일자</th>
								</tr>
							</thead>
						</c:if>
						<c:if test="${authCheck eq 'false' }">
						<colgroup>
					        <col width="10%" />
					        <col width="65%" />
					        <col width="10%" />
					        <col width="20%" />
					    </colgroup>
							<thead>
								<tr role="row">
										<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending">글번호</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Position: activate to sort column ascending">제목</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending">작성자</th>
									<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending">작성일자</th>
								</tr>
							</thead>
						</c:if>
							<tbody>
								<c:forEach var="noticeBoardVO" items="${ntSelect}" varStatus="stat">
								<tr>
									<c:if test="${authCheck eq 'true' }">
										<td><input type='checkbox' id="ckbox" name="ckbox" data-projNtNum="${noticeBoardVO.projNtNum}" value="${noticeBoardVO.projNtNum}"></td>
										<td>${stat.count}</td>
										<td style="text-align:left; color: #02b5b8;"><a href="/proj/${projId}/noticeBoardDetail?projNtNum=${noticeBoardVO.projNtNum}">${noticeBoardVO.projNtTitle}</a></td>
										<td>${noticeBoardVO.memCode}</td>
										<td><fmt:formatDate value="${noticeBoardVO.projNtWriteDate}"
											pattern="yyyy-MM-dd"/></td>
									</c:if>
									<c:if test="${authCheck eq 'false' }">
										<td>${stat.count}</td>
										<td style="text-align:left; color: #02b5b8;"><a href="/proj/${projId}/noticeBoardDetail?projNtNum=${noticeBoardVO.projNtNum}">${noticeBoardVO.projNtTitle}</a></td>
										<td>${noticeBoardVO.memCode}</td>
										<td><fmt:formatDate value="${noticeBoardVO.projNtWriteDate}"
											pattern="yyyy-MM-dd"/></td>
									</c:if>
								</tr>
								</c:forEach>
						</table>

						<div class="row">
							<div class="col-sm-12 col-md-7">
							<c:if test="${authCheck eq 'true' }">
								<div style="float: left; padding-left:67px;">
									<button type="button" class="btn btn-sm" id="selectDel" style="background-color:#546E7A; color:white;">
										선택 삭제
									</button>
								</div>
							</c:if>
								<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate" style="float:right; margin-right: 108px;">
									<ul class="pagination">
										<c:if test="${pageVO.prev}">
										<li class="paginate_button page-item previous"
											id="DataTables_Table_0_previous"><a href="/proj/${projId}/noticeBoard?pageNum=${pageVO.startPage-5}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}"
											aria-controls="DataTables_Table_0" data-dt-idx="0"
											tabindex="0" class="page-link">이전</a></li>
										</c:if>
										
										<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
										<c:choose>
										<c:when test="${pageVO.pageNum eq num}">
											<li class="paginate_button page-item active">
												<a href="/proj/${projId}/noticeBoard?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button page-item">
												<a href="/proj/${projId}/noticeBoard?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
											</li>
										</c:otherwise>
										</c:choose>
										</c:forEach>
										<c:if test="${pageVO.next}">
										<li class="paginate_button page-item next"
											id="DataTables_Table_0_previous"><a href="/proj/${projId}/noticeBoard?pageNum=${pageVO.startPage+5}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}"
											aria-controls="DataTables_Table_0" data-dt-idx="0"
											tabindex="0" class="page-link">다음</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<input type="hidden" name="memCode" value="<sec:authentication property='principal.member.memCode'/>"/>
						<input type="hidden" name="" value="${mvo.member}"/>
<!-- 						<input type="hidden" id="projId" name="projId"/> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

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
		
		var confirmDel = confirm("선택한 글을 삭제하시겠습니까?");

		if(confirmDel) {
			
			var ckArr = new Array();

			$("input[id='ckbox']:checked").each(function(){
				ckArr.push($(this).attr("data-projNtNum"));
			});

			$.ajax({
				url: "/proj/${projId}/deleteSelNt",
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

	}); // ---------------------------------

});


</script>

<script>

	$("#searchBtn").on("click",function(){
		let keyword = $("#search-contacts").val();
		let category = $("#searchCategory").val();
		location.href = '?keyword='+keyword+'&category='+category;
	});
</script>


<!-- BEGIN: Page Vendor JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/tables/datatables/datatable-styling.js"></script>
<!-- END: Page JS-->

<!-- END: Body-->

