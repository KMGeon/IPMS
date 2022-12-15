<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<style>
	h5 {
		font-family: 'MICEGothic Bold';
	}
</style>

<section class="row all-contacts">
	<div class="col-12">
		<div class="card">
			<div class="card-head">
				<div class="card-header">
					<h1 class="card-title" style="font-family: 'MICEGothic Bold'">문서함</h1>
					<div class="heading-elements mt-0">
						<button class="btn btn-primary btn-md" data-toggle="modal"
							data-target="#AddFoder">
							<i class="d-md-none d-block feather icon-plus white"></i> <span
								class="d-md-block d-none"><i class="icon-folder-alt"></i>&nbsp;폴더 만들기</span>
						</button>
						<!-- 폴더 모달창 시작 -->
						<div class="modal fade" id="AddFoder" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel1" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<section class="contact-form">
										<!-- <form id="form-add-contact" class="contact-input"> -->
										<form id="insertFolder" action="/proj/docsMkdir" method="post" >
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel1">폴더 만들기</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<fieldset class="form-group col-12">
													<input type="text" id="foldName" name="foldName" data-foldName="" class="contact-name form-control" placeholder="폴더명을 입력하세요.">
												</fieldset>
											</div>
											<div class="modal-footer">
												<fieldset
													class="form-group position-relative has-icon-left mb-0">
													<input type="submit" id="insertFolderBtn" class="btn btn-info add-contact-item" data-dismiss="modal" value="생성하기">
														<i class="fa fa-paper-plane-o d-block d-lg-none"></i> <span
															class="d-none d-lg-block"></span>
												</fieldset>
											</div>
											<sec:csrfInput/>
										</form>
										<!-- </form> -->
									</section>
								</div>
							</div>
						</div>
						<!-- 폴더 모달창 끝 -->
						<!-- 파일 모당창 시작 -->
						<div class="modal fade" id="AddFile" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel1" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<section class="contact-form">
										<form id="form-add-contact" class="contact-input">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel1">파일 업로드</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<fieldset class="form-group col-12">
													<input type="file" class="form-control-file"
														id="user-image">
												</fieldset>
											</div>
										</form>
									</section>
								</div>
							</div>
						</div>
						<!-- 파일 모당창 끝 -->
						<button class="btn btn-warning btn-md" data-toggle="modal"
							data-target="#AddFile">
							<i class="d-md-none d-block feather icon-plus white"></i> <span
								class="d-md-block d-none"><i class="feather icon-upload"></i>&nbsp;파일 업로드</span>
						</button>
					</div>
				</div>
			</div>
			<div class="card-content">
				<div class="card-body">
					<!-- Task List table -->
					<div class="table-responsive">
						<div id="users-contacts_wrapper"
							class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12">
									<table id="users-contacts"
										class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center dataTable"
										role="grid" aria-describedby="users-contacts_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Name: activate to sort column descending"
													style="width: 141.646px;" aria-sort="ascending">구분</th>
												<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Email: activate to sort column ascending"
													style="width: 159.844px;">명</th>
												<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Phone: activate to sort column ascending"
													style="width: 87.0625px;">등록자</th>
												<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Favorite: activate to sort column ascending"
													style="width: 57.75px;">등록일자</th>
														<th class="sorting" tabindex="0"
													aria-controls="users-contacts" rowspan="1" colspan="1"
													aria-label="Favorite: activate to sort column ascending"
													style="width: 57.75px;">기능</th>
											</tr>
										</thead>
										<tbody>
											<tr role="row" class="odd">
												<!-- 구분 컬럼 -->
												<td class=""><i class="feather icon-folder"></i><i class="feather icon-file"></i>폴더</td>
												<!-- 명 컬럼 -->
												<td class="sorting_1">
													<div class="media">
														<div class="media-left pr-1">
															<span>
																<i></i>
															</span>
														</div>
														<div class="media-body media-middle mt-50">
															<a class="media-heading name" href="#">Margaret Govan</a>
														</div>
													</div>
												</td>
												<!-- 등록자 컬럼 -->
												<td class="text-center">
												<a class="email">margaret@example.com</a></td>
												<!-- 등록일자 컬럼 -->
												<td class="date">+125-654-564</td>
												<!-- 기능 컬럼 -->
												<td>
													&nbsp;
													<a data-toggle="modal" data-target="#EditContactModal" class="primary edit mr-1">
														<i class="feather icon-download"></i>
													</a>
													 
													<a class="danger delete mr-1">
														<i class="fa fa-trash-o"></i>
													</a>
												</td>
											</tr>
											<c:forEach var="docsList" items="${docsList}">
											<tr role="row" class="odd">
												<!-- 구분 컬럼 -->
												<td class=""><i class="feather icon-folder"></i><i class="feather icon-file"></i>폴더</td>
												<!-- 명 컬럼 -->
												<td class="sorting_1">
													<div class="media">
														<div class="media-left pr-1">
															<span>
																<i></i>
															</span>
														</div>
														<div class="media-body media-middle mt-50">
															<a class="media-heading name" href="#">${docsList.foldName}</a>
														</div>
													</div>
												</td>
												<!-- 등록자 컬럼 -->
												<td class="text-center">
												<a class="email">${docsList.foldName}</a></td>
												<!-- 등록일자 컬럼 -->
												<td class="date">+125-654-564</td>
												<!-- 기능 컬럼 -->
												<td>
													&nbsp;
													<a data-toggle="modal" data-target="#EditContactModal" class="primary edit mr-1">
														<i class="feather icon-download"></i>
													</a>
													 
													<a class="danger delete mr-1">
														<i class="fa fa-trash-o"></i>
													</a>
												</td>
											</tr>
											</c:forEach>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="users-contacts_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="users-contacts_previous"><a href="#"
												aria-controls="users-contacts" data-dt-idx="0" tabindex="0"
												class="page-link">Previous</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="users-contacts" data-dt-idx="1" tabindex="0"
												class="page-link">1</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="users-contacts" data-dt-idx="2" tabindex="0"
												class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="users-contacts" data-dt-idx="3" tabindex="0"
												class="page-link">3</a></li>
											<li class="paginate_button page-item next"
												id="users-contacts_next"><a href="#"
												aria-controls="users-contacts" data-dt-idx="4" tabindex="0"
												class="page-link">Next</a></li>
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

<script type="text/javascript">
	$("#insertFolderBtn").on("click", function(){
		$("#insertFolder").submit();
	});
</script>