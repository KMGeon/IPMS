<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/animate/animate.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/sweetalert2.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Page CSS-->
<!-- END: Page CSS-->


<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/nestable.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/jstree/themes/default/style.css">
<!-- <link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/extensions/bootstrap-treeview.min.css"> -->
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<!-- END: Theme CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/extensions/ex-component-treeview.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<!-- END: Custom CSS-->

<script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
						<button id="newdir" class="btn btn-primary btn-md" data-toggle="modal"
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
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel1">폴더 만들기</h5>
												<button id="folerClose" type="button" class="close" data-dismiss="modal"
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
													<input type="button" id="makeFolderBtn" class="btn btn-info add-contact-item" value="생성하기">
														<i class="fa fa-paper-plane-o d-block d-lg-none"></i> <span
															class="d-none d-lg-block"></span>
												</fieldset>
											</div>
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
										<!-- action="/proj/docsFileUpload" method="post" enctype="multipart/form-data" -->
										<form id="fileUploadForm" class="contact-input">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel1">파일 업로드</h5>
												<button id="fileClose" type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<fieldset class="form-group col-12">
													<input type="file" name="docsFile" class="form-control-file"
														id="docsFile" multiple="multiple">
												</fieldset>
											</div>
											<div class="modal-footer">
												<fieldset
													class="form-group position-relative has-icon-left mb-0">
													<input type="button" id="docsFileUploadBtn" class="btn btn-info add-contact-item" data-dismiss="modal" value="업로드">
														<i class="fa fa-paper-plane-o d-block d-lg-none"></i> <span
															class="d-none d-lg-block"></span>
												</fieldset>
											</div>
											<!-- <sec:csrfInput/> -->
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
				<!-- jstree 시작 -->
				<div style="width: 25%; float: left;padding-top: 20px">
					<div class="card-body border rounded jstree jstree-2 jstree-default"
						id="tree-area" role="tree" aria-multiselectable="true"
						tabindex="0" aria-activedescendant="j2_1" aria-busy="false" style="">
						
					</div>
				</div>
				<!-- jstree 끝 -->
				<br>
				<div class="card-body" style="width: 75%; float: right; padding: 0;">
					<!-- Task List table -->
					<div class="table-responsive">
						<div id="users-contacts_wrapper" class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12" >
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
													style="width: 87.0625px;">크기</th>
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
										<tbody id="content-area">
											<tr role="row" class="odd">
												<!-- 구분 컬럼 -->
												<td class="" id="coldivision"><i class="feather icon-folder"></i><i class="feather icon-file"></i></td>
												<!-- 명 컬럼 -->
												<td class="sorting_1">
													<div class="media">
														<div class="media-left pr-1">
															<span>
																<i></i>
															</span>
														</div>
														<div class="media-body media-middle mt-50">
															<a id="colName" class="media-heading name" href="#"></a>
														</div>
													</div>
												</td>
												<!-- 사이즈 컬럼 -->
												<td id="colSize" class="text-center">
													
												</td>
												<!-- 등록일자 컬럼 -->
												<td id="colRegDate" class="date"></td>
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
										</tbody>
											<!-- 폴더 조회 -->
											
											<!-- 파일 조회 -->
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/sweetalert2.all.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/polyfill.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/extensions/sweet-alerts.js"></script>
<!-- END: Page JS-->


<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/nestable.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/jstree.js"></script>
<!-- <script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/extensions/bootstrap-treeview.min.js"></script> -->
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/ex-component-treeview.js"></script>
<!-- END: Page JS-->

