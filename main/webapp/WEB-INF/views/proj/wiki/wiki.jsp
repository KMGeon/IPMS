<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
<link rel="stylesheet" href="/resources/zTree/css/zTreeStyle/zTreeStyle.css">
<script src="/resources/js/html2pdf.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
<script src="/resources/zTree/js/jquery.ztree.core.min.js"></script>
<style>
	searchWikiId {
		max-width: 30%%;
	}
</style>
<div class="app-content">
	<div class="row">
		<div class="col-4">
		<select class="form-control" name="highWikiId" id="searchWikiId">
			<option value="" selected>검색</option>
				<c:forEach items="${highWikiId}" var="id">
						<option value="${id.wikiId}">${id.wikiTitle}</option>				
				</c:forEach>
		</select>
		</div>
		<div class="col-4">
		<button type="button" id="searchBtn" class="btn btn-icon btn-secondary mr-1 mb-1"><i class="ficon feather icon-search"></i>검색</button>
		
		</div>
		</div>
	<div class="row">
		<div class="col-10">
		<div class="form-group">
			</div>
			<c:if test="${wikiDetail eq null}">
			<h1>wiki등록된 태그들 입니다</h1>
			<hr>
			<c:forEach items="${list}" var="wiki" varStatus="stat">	
					<h4><a href="?wikiId=${wiki.wikiId}">${wiki.wikiTitle}</a></h4>
					<br>
			</c:forEach>
			</c:if>
			<c:if test="${wikiDetail ne null}">
			<div id="pdf_canvas">
			<h1>${wikiDetail.wikiTitle}</h1>
			<hr>
			<div style="font-size: large;">${wikiDetail.wikiCts}</div>
			</div>
<!-- 			<a class="btn btn-icon btn-secondary mr-1 mb-1" href="javascript:fn_download()">PDF다운로드</a> -->
			<a class="btn btn-warning" href="/proj/${projId}/updateWiki?wikiId=${wikiDetail.wikiId}">수정</a>
			<a class="btn btn-danger" href="/proj/${projId}/wikiDelete?wikiId=${wikiDetail.wikiId}">삭제</a>
			<hr>
				<c:if test="${list ne null}">
					<c:forEach items="${list}" var="wiki" varStatus="stat">			
							<h4><a href="?wikiId=${wiki.wikiId}">${wiki.wikiTitle}</a></h4>
							<br>
					</c:forEach>
				</c:if>
				
			</c:if>
		</div>

		<div class="col-2 float-right">
			<a href="/proj/${projId}/wikiInsert" class="btn btn-secondary square btn-min-width mr-1 mb-1"
				 >위키 등록</a>
				
<!-- 			<div id="tree"></div> -->
			<div id="treeContent" style="position: absolute;">
			<ul id="tree" class="ztree"></ul>
			</div>
		</div>
		
	</div>
</div>

<script>
	$(window).scroll(function(){
	    var position = $(document).scrollTop();
	    $("#treeContent").css('top',  position+45 );     
	});
	
	var treeArray = new Array();
	$('select').select2();
	 $.ajax({
		type: "post",
        url: "/proj/${projId}/wikiTree",
        dataType: "json",
        async: false,
        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	  },
        success: function(data) {
          console.log("통신데이터 값 : " + JSON.stringify(data));
          treeArray.push({id:"-1",name:"위키홈",web:"/proj/${projId}/wiki"});
		  for(var i=0; i<data.length ;i++){
			if(data[i].highWikiId == null){
				treeArray.push({id:data[i].wikiId,name:data[i].wikiTitle.replaceAll("&nbsp;","").replaceAll("-",""),web:"?wikiId="+data[i].wikiId,open:true});
			}else{
				treeArray.push({id:data[i].wikiId,pId:data[i].highWikiId, name:data[i].wikiTitle.replaceAll("&nbsp;","").replaceAll("-",""),web:"?wikiId="+data[i].wikiId,open:true});
			}
			 var setting = {
				        data: {
				            simpleData: {
				                enable: true,
				            }
				        },
				        view: {
				            showIcon: false,
				            dblClickExpand: false
				          },
				        callback: {
				            beforeClick: beforeClick  // 마우스 클릭 콜백함수 지정
				        }
				    };
			    function beforeClick(treeId, treeNode, clickFlag) {
			        location.href=treeNode.web;
			    }
						  $.fn.zTree.init($("#tree"), setting, treeArray);
		}
        }
	
	})
	
	
	$("#searchBtn").on("click",function(){
		location.href = "?wikiId="+$("#searchWikiId option:selected").val();
	});

