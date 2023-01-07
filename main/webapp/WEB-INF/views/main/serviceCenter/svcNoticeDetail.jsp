<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
   href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- BEGIN: Body-->

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
                              <h2 class="text-primary"
                                 style="font-family: 'MICEGothic Bold';">${svcNotice.siteNtTitle}</h2>
                              <span>관리자</span>
                           </div>
                        </div>
                        <hr>

                        <!-- 글 내용 -->
                        <div class="row invoice-adress-info py-2">
                           <div class="col-6 mt-1 from-info">
                            ${svcNotice.siteNtCts}
                           </div>
                        </div>
                        <hr>
                       
                        <div style="float: right;">
                           <a href="javascript:history.back()" class="btn btn-primary"><i
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
   <script
      src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-invoice.js"></script>
   <!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>