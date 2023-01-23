<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<link rel="apple-touch-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">


<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">







<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/unslider.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/weather-icons/climacons.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/fonts/meteocons/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/charts/morris.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/components.css">
<!-- END: Theme CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/fonts/simple-line-icons/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/timeline.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->

<!-- BEGIN: font CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/commonFont.css">
<!-- END: font CSS-->



<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-noui.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/extensions/noui-slider.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/nouislider.min.css">
<style type="text/css">
.jqstooltip {
 position: absolute;
 left: 0px;top: 0px;visibility:
  hidden;background: rgb(0, 0, 0) transparent;
  background-color: rgba(0,0,0,0.6);
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
 -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
 color: white;font: 10px arial, san serif;
 text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;
 z-index: 10000;}
 .jqsfield { 
 color: white;font: 10px arial, san serif;
 text-align: left;
 }
 </style>

<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/popover/popover.js"></script>
<script>
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
	
	  $( function () {
	    $( '[data-toggle="popover"]' ).popover()
	  } );
</script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<div class="app-content">
		일감관리  &nbsp;<button type="button" data-toggle="popover" data-placement="right" data-container="body" 
               data-original-title="일감관리 이용 안내" data-content="팀원은 리더가 등록한 상위일감에 대하여 하위일감을 등록 할 수 있으며,상위일감은 프로젝트 리더만 등록 가능합니다. 하위일감 등록 시 미승인 일감으로 이동됩니다. 등록한 일감은 리더의 승인 후 등록한 상위일감의 하위로 이동됩니다.">
               <i class="fa fa-question-circle"></i>
               </button>
		
               
               
                 
	<div class="content-overlay"></div>
	<div class="content-wrapper">
		<div class="content-header row"></div>
		<div class="content-body">
			<!-- Basic Kanban App -->
			<div class="kanban-overlay"></div>
			<section id="kanban-wrapper">
				<div class="row">
					<div class="col-12">
						<button type="button" class="btn btn-primary mb-1" id="add-kanban">
							<i class="feather icon-plus-square mr-50"></i> 상위일감 등록
						</button>
						<div id="kanban-app"></div>
					</div>
				</div>

				<!-- User new mail right area -->
				<div class="kanban-sidebar">
					<div class="card shadow-none quill-wrapper">
						<div
							class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
							<h3 id="classification" class="card-title">UI Design</h3>
							<button type="button" class="close close-icon">
								<i class="feather icon-x"></i>
							</button>
						</div>
						<div class="card-content position-relative ps">
							<div id="modalresult" class="card-body">
								<div id="writerdiv" class="form-group">
									<label>작성자</label> 
									<input style=" text-align:center; width:100px; height: 32px;" type="text" id="writer" name="writer" class="form-control"/>
								</div>
							
								<div class="form-group">
									<label id="cardtitle">Card Title</label> 
									<input type="text" id="taskTitle" name="taskTitle" class="form-control edit-kanban-item-title" placeholder="일감제목 작성">
										<input type="hidden" id="taskId" name="taskId" value=""/>
								</div>

								<div class="form-group">
									<div>
										<label>일감 시작일</label> 
										<input type="text"
											name="taskStrtDate" id="taskStrtDate"
											class="form-control edit-kanban-item-date picker__input"
											placeholder="21 August, 2019" readonly="" id="P502209161"
											aria-haspopup="true" aria-readonly="false"
											aria-owns="P502209161_root" />
										
									</div><br/>
									<div>
										<label>일감 종료일</label> <input type="text" name="taskEndDate"
											id="taskEndDate"
											class="form-control edit-kanban-item-date picker__input"
											placeholder="21 August, 2019" readonly="" id="P502209161"
											aria-haspopup="true" aria-readonly="false"
											aria-owns="P502209161_root" />
									</div>
									<div class="picker" id="P502209161_root" aria-hidden="true">
										<div class="picker__holder" tabindex="-1">
											<div class="picker__frame">
												<div class="picker__wrap">
													<div class="picker__box">
														<div class="picker__header">
															<div class="picker__month">December</div>
															<div class="picker__year">2022</div>
															<div class="picker__nav--prev" data-nav="-1" tabindex="0"
																role="button" aria-controls="P502209161_table"
																title="Previous month"></div>
															<div class="picker__nav--next" data-nav="1" tabindex="0"
																role="button" aria-controls="P502209161_table"
																title="Next month"></div>
														</div>
														<table class="picker__table" id="P502209161_table"
															role="grid" aria-controls="P502209161"
															aria-readonly="true">
															<thead>
																<tr>
																	<th class="picker__weekday" scope="col" title="Sunday">Sun</th>
																	<th class="picker__weekday" scope="col" title="Monday">Mon</th>
																	<th class="picker__weekday" scope="col" title="Tuesday">Tue</th>
																	<th class="picker__weekday" scope="col"
																		title="Wednesday">Wed</th>
																	<th class="picker__weekday" scope="col"
																		title="Thursday">Thu</th>
																	<th class="picker__weekday" scope="col" title="Friday">Fri</th>
																	<th class="picker__weekday" scope="col"
																		title="Saturday">Sat</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1669474800000"
																			id="P502209161_1669474800000" tabindex="0"
																			role="gridcell" aria-label="2022-11-27">27</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1669561200000"
																			id="P502209161_1669561200000" tabindex="0"
																			role="gridcell" aria-label="2022-11-28">28</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1669647600000"
																			id="P502209161_1669647600000" tabindex="0"
																			role="gridcell" aria-label="2022-11-29">29</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1669734000000"
																			id="P502209161_1669734000000" tabindex="0"
																			role="gridcell" aria-label="2022-11-30">30</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1669820400000"
																			id="P502209161_1669820400000" tabindex="0"
																			role="gridcell" aria-label="2022-12-01">1</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1669906800000"
																			id="P502209161_1669906800000" tabindex="0"
																			role="gridcell" aria-label="2022-12-02">2</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1669993200000"
																			id="P502209161_1669993200000" tabindex="0"
																			role="gridcell" aria-label="2022-12-03">3</div></td>
																</tr>
																<tr>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670079600000"
																			id="P502209161_1670079600000" tabindex="0"
																			role="gridcell" aria-label="2022-12-04">4</div></td>
																	<td><div
																			class="picker__day picker__day--infocus picker__day--today picker__day--highlighted"
																			data-pick="1670166000000"
																			id="P502209161_1670166000000" tabindex="0"
																			role="gridcell" aria-label="2022-12-05"
																			aria-activedescendant="1670166000000">5</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670252400000"
																			id="P502209161_1670252400000" tabindex="0"
																			role="gridcell" aria-label="2022-12-06">6</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670338800000"
																			id="P502209161_1670338800000" tabindex="0"
																			role="gridcell" aria-label="2022-12-07">7</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670425200000"
																			id="P502209161_1670425200000" tabindex="0"
																			role="gridcell" aria-label="2022-12-08">8</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670511600000"
																			id="P502209161_1670511600000" tabindex="0"
																			role="gridcell" aria-label="2022-12-09">9</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670598000000"
																			id="P502209161_1670598000000" tabindex="0"
																			role="gridcell" aria-label="2022-12-10">10</div></td>
																</tr>
																<tr>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670684400000"
																			id="P502209161_1670684400000" tabindex="0"
																			role="gridcell" aria-label="2022-12-11">11</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670770800000"
																			id="P502209161_1670770800000" tabindex="0"
																			role="gridcell" aria-label="2022-12-12">12</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670857200000"
																			id="P502209161_1670857200000" tabindex="0"
																			role="gridcell" aria-label="2022-12-13">13</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1670943600000"
																			id="P502209161_1670943600000" tabindex="0"
																			role="gridcell" aria-label="2022-12-14">14</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671030000000"
																			id="P502209161_1671030000000" tabindex="0"
																			role="gridcell" aria-label="2022-12-15">15</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671116400000"
																			id="P502209161_1671116400000" tabindex="0"
																			role="gridcell" aria-label="2022-12-16">16</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671202800000"
																			id="P502209161_1671202800000" tabindex="0"
																			role="gridcell" aria-label="2022-12-17">17</div></td>
																</tr>
																<tr>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671289200000"
																			id="P502209161_1671289200000" tabindex="0"
																			role="gridcell" aria-label="2022-12-18">18</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671375600000"
																			id="P502209161_1671375600000" tabindex="0"
																			role="gridcell" aria-label="2022-12-19">19</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671462000000"
																			id="P502209161_1671462000000" tabindex="0"
																			role="gridcell" aria-label="2022-12-20">20</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671548400000"
																			id="P502209161_1671548400000" tabindex="0"
																			role="gridcell" aria-label="2022-12-21">21</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671634800000"
																			id="P502209161_1671634800000" tabindex="0"
																			role="gridcell" aria-label="2022-12-22">22</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671721200000"
																			id="P502209161_1671721200000" tabindex="0"
																			role="gridcell" aria-label="2022-12-23">23</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671807600000"
																			id="P502209161_1671807600000" tabindex="0"
																			role="gridcell" aria-label="2022-12-24">24</div></td>
																</tr>
																<tr>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671894000000"
																			id="P502209161_1671894000000" tabindex="0"
																			role="gridcell" aria-label="2022-12-25">25</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1671980400000"
																			id="P502209161_1671980400000" tabindex="0"
																			role="gridcell" aria-label="2022-12-26">26</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1672066800000"
																			id="P502209161_1672066800000" tabindex="0"
																			role="gridcell" aria-label="2022-12-27">27</div></td>
																	<td>
																		<div class="picker__day picker__day--infocus"
																			data-pick="1672153200000"
																			id="P502209161_1672153200000" tabindex="0"
																			role="gridcell" aria-label="2022-12-28">28</div>
																	</td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1672239600000"
																			id="P502209161_1672239600000" tabindex="0"
																			role="gridcell" aria-label="2022-12-29">29</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1672326000000"
																			id="P502209161_1672326000000" tabindex="0"
																			role="gridcell" aria-label="2022-12-30">30</div></td>
																	<td><div class="picker__day picker__day--infocus"
																			data-pick="1672412400000"
																			id="P502209161_1672412400000" tabindex="0"
																			role="gridcell" aria-label="2022-12-31">31</div></td>
																</tr>
																<tr>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1672498800000"
																			id="P502209161_1672498800000" tabindex="0"
																			role="gridcell" aria-label="1 January, 2023">1</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1672585200000"
																			id="P502209161_1672585200000" tabindex="0"
																			role="gridcell" aria-label="2 January, 2023">2</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1672671600000"
																			id="P502209161_1672671600000" tabindex="0"
																			role="gridcell" aria-label="3 January, 2023">3</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1672758000000"
																			id="P502209161_1672758000000" tabindex="0"
																			role="gridcell" aria-label="4 January, 2023">4</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1672844400000"
																			id="P502209161_1672844400000" tabindex="0"
																			role="gridcell" aria-label="5 January, 2023">5</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1672930800000"
																			id="P502209161_1672930800000" tabindex="0"
																			role="gridcell" aria-label="6 January, 2023">6</div></td>
																	<td><div class="picker__day picker__day--outfocus"
																			data-pick="1673017200000"
																			id="P502209161_1673017200000" tabindex="0"
																			role="gridcell" aria-label="7 January, 2023">7</div></td>
																</tr>
															</tbody>
														</table>
														<div class="picker__footer">
															<button class="picker__button--today" type="button"
																data-pick="1670166000000" disabled=""
																aria-controls="P502209161">Today</button>
															<button class="picker__button--clear" type="button"
																data-clear="1" disabled="" aria-controls="P502209161">Clear</button>
															<button class="picker__button--close" type="button"
																data-close="true" disabled="" aria-controls="P502209161">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<div id="imbtn" class="form-group">
											<label>중요도</label> 
											<select onchange="chageLangSelect(this.value)" name="taskStusCode" id="taskStusCode" class="form-control text-white bg-primary">
												<option id="nomal" value="primary" class="bg-primary" selected="selected">일반</option>
												<option id="high" value="danger" class="bg-danger">높음</option>
												<option id="low" value="secondary" class="bg-secondary">낮음</option>
											</select>
										</div>
									</div>
								</div>

								<!-- 슬라이더 바  -->

								<div class="form-group" id="taskPgresdiv">
												<label>진척도 설정</label>
												
											<input id="taskPgres" name="taskPgres" type="range" min="1" max="100" value="20" class="slider">
											<p style="font-size: 10px;">진척률: <span id="value"></span></p>
								</div>



								<div class="form-group">
									<label id="taskb">하위일감 상세내용</label>
									<textarea placeholder="일감내용 작성" id="taskCts" name="taskCts" rows="4" cols="78" style="resize: none;"></textarea>
								</div>
								<!-- Compose mail Quill editor -->
							</div>
							<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
								<div class="ps__thumb-x" tabindex="0"
									style="left: 0px; width: 0px;"></div>
							</div>
							<div class="ps__rail-y" style="top: 0px; right: 0px;">
								<div class="ps__thumb-y" tabindex="0"
									style="top: 0px; height: 0px;"></div>
							</div>
						</div>


							<div id="totaldiv" style=" padding-left:20px;">
										<div id="fdiv"  style="display:flex; padding-right: 4px; float: left;" >
											<button id="cpnbtn" class="btn btn-primary glow mr-1">
												<i class="feather icon-play mr-50"></i><span>승인</span>
											</button>
											<button id="approbtn" type="reset" class="btn btn-warning mr-1">
												<i class="feather icon-trash-2 mr-50"></i> <span>반려</span>
											</button>
										</div>
										<div id="sdiv">
											<button id="mbmodifybtn" type="reset" class="btn btn-warning mr-1">
												<i class="icon-refresh mr-50"></i> <span>수정</span>
											</button>
											<button id="mbmodimode" type="reset" class="btn btn-warning mr-1">
												<i class="icon-refresh mr-50"></i> <span>수정모드 전환</span>
											</button>
										</div>
										<div>	
											<button id="btndel" type="reset" class="btn btn-danger mr-1">
												<i class="feather icon-trash-2 mr-50"></i> <span>삭제</span>
											</button>
										</div>
							</div>


						<!-- 기존에 있던 버튼 -->
						<div id="tdiv" class="card-footer">
							
							<button id="btnsave" class="btn btn-primary glow">
								<i class="feather icon-play mr-50"></i> <span>저장</span>
							</button>
						</div>
						<!-- 기존에 있던 버튼 -->
						<!--                   </form> -->
						<!-- form start end-->
					</div>
				</div>
				<!--/ User Chat profile right area -->
				<div class="kanban-container" style="width: 840px;">
					<!-- 시작 -->
					

					<!-- 시작 -->
				</div>
			</section>
			<!--/ Sample Project kanban -->
		</div>
	</div>
</div>

<div id="modal" class="modal fade text-left show" id="small" tabindex="-1" role="dialog" aria-labelledby="myModalLabel19" style="padding-right: 17px; display: none;" aria-modal="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel19">반려 사유</h4>
                <button type="button" class="close modalclose" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
            	<textarea style="width: 100%; height: 100%; resize: none;" id="referCts" name="referCts" rows="4" cols="78"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn grey btn-outline-secondary modalclose" data-dismiss="modal">닫기</button>
                <button id="sendData" type="button" class="btn btn-outline-primary">적용 </button>
            </div>
        </div>
    </div>
</div>

<script>
var auth ="${auth}";
var mvo = "${mvo}";
var authCheck = "${authCheck}";
</script>
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/jkanban/jkanban.min.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/quill/quill.snow.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/pickadate/pickadate.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-kanban.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/quill/quill.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/jkanban/jkanban.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-kanban.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/modal/components-modal.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>


