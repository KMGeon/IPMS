<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#searchBtn {
  	height: 33px; /* height of the input field */
    line-height: 2px;
	}
	#seachCategory{
	height: 30px;
	}
</style>

    <div class="card" style="width: 1000px">
        <div class="card-body">
        	<div class="row breadcrumbs-top" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
		        <div class="breadcrumb-wrapper col-12">
		            <ol class="breadcrumb" style="position: relative;margin-right: 15px; font-size: 25px;">
		                <li class="breadcrumb-item" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">공지사항</li>
		            </ol>
		        </div>
		    </div>
            <!-- datatable started -->
            <div id="app-invoice-wrapper" class="">
                <div id="app-invoice-table_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                    	<div class="col-sm-12 col-md-7"></div>
                    	
                        <div class="col-sm-12 col-md-5">
                        	
                            <div id="app-invoice-table_filter" class="dataTables_filter"><label style="float: right">
                            <select class="selectpicker" id="seachCategory">
								<option value="title">제목</option>
								<option value="cts">내용</option>
							</select>
                            <input type="search" class="form-control form-control-sm" id="search-contacts"
                                    aria-controls="app-invoice-table">
                                   <button type="button" id="searchBtn" class="btn btn-secondary">검색</button>
                                   </label>
                                    </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="app-invoice-table" class="table dataTable no-footer dtr-column"
                                   style="width: 100%;" role="grid" aria-describedby="app-invoice-table_info">
                                <thead class="border-bottom border-dark">
                                <tr role="row">
                                    <th class="control sorting_disabled" rowspan="1" colspan="1"
                                        style="width: 13.776px; display: none;" aria-label=""></th>
                                   
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1" style="width: 108.7161px;" aria-label="
						              Invoice#
						            : activate to sort column ascending">
                                        <span class="align-middle">번호</span>
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1"
                                        style="width: 221.966px;"
                                        aria-label="Amount: activate to sort column ascending">제목
                                    </th>
                                   
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1" style="width: 120.9922px;"
                                        aria-label="Customer: activate to sort column ascending">작성자
                                    </th>
                                    <th class="sorting" tabindex="0" aria-controls="app-invoice-table" rowspan="1"
                                        colspan="1" style="width: 119.753px;text-align: center;"
                                        aria-label="Tags: activate to sort column ascending">날짜
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="noticeList" varStatus="stat">
                                <tr role="row" class="odd">
                                    <td class=" control" tabindex="0" style="display: none;"></td>
                                    <td>
                                        ${stat.count}
                                    </td>
                                    <td><span class="invoice-amount">
                                    	<a href="/main/svcNoticeDetail?siteNtNum=${noticeList.siteNtNum}">${noticeList.siteNtTitle}</a>
                                    </span></td>
                                    <td><span class="invoice-date">관리자</span></td>
                                    
                                    <td style="text-align: center;">
                                        <fmt:formatDate value="${noticeList.siteNtWriteDate}" pattern="yyyy-MM-dd" />
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                    
                        <div class="col-sm-12 col-md-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="app-invoice-table_paginate">
                                <ul class="pagination">
                                	<c:if test="${pageVO.prev }">
                                    <li class="paginate_button page-item previous disabled"
                                        id="app-invoice-table_previous"><a href="/main/svcNotice?pageNum=${num-1}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}" aria-controls="app-invoice-table"
                                                                           data-dt-idx="0" tabindex="0"
                                                                           class="page-link">Previous</a></li>
                                    </c:if>
                                    <c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
                                    <c:choose>
	                                <c:when test="${pageVO.pageNum eq num }">
                                    <li class="paginate_button page-item active"><a href="/main/svcNotice?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}"
                                                                                    aria-controls="app-invoice-table"
                                                                                    data-dt-idx="1" tabindex="0"
                                                                                    class="page-link">${num}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li class="paginate_button page-item"><a href="/main/svcNotice?pageNum=${num}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}"
                                                                                    aria-controls="app-invoice-table"
                                                                                    data-dt-idx="1" tabindex="0"
                                                                                    class="page-link">${num}</a></li>	
                                    </c:otherwise>
	                                  	 </c:choose>
                                    </c:forEach>
                                    <c:if test="${pageVO.next }">
                                    <li class="paginate_button page-item next" id="app-invoice-table_next">
											<a href="/main/svcNotice?pageNum=${num+1}&amount=${pageVO.amount}&keyword=${keyword}&category=${category}" aria-controls="app-invoice-table" data-dt-idx="6"
											tabindex="0" class="page-link">Next</a>
										</li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    $("#searchBtn").on("click",function(){
		let keyword = $("#search-contacts").val();
		let category = $("#seachCategory").val();
		location.href = '?keyword='+keyword+'&category='+category;
	});
    </script>