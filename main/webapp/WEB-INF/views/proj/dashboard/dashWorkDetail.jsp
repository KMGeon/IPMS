<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
	
<!-- BEGIN: Head-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/dashTaskCmt.js"></script>

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->
<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
</script>

	<!-- BEGIN: Content-->
	<div class="content-wrapper">
		<div class="content-body">
			<!-- App invoice wrapper -->
			<section class="app-invoice-wrapper">
				<div class="row justify-content-md-center">
					<div style="width: 1200px;">
						<!-- using a bootstrap card -->
						<div class="card">
							<!-- card body -->
							<div class="card-body p-2">
								<!-- card-header -->
								<div class="card-header px-0">
									<div >
										<div style="display:none;" class="col-md-12 col-lg-7 col-xl-4 mb-50">
											<span id="" class="invoice-id font-weight-bold">No. </span> <span id="taskId" >${list.taskId}</span>
										</div>
											<div class="d-flex align-items-center justify-content-end justify-content-xs-start">
												<div style="float: right;" class="issue-date pr-2 col-3">
													<span>일감 일정  : <fmt:formatDate value="${list.taskStrtDate}" pattern="yyyy-MM-dd"/></span> ~
													<span>  <fmt:formatDate value="${list.taskEndDate}" pattern="yyyy-MM-dd"/></span>
												</div>
											</div>
										작성자 : <span>${list.memCode}</span>
									</div>
								</div>

								<!-- invoice logo and title -->
								<div class="invoice-logo-title py-2">
									<div class="col-8  align-items-start row">
										<h2  style="font-family: 'MICEGothic Bold';">${list.taskTitle}</h2>&nbsp;&nbsp;&nbsp;
											<c:if test="${list.taskStusCode == 'primary' }">
												<span style="margin-top:4px;" class="badge badge-warning">낮음</span>
											</c:if>
											<c:if test="${list.taskStusCode == 'danger' }">
												<span style="margin-top:4px;" class="badge badge-danger">높음</span>
											</c:if>
											<c:if test="${list.taskStusCode == 'secondary' }">
												<span style="margin-top:4px;" class="badge badge-success">일반</span>
											</c:if>
									</div><br/>
								<div>진척도 : ${list.taskPgres}%</div>
								</div>
								<hr>
								<!-- 몰라서 일단 만들어만 놓음.... 클릭하면 일감 이동..?? -->

								<!-- 글 내용 -->
								<div class="row invoice-adress-info py-2">
									<div class="col-6 mt-1 from-info">
											${list.taskCts}
									</div>
								</div>
								<hr>
								<div style="float: right;">
										
									<a href="/proj/${list.projId}/taskList" class="btn btn-primary"><i class="fa fa-reply-all mr-25 common-size"></i>목록</a>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-2" style="width: 1200px; height: auto;">
						<div class="card-body">
							<div>
								<form class="form-horizontal">
									<div class="row">
										<div class='col-sm-10'>
											<input type="text" class="form-control" id="taskCmtCts" name="taskCmtCts" placeholder="댓글을 입력하세요." />
										</div>
										<div class='col-sm-2'>
											<button type="button" class="btn btn-secondary" style="width: 150px;" id="repAdd">댓글 등록</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="card mb-2 card border-top-info border-top-2 box-shadow-0" style="width: 1200px; height: auto;">
						<div class="card-header"
							style="padding: 13px; color: #455A64; font-size: 15px;"> Comments&nbsp;<i class="fa fa-comment fa"></i>
						</div>
						<div class="card-body" id="repListAdd">
						<!-- 댓글 시작 -->
							 <c:forEach var="icmtList" items="${cmtList}">
							 		<c:if test="${icmtList.highCmtId eq null}">
								 		<!-- //상위 댓글 시작 -->
										<form style="padding-bottom:10px;" class="form-horizontal" id="highmodifydiv${icmtList.taskCmtId}">
								            <div class="user-block">
								              <div>
								                  <div style="padding-bottom: 5px;">
								                      <div style="font-size:15px;"><i class="fa fa-user-o"></i>&nbsp;&nbsp;${icmtList.writer }</div>
								                    <span class="username"> 
								                      <span style="font-size: 8px; color: grey;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${icmtList.taskCmtWriteDate}"/></span>
								                    </span>
								                </div>
								                <div id="modidiv${icmtList.taskCmtId}" style="display:flex;">
								                      <div id="taskCmtCts${icmtList.taskCmtId }">${icmtList.taskCmtCts }</div>
								                      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								                      <input style="width:400px;" type="hidden" id="repInput${icmtList.taskCmtId}">
								                        <div id="taskCmtId${icmtList.taskCmtId }">
									                        &nbsp;&nbsp;<a id="replywrite${icmtList.taskCmtId }" style="font-size: 12px; text-decoration: underline;" onclick="fn_replyreplyinput(${icmtList.taskCmtId })" type="button">댓글작성</a> 	
									                        &nbsp;&nbsp;<a style=" color : red; font-size: 12px; text-decoration: underline;" id="cmtDelete${icmtList.taskCmtId }" onclick="fn_delete(${icmtList.taskCmtId })" type="button">삭제</a> 	
									                            <a style="color : grey; font-size: 12px; text-decoration: underline;" id="cmtModify${icmtList.taskCmtId }" onclick="fn_update(${icmtList.taskCmtId })" type="button">수정</a>
							                            </div>
								                  </div>
								                </div>
								            </div>
								        </form> 
								        <!-- 상위 댓글 종료 -->
					        		</c:if>
					        		<c:forEach var="jcmtList" items="${cmtList}">
						        		<c:if test="${icmtList.highCmtId eq jcmtList.taskCmtId}">
							        		<form style="padding-left:10px;" class="form-horizontal" id="${icmtList.taskCmtId}">
						                          <div class="user-block">
						                            <div>
						                              <div style="padding-bottom: 5px;" id="taskCmtId:${icmtList.taskCmtId}">
						                                <span class="username"> </span>
						                                <div style="font-size:15px;">
						                                 <i class="feather icon-corner-down-right"></i> ${icmtList.writer}
						                                 <i class="feather icon-user"></i>  
						                                 <span style="font-size: 8px; color: grey;"><fmt:formatDate value="${icmtList.taskCmtWriteDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span> </div>
						                              </div>
						                              <div id="modidiv${icmtList.taskCmtId}" style="display:flex;">
						                                <div style="display:flex;" id="taskCmtCts${icmtList.taskCmtId}">&nbsp;&nbsp;&nbsp;&nbsp;${icmtList.taskCmtCts} &nbsp;&nbsp;
						                                </div>
						                                &nbsp;&nbsp;&nbsp;&nbsp;<input style="width:400px;" type="hidden" id="repInput${icmtList.taskCmtId }" value="">
						                                <a style=" color : red;font-size: 12px; text-decoration: underline;" id="cmtDelete${icmtList.taskCmtId }" onclick="fn_lowCmtdelete(${icmtList.taskCmtId })" type="button">삭제</a> &nbsp;
						                                 <a style=" color : grey; font-size: 12px; text-decoration: underline;" id="cmtModify${icmtList.taskCmtId }" onclick="fn_update(${icmtList.taskCmtId })" type="button">수정</a></div>
						                            </div>
						                            <br>
						                          </div>
						                      </form>
					                      </c:if>
					                      <!-- 하위 댓글 for end -->
				                      </c:forEach>
					        <!-- 상위 댓글 for end -->		
					        </c:forEach>
							 
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-invoice.js"></script>
	<!-- END: Page JS-->
<script>

let memCode = "${mvo.member.memCode}";
console.log("memCode : " , memCode)

</script>




