<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>고객센터 - Q&A</title>
<div class="content-wrapper" style="">


    <div class="card" style="width: 1000px">
        <div class="card-body">
        	<div class="row breadcrumbs-top" >
		        <div class="breadcrumb-wrapper col-12">
		            <ol class="breadcrumb" style="position: relative;margin-right: 15px; font-size: 25px;">
		                <li class="breadcrumb-item">Q&A</li>
		            </ol>
		        </div>
		    </div>
            <!-- datatable started -->
            <div id="app-invoice-wrapper" class="">
                <div id="app-invoice-table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                        <div class="col-8"></div>
                        <div class="col-4">
                            <div style="float: left;">
                                <fieldset class="form-group position-relative">
                                    <input type="text" class="form-control form-control-xl input-xl" id="iconLeft1" style="width: 242px;" placeholder="검색어를 입력하세요.">
                                </fieldset>
                            </div>
                            <div style="float: right;">
                                <button type="button" class="btn btn-secondary btn-block" >검색</button>
                            </div>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="app-invoice-table" class="table dataTable no-footer dtr-column"
                                   style="width: 100%;" role="grid" aria-describedby="app-invoice-table_info">
                                <thead class="border-bottom border-dark">
                                <tr role="row">
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1" colspan="1" style="width: 95.7161px;" aria-label="Invoice#: activate to sort column ascending">
                                        <span class="align-middle">번호</span>
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1" colspan="1" style="width: 181.966px; text-align: left;" >제목</th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1" colspan="1" style="width: 91.9922px; text-align: center;" >작성자</th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1" colspan="1" style="width: 91.9922px; text-align: center;" >답변 상태</th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1" colspan="1" style="width: 119.753px; text-align: center;" >등록 일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <!-- 리스트 조회 시작 -->
                                    <c:forEach var="svcQaA" items="${svcQaASelect}" varStatus="stat">
                                    <tr role="row" class="odd">
                                        <td style="padding-left: 40px;">
                                            ${stat.count}
                                        </td>
                                        <td>
                                            <a href="/main/svcQaADetail?qnaNum=${svcQaA.qnaNum}">${svcQaA.qnaTitle}</a>
                                        </td>
                                        <td style="text-align: center;">
                                            ${svcQaA.writer}
                                        </td>
                                        <td style="text-align: center;">
                                            ${svcQaA.qnaStatus}
                                        </td>
                                        <td style="padding-left: 60px">
                                            <fmt:formatDate value="${svcQaA.qnaWriteDate}" pattern="yyyy-MM-dd"/> 
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <!-- 리스트 조회 끝 -->
                                </tbody>
                            </table>
                            <a href="/main/svcQaAInsertForm" type="button" class="btn btn-secondary btn-block" style="width: 12%; float: right;">Q&A 등록하기</a>
                        </div>
                    </div>
                    <div class="row">
                        <!-- 페이징 처리 버튼 시작 -->
                        <div class="col-sm-12 col-md-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="app-invoice-table_paginate">
                                <ul class="pagination">

                                    <!-- 이전 버튼 시작 -->
                                    <c:if test="${pageVO.prev }">
                                    <li class="paginate_button page-item previous" id="app-invoice-table_previous">
                                        <a href="/main/svcQaA?pageNum=${pageVO.pageNum - 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                    </li>
                                    </c:if>
                                    <!-- 이전 버튼 끝 -->
									
                                    <!-- 페이지 블록 시작 -->
                                    <!-- 현재페이지 -->
                                    <c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
                                    <c:choose>
                                    <c:when test="${pageVO.pageNum eq num }">
	                                    <li class="paginate_button page-item active">
	                                        <a href="/main/svcQaA?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
	                                    </li>
                                    </c:when>
                                    <c:otherwise>
                                    	<li class="paginate_button page-item">
	                                        <a href="/main/svcQaA?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
	                                    </li>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                    <!-- 페이지 블록 끝 -->

                                    <!-- 다음 버튼 시작 -->
                                    <c:if test="${pageVO.next }">
                                    <li class="paginate_button page-item next" id="app-invoice-table_next">
                                        <a href="/main/svcQaA?pageNum=${pageVO.pageNum + 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="6" tabindex="0" class="page-link">Next</a>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
<script>


</script>
