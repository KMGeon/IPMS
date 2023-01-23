<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<div class="app-content">
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
							<i class="feather icon-plus-square mr-50"></i> Add New Board
						</button>
						<div id="kanban-app"></div>
					</div>
				</div>

				<!-- User new mail right area -->
				<div class="kanban-sidebar">
					<div class="card shadow-none quill-wrapper">
						<div
							class="card-header d-flex justify-content-between align-items-center border-bottom px-2 py-1">
							<h3 class="card-title">UI Design</h3>
							<button type="button" class="close close-icon">
								<i class="feather icon-x"></i>
							</button>
						</div>
						<!-- form start -->
						<form class="edit-kanban-item">
							<div class="card-content position-relative ps">
								<div class="card-body">
									<div class="form-group">
										<label>Card Title</label> <input type="text"
											class="form-control edit-kanban-item-title"
											placeholder="kanban Title">
									</div>
									<div class="form-group">
										<label>Due Date</label> <input type="text"
											class="form-control edit-kanban-item-date picker__input"
											placeholder="21 August, 2019" readonly="" id="P502209161"
											aria-haspopup="true" aria-readonly="false"
											aria-owns="P502209161_root">
										<div class="picker" id="P502209161_root" aria-hidden="true">
											<div class="picker__holder" tabindex="-1">
												<div class="picker__frame">
													<div class="picker__wrap">
														<div class="picker__box">
															<div class="picker__header">
																<div class="picker__month">December</div>
																<div class="picker__year">2022</div>
																<div class="picker__nav--prev" data-nav="-1"
																	tabindex="0" role="button"
																	aria-controls="P502209161_table" title="Previous month">
																</div>
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
																		<th class="picker__weekday" scope="col"
																			title="Tuesday">Tue</th>
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
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1669474800000"
																				id="P502209161_1669474800000" tabindex="0"
																				role="gridcell" aria-label="27 November, 2022">27</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1669561200000"
																				id="P502209161_1669561200000" tabindex="0"
																				role="gridcell" aria-label="28 November, 2022">28</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1669647600000"
																				id="P502209161_1669647600000" tabindex="0"
																				role="gridcell" aria-label="29 November, 2022">29</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1669734000000"
																				id="P502209161_1669734000000" tabindex="0"
																				role="gridcell" aria-label="30 November, 2022">30</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1669820400000"
																				id="P502209161_1669820400000" tabindex="0"
																				role="gridcell" aria-label="1 December, 2022">1</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1669906800000"
																				id="P502209161_1669906800000" tabindex="0"
																				role="gridcell" aria-label="2 December, 2022">2</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1669993200000"
																				id="P502209161_1669993200000" tabindex="0"
																				role="gridcell" aria-label="3 December, 2022">3</div></td>
																	</tr>
																	<tr>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670079600000"
																				id="P502209161_1670079600000" tabindex="0"
																				role="gridcell" aria-label="4 December, 2022">4</div></td>
																		<td><div
																				class="picker__day picker__day--infocus picker__day--today picker__day--highlighted"
																				data-pick="1670166000000"
																				id="P502209161_1670166000000" tabindex="0"
																				role="gridcell" aria-label="5 December, 2022"
																				aria-activedescendant="1670166000000">5</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670252400000"
																				id="P502209161_1670252400000" tabindex="0"
																				role="gridcell" aria-label="6 December, 2022">6</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670338800000"
																				id="P502209161_1670338800000" tabindex="0"
																				role="gridcell" aria-label="7 December, 2022">7</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670425200000"
																				id="P502209161_1670425200000" tabindex="0"
																				role="gridcell" aria-label="8 December, 2022">8</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670511600000"
																				id="P502209161_1670511600000" tabindex="0"
																				role="gridcell" aria-label="9 December, 2022">9</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670598000000"
																				id="P502209161_1670598000000" tabindex="0"
																				role="gridcell" aria-label="10 December, 2022">10</div></td>
																	</tr>
																	<tr>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670684400000"
																				id="P502209161_1670684400000" tabindex="0"
																				role="gridcell" aria-label="11 December, 2022">11</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670770800000"
																				id="P502209161_1670770800000" tabindex="0"
																				role="gridcell" aria-label="12 December, 2022">12</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670857200000"
																				id="P502209161_1670857200000" tabindex="0"
																				role="gridcell" aria-label="13 December, 2022">13</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1670943600000"
																				id="P502209161_1670943600000" tabindex="0"
																				role="gridcell" aria-label="14 December, 2022">14</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671030000000"
																				id="P502209161_1671030000000" tabindex="0"
																				role="gridcell" aria-label="15 December, 2022">15</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671116400000"
																				id="P502209161_1671116400000" tabindex="0"
																				role="gridcell" aria-label="16 December, 2022">16</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671202800000"
																				id="P502209161_1671202800000" tabindex="0"
																				role="gridcell" aria-label="17 December, 2022">17</div></td>
																	</tr>
																	<tr>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671289200000"
																				id="P502209161_1671289200000" tabindex="0"
																				role="gridcell" aria-label="18 December, 2022">18</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671375600000"
																				id="P502209161_1671375600000" tabindex="0"
																				role="gridcell" aria-label="19 December, 2022">19</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671462000000"
																				id="P502209161_1671462000000" tabindex="0"
																				role="gridcell" aria-label="20 December, 2022">20</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671548400000"
																				id="P502209161_1671548400000" tabindex="0"
																				role="gridcell" aria-label="21 December, 2022">21</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671634800000"
																				id="P502209161_1671634800000" tabindex="0"
																				role="gridcell" aria-label="22 December, 2022">22</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671721200000"
																				id="P502209161_1671721200000" tabindex="0"
																				role="gridcell" aria-label="23 December, 2022">23</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671807600000"
																				id="P502209161_1671807600000" tabindex="0"
																				role="gridcell" aria-label="24 December, 2022">24</div></td>
																	</tr>
																	<tr>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671894000000"
																				id="P502209161_1671894000000" tabindex="0"
																				role="gridcell" aria-label="25 December, 2022">25</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1671980400000"
																				id="P502209161_1671980400000" tabindex="0"
																				role="gridcell" aria-label="26 December, 2022">26</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1672066800000"
																				id="P502209161_1672066800000" tabindex="0"
																				role="gridcell" aria-label="27 December, 2022">27</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1672153200000"
																				id="P502209161_1672153200000" tabindex="0"
																				role="gridcell" aria-label="28 December, 2022">28</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1672239600000"
																				id="P502209161_1672239600000" tabindex="0"
																				role="gridcell" aria-label="29 December, 2022">29</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1672326000000"
																				id="P502209161_1672326000000" tabindex="0"
																				role="gridcell" aria-label="30 December, 2022">30</div></td>
																		<td><div class="picker__day picker__day--infocus"
																				data-pick="1672412400000"
																				id="P502209161_1672412400000" tabindex="0"
																				role="gridcell" aria-label="31 December, 2022">31</div></td>
																	</tr>
																	<tr>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1672498800000"
																				id="P502209161_1672498800000" tabindex="0"
																				role="gridcell" aria-label="1 January, 2023">1</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1672585200000"
																				id="P502209161_1672585200000" tabindex="0"
																				role="gridcell" aria-label="2 January, 2023">2</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1672671600000"
																				id="P502209161_1672671600000" tabindex="0"
																				role="gridcell" aria-label="3 January, 2023">3</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1672758000000"
																				id="P502209161_1672758000000" tabindex="0"
																				role="gridcell" aria-label="4 January, 2023">4</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1672844400000"
																				id="P502209161_1672844400000" tabindex="0"
																				role="gridcell" aria-label="5 January, 2023">5</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
																				data-pick="1672930800000"
																				id="P502209161_1672930800000" tabindex="0"
																				role="gridcell" aria-label="6 January, 2023">6</div></td>
																		<td><div
																				class="picker__day picker__day--outfocus"
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
																	data-close="true" disabled=""
																	aria-controls="P502209161">Close</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<label>Label</label> <select
													class="form-control text-white bg-primary">
													<option class="bg-primary" selected="">Primary</option>
													<option class="bg-danger">Danger</option>
													<option class="bg-success">Success</option>
													<option class="bg-info">Info</option>
													<option class="bg-warning">Warning</option>
													<option class="bg-secondary">Secondary</option>
												</select>
											</div>
										</div>
										<div class="col-6">
											<div class="form-group">
												<label>Member</label>
												<div class="d-flex align-items-center">
													<div class="avatar m-0 mr-1">
														<img
															src="../../../app-assets/images/portrait/small/avatar-s-20.png"
															height="36" width="36" alt="avtar img holder">
													</div>
													<div class="badge-circle">
														<i class="feather icon-plus"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label>Attachment</label>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="emailAttach">
											<label class="custom-file-label" for="emailAttach">Attach
												file</label>
										</div>
									</div>
									<!-- Compose mail Quill editor -->
									<div class="form-group">
										<label>Comment</label>
										<div class="snow-container border rounded p-1">
											<div class="compose-editor ql-container ql-snow">
												<div class="ql-editor ql-blank" data-gramm="false"
													contenteditable="true"
													data-placeholder="Write a Comment... ">
													<p>
														<br>
													</p>
												</div>
												<div class="ql-clipboard" contenteditable="true"
													tabindex="-1"></div>
												<div class="ql-tooltip ql-hidden">
													<a class="ql-preview" target="_blank" href="about:blank"></a><input
														type="text" data-formula="e=mc^2"
														data-link="https://quilljs.com" data-video="Embed URL"><a
														class="ql-action"></a><a class="ql-remove"></a>
												</div>
											</div>
											<div class="d-flex justify-content-end">
												<div class="compose-quill-toolbar ql-toolbar ql-snow">
													<span class="ql-formats mr-0">
														<button class="ql-bold" type="button">
															<svg viewBox="0 0 18 18"> <path class="ql-stroke"
																	d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z"></path> <path
																	class="ql-stroke"
																	d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z"></path> </svg>
														</button>
														<button class="ql-italic" type="button">
															<svg viewBox="0 0 18 18"> <line class="ql-stroke"
																	x1="7" x2="13" y1="4" y2="4"></line> <line
																	class="ql-stroke" x1="5" x2="11" y1="14" y2="14"></line> <line
																	class="ql-stroke" x1="8" x2="10" y1="14" y2="4"></line> </svg>
														</button>
														<button class="ql-underline" type="button">
															<svg viewBox="0 0 18 18"> <path class="ql-stroke"
																	d="M5,3V9a4.012,4.012,0,0,0,4,4H9a4.012,4.012,0,0,0,4-4V3"></path> <rect
																	class="ql-fill" height="1" rx="0.5" ry="0.5" width="12"
																	x="3" y="15"></rect> </svg>
														</button>
														<button class="ql-link" type="button">
															<svg viewBox="0 0 18 18"> <line class="ql-stroke"
																	x1="7" x2="11" y1="7" y2="11"></line> <path
																	class="ql-even ql-stroke"
																	d="M8.9,4.577a3.476,3.476,0,0,1,.36,4.679A3.476,3.476,0,0,1,4.577,8.9C3.185,7.5,2.035,6.4,4.217,4.217S7.5,3.185,8.9,4.577Z"></path> <path
																	class="ql-even ql-stroke"
																	d="M13.423,9.1a3.476,3.476,0,0,0-4.679-.36,3.476,3.476,0,0,0,.36,4.679c1.392,1.392,2.5,2.542,4.679.36S14.815,10.5,13.423,9.1Z"></path> </svg>
														</button>
														<button class="ql-image" type="button">
															<svg viewBox="0 0 18 18"> <rect class="ql-stroke"
																	height="10" width="12" x="3" y="4"></rect> <circle
																	class="ql-fill" cx="6" cy="7" r="1"></circle> <polyline
																	class="ql-even ql-fill"
																	points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12"></polyline> </svg>
														</button>
														<button class="btn btn-sm btn-primary btn-comment ml-25">Comment</button>
													</span>
												</div>
											</div>
										</div>
									</div>
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
							<div class="card-footer d-flex justify-content-end">
								<button type="reset"
									class="btn btn-danger delete-kanban-item mr-1">
									<i class="feather icon-trash-2 mr-50"></i> <span>Delete</span>
								</button>
								<button class="btn btn-primary glow update-kanban-item">
									<i class="feather icon-play mr-50"></i> <span>Save</span>
								</button>
							</div>
						</form>
						<!-- form start end-->
					</div>
				</div>
				<!--/ User Chat profile right area -->
				<div class="kanban-container" style="width: 840px;">
				
					
				</div>
			</section>
			<!--/ Sample Project kanban -->
		</div>
	</div>
</div>

<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/jkanban/jkanban.min.css">

<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/quill/quill.snow.css">

<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/pickadate/pickadate.css">

<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-kanban.css">
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/jkanban/jkanban.min.js"></script>

<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/quill/quill.js"></script>

<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-kanban.js"></script>