// 	 function fn_download(){
// 		 console.log("PDF 다운로드");
// 			// Get the element.
// 			var element = document.getElementById('pdf_canvas');

// 			// Generate the PDF.
// 			html2pdf().from(element).set({
// 				margin: 1,
// 				filename: '${wikiDetail.wikiTitle}.pdf',
// 				html2canvas: { scale: 1 },
// 				jsPDF: {orientation: 'portrait', unit: 'mm', format: 'a4', compressPDF: true}
// 			}).save();
// 	 }

const folderArray =[
    { id : "1", name:"최상위1" },
    { id : "11", pId : "1", name:"최상위1의 하위1"},
    { id : "12", pId : "1", name:"최상위1의 하위2"},
    { id : "2", name:"최상위2" },
    { id : "21", pId : "2", name:"최상위2의 하위1"},
    { id : "22", pId : "2", name:"최상위2의 하위2"},
];



console.log("treeArray: ",JSON.stringify(treeArray))	




// 	$("#tree").jstree({
// 		"core" : {
// 			"themes" : {
// 				"responsive" : true
// 			},
// 			// so that create works
// 			"check_callback" : true,
// 			'data' : [ {
// 				"text" : "Parent Node",
// 				"a_attr" : {
// 					"href" : "google.com"
// 				},
// 				"children" : [ {
// 					"text" : "Initially selected",
// 					"a_attr" : {
// 						"href" : "google.com"
// 					},
// 					"state" : {
// 						"selected" : true
// 					}
// 				}, {
// 					"text" : "Custom Icon",
// 					"a_attr" : {
// 						"href" : "google.com"
// 					},
// 					"icon" : "feather icon-align-left"
// 				}, {
// 					"text" : "Initially open",
// 					"icon" : "fa fa-folder text-success",
// 					"a_attr" : {
// 						"href" : "google.com"
// 					},
// 					"state" : {
// 						"opened" : false
// 					},
// 					"children" : [ {
// 						"text" : "Another node",
// 						"icon" : "fa fa-file text-waring",
// 						"a_attr" : {
// 							"href" : "google.com"
// 						},
// 					} ]
// 				}, {
// 					"text" : "Another Custom Icon",
// 					"a_attr" : {
// 						"href" : "google.com"
// 					},
// 					"icon" : "fonticon-link text-waring fs-4"
// 				}, {
// 					"text" : "Disabled Node",
// 					"a_attr" : {
// 						"href" : "google.com"
// 					},
// 					"icon" : "fa fa-check text-success",
// 					"state" : {
// 						"disabled" : true
// 					}
// 				}, {
// 					"text" : "Sub Nodes",
// 					"a_attr" : {
// 						"href" : "google.com"
// 					},
// 					"icon" : "fa fa-folder text-danger",
// 					"children" : [ {
// 						"text" : "Item 1",
// 						"icon" : "fa fa-file text-waring"
// 					}, {
// 						"text" : "Item 2",
// 						"icon" : "fa fa-file text-success"
// 					}, {
// 						"text" : "Item 3",
// 						"icon" : "fa fa-file text-default"
// 					}, {
// 						"text" : "Item 4",
// 						"icon" : "fa fa-file text-danger"
// 					}, {
// 						"text" : "Item 5",
// 						"icon" : "fa fa-file text-info"
// 					} ]
// 				} ]
// 			} ]
// 		},
// 		"types" : {
// 			"default" : {
// 				"icon" : "fa fa-folder text-primary"
// 			},
// 			"file" : {
// 				"icon" : "fa fa-file  text-primary"
// 			}
// 		},
// 		"state" : {
// 			"key" : "demo2"
// 		},
// 		"plugins" : [ "contextmenu", "state", "types" ]
// 	});
// 	$("#tree").on("click", ".jstree-anchor", function(evt) {
// 		var link = $(evt.target).attr("href");
// 		location.href = link;
// 	});
</script>
