<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%-- <c:set var="contextPath" value="${pageContext.request.contextPath}"/> --%>
<%-- <c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/> --%>
<%-- <c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/> --%>

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
						<b>Free board</b>
					</h4>
				</div>
				<div class="card-content collapse show">
					<div class="card-body card-dashboard">
						<h1 style="font-family: 'MICEGothic Bold';">프로젝트 자유 게시판</h1>
					</div>
					<div>
						<div><a href="/proj/freeBoardInsert" class="mr-1 mb-1 btn btn-outline-secondary btn-min-width">글 쓰기 <i class="icon-pencil"></i></a></div>
						<div
							style="float: right; padding-right: 10px; padding-bottom: 10px;"
							class="input-group col-3">
							<input type="text"
								class="form-control form-control-xl input-xl border-grey border-lighten-1 "
								name="keyword">
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
							<thead>
								<tr role="row">
									<sec:authorize access="hasRole('ROLE_PROJECT_LEADER' )">
										<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending"
										style="width: 5px;">선택</th>
									</sec:authorize>
										<th class="sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										aria-label="Name: activate to sort column ascending"
										style="width: 5px;">글번호</th>
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
										style="width: 250px;">작성일자</th>
									
<%-- 									<sec:authorize access="hasRole('ROLE_MEMBER')"> --%>
<!-- 									<th class="sorting" tabindex="0" -->
<!-- 										aria-controls="DataTables_Table_0" rowspan="1" colspan="1" -->
<!-- 										aria-label="Name: activate to sort column ascending" -->
<!-- 										style="width: 5px;">글번호</th> -->
<!-- 									<th class="sorting" tabindex="0" -->
<!-- 										aria-controls="DataTables_Table_0" rowspan="1" colspan="1" -->
<!-- 										aria-label="Position: activate to sort column ascending" -->
<!-- 										style="width: 450px;">제목</th> -->
<!-- 									<th class="sorting" tabindex="0" -->
<!-- 										aria-controls="DataTables_Table_0" rowspan="1" colspan="1" -->
<!-- 										aria-label="Office: activate to sort column ascending" -->
<!-- 										style="width: 30px;">작성자</th> -->
<!-- 									<th class="sorting" tabindex="0" -->
<!-- 										aria-controls="DataTables_Table_0" rowspan="1" colspan="1" -->
<!-- 										aria-label="Age: activate to sort column ascending" -->
<!-- 										style="width: 250px;">작성일자</th> -->
<%-- 									</sec:authorize> --%>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="freeboardVO" items="${freeSelect}">
								<tr>
								<sec:authorize access="hasRole('ROLE_PROJECT_LEADER' )">
									<td><input type='checkbox' id="ckbox" name="ckbox" data-projBdId="${freeboardVO.projBdId}" value="${freeboardVO.projBdId}"></td>
								</sec:authorize>
									<td>${freeboardVO.projBdId}</td>
									<td style="text-align:left;"><a href="/proj/freeBoardDetail?projBdId=${freeboardVO.projBdId}">${freeboardVO.projBdTitle}</a></td>
									<td>${freeboardVO.writer}</td>
									<td><fmt:formatDate value="${freeboardVO.projBdWriteDate}"
										pattern="yyyy-MM-dd"/></td>
								</tr>
								</c:forEach>
								
<%-- 								<sec:authorize access="hasRole('ROLE_MEMBER')"> --%>
<%-- 								<c:forEach var="freeboardVO" items="${freeSelect}"> --%>
<!-- 								<tr> -->
<%-- 									<td>${freeboardVO.projBdId}</td> --%>
<%-- 									<td style="text-align:left;"><a href="/proj/freeBoardDetail?projBdId=${freeboardVO.projBdId}">${freeboardVO.projBdTitle}</a></td> --%>
<%-- 									<td>${freeboardVO.writer}</td> --%>
<%-- 									<td><fmt:formatDate value="${freeboardVO.projBdWriteDate}" --%>
<%-- 										pattern="yyyy-MM-dd"/></td> --%>
<!-- 								</tr> -->
<%-- 								</c:forEach> --%>
<%-- 								</sec:authorize> --%>
						</table>

						<div class="row">
							<div class="col-sm-12 col-md-7">
								<div style="float: left; padding-left:40px;">
									<button type="button" class="btn" id="selectDel" style="background-color:#546E7A; color:white;">
										삭제
									</button>
								</div>
								<div class="dataTables_paginate paging_simple_numbers"
									id="DataTables_Table_0_paginate" style="float:right;">
									<ul class="pagination">
										<c:if test="${pageVO.prev}">
										<li class="paginate_button page-item previous"
											id="DataTables_Table_0_previous"><a href="/proj/freeboard?pageNum=${pageVO.startPage-5}&amount=${pageVO.amount}"
											aria-controls="DataTables_Table_0" data-dt-idx="0"
											tabindex="0" class="page-link">이전</a></li>
										</c:if>
										
										<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
										<c:choose>
										<c:when test="${pageVO.pageNum eq num}">
											<li class="paginate_button page-item active">
												<a href="/proj/freeboard?pageNum=${num}&amount=${pageVO.amount}" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button page-item">
												<a href="/proj/freeboard?pageNum=${num}&amount=${pageVO.amount}" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
											</li>
										</c:otherwise>
										</c:choose>
										</c:forEach>
										<c:if test="${pageVO.next}">
										<li class="paginate_button page-item next"
											id="DataTables_Table_0_previous"><a href="/proj/freeboard?pageNum=${pageVO.startPage+5}&amount=${pageVO.amount}"
											aria-controls="DataTables_Table_0" data-dt-idx="0"
											tabindex="0" class="page-link">다음</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
<%-- 						<input type="hidden" name="memEmail" value="<sec:authentication property="principal.username"/>"/> --%>
<%-- 						<input type="hidden" name="memCode" value="${mvo.member.memCode}"/> --%>
<%-- 						<input type="hidden" name="" value="${mvo.member}"/> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

$(function(){

	// 선택 삭제 ---------------------------
	$("#selectDel").on("click",function(){
		
		var confirmDel = confirm("선택한 글을 삭제하시겠습니까?");

		if(confirmDel) {
			
			var ckArr = new Array();

			$("input[id='ckbox']:checked").each(function(){
				ckArr.push($(this).attr("data-projBdId"));
			});

			$.ajax({
				url: "/proj/deleteSelFree",
				type: "post",
				data: {ckbox : ckArr},
				beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	 			},
				success: function(result){
					if(result == 1) {
						alert("삭제하였습니다.")
						location.href = "/proj/freeboard";
					} else {
						alert("삭제 실패");
					}
				}
			});	// ajax end
		} // if end

	}); // ---------------------------------

});

// 	function ckDel() {

// 		alert("삭제 눌렀다");

// 		let chArr = [];
// 		let queryString = "";

// 		$("input[name='ckbox']:checked").val((p_index, p_value) => {
// 			queryString += "projBdId=" + p_value + "&";
// 			console.log(queryString);
// 		});

// 		$.ajax({
// 			type: "get",
// 			url: ,
// 			data: queryString,
// 			dataType: "text",
// 			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
//                 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 		},
// 			success: function(result) {
// 				if(result == "OK") {
// 					alert("삭제하였습니다.");
// 					location.href = "/proj/freeboard";
// 				}
// 			},
// 			error : function(request, status, error) {
//             console.log("code: " + request.status)
//             console.log("message: " + request.responseText)
//             console.log("error: " + error);
// 			}
// 		}); // ajax end

// 	}

</script>


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