<script type="text/javascript" defer="defer">
	
	let treeData = [];
	let id = 1;
	let dataToJson = null;
	let treeArea = $("#tree-area");	
	let contentArea = $("#content-area");	
	let thisPath = "";							
	let thisId = 1;								
	let thisParent = 1;							
	
	// 페이지 로드 시 한번 실행
	// 자기 호출 익명함수
	!function(){
		$.ajax({
			url : "/proj/docTest",
			method : "get",
			data : {
				path : "P001"
			},
			dataType : "json",
			success : function(resp){
				let root = fn_makeTreeObj(id, "#", "/P001");
				treeData.push(root);
				contentArea.empty();
				$.each(resp, function(index, data){
					if(data.dir == true){
						id++;
						let treeObj = fn_makeTreeObj(id, 1, data.text);
						console.log(data);
						
						treeData.push(treeObj);
					}
					let divBlock = fn_makeBlock(data); 	
					// fn_makeBlock(data);
					contentArea.append(divBlock);

				});
				if( !(treeData.length > 0) ) return;
				dataToJson = JSON.stringify(treeData);
				fn_bindJstree(dataToJson);
			}
		});
		
	}();

	// jstree 맵핑
	function fn_bindJstree(data) {
		treeArea.jstree({
			'plugins': ["wholerow"],
			'core' : {
				'check_callback' : true,
				'themes' : {
					'name' : 'proton',
					'responsive' : true
				},
				'data' : JSON.parse(data)
			}
		});
	}

	// jstree에서 사용할 데이터 셋팅하는 함수
	// parameter id, 부모노드 아이디, 노드 이름
	// return 오브젝트
	function fn_makeTreeObj(id, parent, dirName) {
		let treeObj = new Object();
		treeObj.id = id;
		treeObj.parent = parent;
		treeObj.text = dirName;
		
		return treeObj;
	}
	
	// path를 구해주는 함수
	function fn_makePath(text, parents) {
		let path = "";
		for (let i = parents.length - 1; i >= 0; i--) {
			let id = parents[i];
			let temp = treeArea.jstree(true).get_node(id).text;
			if(temp == "P001") continue;
			if (id == "#") {
				continue;
			} else {
				path += "/";
			}
			path += temp;
		}
		path += ("/" + text);
		// 여기 고침
		if(text == "P001") path = "";
		thisPath = path;
		console.log("fn_makePath - thisPath -> ", thisPath);
		return path;
	}

	// jstree 자식 추가
	function fn_addChild(data) {
		let test = treeArea.jstree("create_node", data.parent, data, "last",
			function(new_node) {
				treeArea.jstree("open_node", treeArea
						.jstree("get_selected"));
			});
	}

	// jstree 선택시 비동기 통신
	treeArea.on('select_node.jstree', function(e, data) {
		treeArea.jstree("open_node", treeArea
				.jstree("get_selected"));
		let parents = data.node.parents;
		let parent = data.node.id;
		let text = data.node.text;
		let path = fn_makePath(text, parents);
		let children = data.node.children;
		thisPath = path;

		console.log("treeArea - thisPath -> ", thisPath);
		
		thisId = parent;
		thisParent = parents[0];
		console.log("thisId", thisId);
		console.log("thisParent", thisParent);
		console.log(data);
		$.ajax({
			url : "/proj/docTest",
			method : "get",
			data : {
				path : path
			},
			dataType : "json",
			success : function(resp) {
				contentArea.empty();
				$.each(resp, function(index, data) {
					if ( !(children.length > 0) ) {
						if(data.dir == true){
							id++;
							let treeObj = fn_makeTreeObj(id, parent, data.text);
							fn_addChild(treeObj);
						}
					}
					let divBlock = fn_makeBlock(data);
					console.log("divBlock: ",divBlock);
					contentArea.append(divBlock);
				});
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
	})

	function getByteSize(size){
		const byteUnits = ["KB", "MB", "GB", "TB"];
		
		for(let i=0;i<byteUnits.length;i++) {
			size = Math.floor(size / 1024);
		  if(size<1024) return size.toFixed(1) + byteUnits[i];
		}
	}

	function fn_makeBlock(data){
		let division = "";
		let divisionIcon = "";
		let text = data.text;
		let size = data.size;
		let volume = "";
		let regDate = data.regDate;
		let dotIndex = text.lastIndexOf(".");
		let fileExtention = text.substring(dotIndex+1, text.length);
		let listTd;
		let cutText = "";
		

		console.log(data);
		
		if(data.dir){
			division = "폴더";
			divisionIcon = "fa fa-folder-open";
			volume = "-"; 
		}else{
			division = "파일";
			divisionIcon = "feather icon-file";
			volume = getByteSize(size);
		}
		
		if(text.length > 20){
			cutText = text.substring(0,20) + "..";
		}else{
			cutText = text;
		}
		// <tbody id="content-area">
		// 	<tr role="row" class="odd">
		// 		<td class="sorting_1">
		// 			<div class="media">
		// 				<div class="media-left pr-1">
		// 					<span>
		// 						<i></i>
		// 					</span>
		// 				</div>
		// 				<div class="media-body media-middle mt-50">
		// 					<a id="colName" class="media-heading name" href="#"></a>
		// 				</div>
		// 			</div>
		// 		</td>
		// 	</tr>
		// </tbody>
		// <i class="feather icon-folder"></i>

		let contentBlock = $("<tr>").attr("role", "row").attr("class", "odd")
								.append(
									$("<td>").attr("class", "sorting_1").append(
										$("<i>").attr("class", divisionIcon)
									).append(
											$("<p>").attr("id", "coldivision").html(division)
									)
								).append(
									$("<td>").attr("class", "sorting_1")
										.append(
											$("<a>").attr("id", "colName").attr("href", "#").html(cutText)
									)
								).append(
									$("<td>").attr("class", "sorting_1")
										.append(
											$("<a>").attr("id", "colSize").attr("href", "#").html(volume)
									)
								).append(
									$("<td>").attr("class", "sorting_1")
										.append(
											$("<a>").attr("id", "colRegDate").attr("href", "#").html(regDate)
									)
								).append(
									$("<td>").attr("class", "sorting_1")
										.append(
											$("<a>").attr("id", "colRegDate").attr("href", "#").html(regDate)
									)
								);
									// .append(
									// 	$("<div>").attr("class", "file-block")
									// 			.append( 
									// 					$("<input>").attr("type", "checkbox")
									// 					.attr("name", "fileName")
									// 					.attr("value", text)
									// 					.attr("class", "form-check-input block-check")
									// 			)
									// 			.append( $("<br>"))
									// 			.append(
									// 				$("<div>").attr("class", "img-box")
									// 							.append(imgTag)
									// 			)
									// ).append(
									// 	$("<p>").attr("class", "file-name")
									// 			.text(cutText)
									// );
		
		// let research = contentBlock.find(".file-block");
		// if(data.dir){
		// 	research.attr("class", "file-block dir").data("fnm", text);
		// }
		return contentBlock;						
	}
	
	function fn_ajaxMoveDir(path){
		$.ajax({
			url : "/proj/docTest",
			method : "get",
			data : {
				path : path
			},
			dataType : "json",
			success : function(resp) {
				contentArea.empty();
				$.each(resp, function(index, data) {
					let divBlock = fn_makeBlock(data);
					contentArea.append(divBlock);
				});
			},
			error : function(errorResp) {
				console.log(errorResp.status);
			}
		});
		return path;
	}
	// $('#tree-area').jstree({ 'core' : {
	//   'data' : [
	// 	  { "id" : "1", "parent" : "#", "text" : "프로젝트 문서함"},
	// 	  { "id" : "2", "parent" : "1", "text" : list[0] },
	// 	  { "id" : "3", "parent" : "1", "text" : list[1] },
	// 	  { "id" : "4", "parent" : "2", "text" : list[2] },
	// 	  { "id" : "5", "parent" : "4", "text" : list[3] },
	// 	]
	//   }
	// }); 
	
	// 폴더 생성 모달 
	// 모달 띄우는 버튼 클릭시 input태그 초기화
	let newdir = $("#newdir");
	let dirInput = $("#foldName");
	newdir.on("click", function(){
		dirInput.val("");
	});

	// 폴더 생성
	let makeFolderBtn = $("#makeFolderBtn");
	let addFFolderModal = $("#AddFoder");

	makeFolderBtn.on("click", function(){
		let dirName = dirInput.val();
		const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		let reg = regExp.test(dirName);
		console.log(reg);
		if(reg){
			console.log("특수문자는 사용할 수 없습니다.");
			return;
		}
		let path = thisPath;
		console.log("makeFolderBtn - thisPath -> ", thisPath);
		let result = fn_createDir(path, dirName);
		$("#folerClose").trigger('click');
	});
	
	// 현재 경로와 생성할 폴더 이름을 파라미터로 받는다.
	// ftp서버에 생성이 완료됐으면 jstree에 자식노드 추가
	// ftp서버에 생성이 완료됐으면 현재 폴더 fn_ajaxMoveDir을 통해 다시 로드
	function fn_createDir(path ,dirName){
		var header = "${_csrf.headerName}";
		var token = "${_csrf.token}";
		$.ajax({
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			url : "/proj/dirDocTest",
			method : "post",
			data : {path : path, dirName : dirName},
			dataType : "json",
			success : function(resp) {
				if(resp){
					fn_ajaxMoveDir(path);
					id++;
					let treeObj = fn_makeTreeObj(id, thisId, dirName);
					treeArea.jstree("create_node", thisId, treeObj, "last");
				}else{
					console.log("같은 이름의 폴더가 존재합니다.");
					return false;
				}
			},
			error : function(errorResp) {
				console.log(errorResp.status);
				console.info("폴더 생성 실패");
			}
		});
		return true;
	}

	// 파일 업로드 
	let AddFile = $("#AddFile");
	let docsFileUploadBtn = $("#docsFileUploadBtn");

	docsFileUploadBtn.on("click", function(){

		console.log("docsFileUploadBtn - thisPath -> ", thisPath);
		fn_uploadAjaxAwait(thisPath);
	});

	async function fn_uploadAjaxAwait(thisPath){
		
		console.log("fn_uploadAjaxAwait - thisPath -> ", thisPath);
		
		

		// docsFileUploadBtn.submit();

		// for(let i=0;i<files.length;i++){

		let docsFile = $("#docsFile");

		// console.log("docsFile[0].files: ", docsFile[0].files);

		// if (docsFile[0].files.length === 0) {
		// 	alert("파일은 선택해주세요");
		// 	return;
		// }
		
		for(let i=0; i < docsFile.length; i++){
			let form = new FormData();
			let files = docsFile[0].files[i];

			console.log("files: ", files);
			
			form.append("docsFile", files);
			form.append("path", thisPath);


			await fn_uploadAjax(form);
		}



		// 	let file = files[i].file;
		// 	form.append("docsFile", file);
		// 	form.append("path", thisPath);
			
		// 	let progressbar = fn_makeProgressTag();
		// 	console.log(progressbar);
		// 	console.log(filebox[i]);
		// 	$(filebox[i]).after(progressbar);
		// 	var promise = fn_uploadAjax(i, form);
		// }

		$("#fileClose").modal("hide");
		$("#docsFile").val("");
		fn_ajaxMoveDir(thisPath);
	}
	
	function fn_uploadAjax(data){
		
		// console.log("fn_uploadAjax - data : ", data);

		// let progressbar = $(".progress-bar");
		// let completeTd = $(".complete-td");
		
		// return new Promise(function(resolve, reject){
		
		var header = "${_csrf.headerName}";
		var token = "${_csrf.token}";
		
		return new Promise(function(resolve, reject){
			$.ajax({
				// xhr: function() {
				// 	var xhr = new window.XMLHttpRequest();
					
				// 	xhr.upload.addEventListener("progress", function(event) {
				// 		if (event.lengthComputable) {
				// 			var percentComplete = event.loaded / event.total;
				// 			percentComplete = parseInt(percentComplete * 100);
							
				// 			$(progressbar[index]).attr("style", "width:"+percentComplete+"%");
				// 			let iconTag = $("<img>").attr("src", "${cPath}/resources/groupware/icon/check.png")
				// 									.attr("class", "icon-img");
				// 			if (percentComplete === 100) {
				// 				$(completeTd[index]).append(iconTag);	
				// 			}
				// 		}
				// 	}, false);
				// 	return xhr;
				// },
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				url : "/proj/uploadFileTest",
				method : "post",
				data : data,
				contentType : false,
				processData : false,
				enctype : 'multipart/form-data',
				dataType : "json",
				success : function(resp) {
					console.log(resp);
					resolve(resp);
				},
				error : function(errorResp) {
					console.log(errorResp.status);
					reject(errorResp);
				}
			});
		});
		
	}

</script>