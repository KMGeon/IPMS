<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link rel="stylesheet" type="text/css"
   href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<!-- END: Page CSS-->
<style type="text/css">
	.ck.ck-editor {
	    max-width: 100%;
	  }
	.ck-editor__editable {
	   min-height: 350px;
	  }
</style>
</head>
<body>
   <!-- BEGIN: Content-->
   <div class="content-wrapper">
      <!--       <div class="content-header row"> -->
      <!--          <div class="content-header-left col-md-6 col-12 mb-2"> -->
      <!--             <h3 class="content-header-title mb-0">NOTICE DETAIL</h3> -->
      <!--          </div> -->
      <!--       </div> -->
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
                           <div class="row">
                              <div class="col-md-12 col-lg-7 col-xl-4 mb-50">
                                 <span class="invoice-id font-weight-bold">No. </span> <span>${svcNotice.siteNtNum}</span>
                              </div>
                              <div class="col-md-12 col-lg-5 col-xl-8">
                                 <div
                                    class="d-flex align-items-center justify-content-end justify-content-xs-start">
                                    <div class="issue-date pr-2">
                                       <span><fmt:formatDate value="${svcNotice.siteNtWriteDate}" pattern="yyyy-MM-dd"/> </span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <!-- invoice logo and title -->
                        <div class="invoice-logo-title row py-2">
                           <div
                              class="col-6 d-flex flex-column justify-content-center align-items-start">
                              <input style="font-family: 'MICEGothic Bold';" value="${svcNotice.siteNtTitle}" id="title">
                           </div>
                        </div>
                        <hr>

                        <!-- 글 내용 -->
                        <div class="row invoice-adress-info py-2">
                           <div class="col-12 mt-1 from-info">
                           	<textarea id="cts">${svcNotice.siteNtCts}</textarea>  
                           </div>
                        </div>
                        <hr>
                       
                        <div style="float: right;">
                           <button type="button" class="btn btn-secondary" id="deleteBtn">
                              <i class="feather icon-trash-2 mr-25 common-size"></i>삭제
                           </button>
                           <button class="btn btn-secondary" id="updateBtn">
                              <i class="feather icon-edit mr-25 common-size"></i>수정
                           </button>
                           <a href="/main/adminSvcNotice" class="btn btn-primary"><i
                              class="fa fa-reply-all mr-25 common-size"></i>목록</a>
                        </div>
                     </div>
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
	<script type="text/javascript">
	$(document).ready(function() {
		//여기 아래 부분
		 ClassicEditor.create( document.querySelector( '#cts' ), {
			    language: "ko",
			    height : 500
			  } )
			  .then( contents => {
			theEditor = contents; // #contents에 있는 값을 theEditor에 넣어놓는다.
		} )
	});
	$("#updateBtn").on("click",function(){
		
		
		let data = {"siteNtNum":"${svcNotice.siteNtNum}",
					"siteNtTitle":$("#title").val(),
					"siteNtCts":theEditor.getData()};
		console.log(data);
		$.ajax({
			 type : 'post',           // 타입 (get, post, put 등등)
			    url : '/main/adminSvcNoticeUpdate',           // 요청할 서버url
			    contentType : "application/json; charset=utf-8",
			    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
			    data : JSON.stringify(data),
			    beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  	},
			    success : function(result) { // 결과 성공 콜백함수
			        console.log(result);
			    	if(result > 0){
			    		window.location = document.referrer;
			    	}else{
			    		alert("에러");
			    	}
			    }
		});
	});
	$("#deleteBtn").on("click",function(){
		let data = {"siteNtNum":"${svcNotice.siteNtNum}"};	
		$.ajax({
			 type : 'post',           // 타입 (get, post, put 등등)
			    url : '/main/adminSvcNoticeDelete',           // 요청할 서버url
			    contentType : "application/json; charset=utf-8",
			    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
			    data : JSON.stringify(data),
			    beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  	},
			    success : function(result) { // 결과 성공 콜백함수
			        console.log(result);
			    	if(result > 0){
			    		window.location = document.referrer;
			    	}else{
			    		alert("에러");
			    	}
			    }
		});
	});
	</script>
</body>
<!-- END: Body-->

</html>