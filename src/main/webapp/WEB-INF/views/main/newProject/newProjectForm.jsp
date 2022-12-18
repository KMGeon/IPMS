<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
      content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
      content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Gallery Hover Effects - Stack Responsive Bootstrap 4
    Admin Template</title>
<link rel="apple-touch-icon"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link
        href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
        rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
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
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/gallery.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style type="text/css">

    .btn btn-secondary round btn-min-width mr-1 mb-1 {
        background-color: #448AFF;
    }

    .jqstooltip {
        position: absolute;
        left: 0px;
        top: 0px;
        visibility: hidden;
        background: rgb(0, 0, 0) transparent;
        background-color: rgba(0, 0, 0, 0.6);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
        endColorstr=#99000000);
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
        color: white;
        font: 10px arial, san serif;
        text-align: left;
        white-space: nowrap;
        padding: 5px;
        border: 1px solid white;
        z-index: 10000;
    }

    .jqsfield {
        color: white;
        font: 10px arial, san serif;
        text-align: left;
    }
</style>

<script>
    $(document).ready(function () {
        $("#projName").change(function () {
            var to = $("#projName").val();
            $("#to").attr("value", to);
            console.log(to);
            $("#teamId").val(to);
        })

    })
</script>
</head>
<div class="row">
    <div class="col-md-6" style="display: flex; float: left; width: 1000px;">
        <div class="card-content collapse show">
            <div class="card-body">
                <div class="offset-1">
                    <br/><br/><br/><br/>
                    <div class="pace  pace-inactive">
                        <div class="pace-progress" data-progress-text="100%"
                             data-progress="99"
                             style="transform: translate3d(100%, 0px, 0px);">
                            <div class="pace-progress-inner"></div>
                        </div>
                        <div class="pace-activity"></div>
                    </div>
                    <div class="content-body offset-2 ">
                        <div class="card-content collapse show ">
                            <div class="grid-hover"
                            ">
                            <div class="col-md-6 ml-5" style="width: 1000px; height: 800px;">
                                <div><i class="feather icon-image">&nbsp;</i><b>대표 이미지</b></div>
                                <figure class="effect-romeo" style="width: 120%">
                                    <img src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/18.jpg"
                                         alt="img18">
                                    <figcaption>
                                        <h2>
                                            Wild <span>Romeo</span>
                                        </h2>
                                        <p>Romeo never knows what he wants. He seemed to be very
                                            cross about something.</p>
                                        <a href="#">View more</a>
                                    </figcaption>
                                </figure>
                                <br/><br/>

                                <div style=" text-align: center; padding-left:20px; ">
                                    <button type="button" class="btn btn-secondary ml-5"
                                            style="padding:11px 60px; background-color: #448AFF; color: white;"><i
                                            class="feather icon-settings">&nbsp;&nbsp;</i>대표이미지 설정
                                    </button>
                                    <br/><br/>
                                </div>
                                <form action="/main/uploadFormAction" method="post" enctype="multipart/form-data">
                                    <%--										?${_csrf.parameterName}=${_csrf.token}--%>
                                    <input type='file' name='uploadFile' multiple/>
                                    <input type='submit' value="전송"/>
                                    <sec:csrfInput/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-md-6" style="margin-top: 70px;">
    <form action="/main/newProjectPost" method="post">
        <div class="card" style="width:80%">
            <div class="card-header">
                <h4 class="card-title">프로젝트 생성</h4>
                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="collapse"><i class="feather icon-minus"></i></a></li>
                        <li><a data-action="reload"><i class="feather icon-rotate-cw"></i></a></li>
                        <li><a data-action="expand"><i class="feather icon-maximize"></i></a></li>
                        <li><a data-action="close"><i class="feather icon-x"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content collpase show">
                <div class="card-body">

                    <form class="form">
                        <div class="form-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="projName">Project Name</label>
                                        <input type="text" id="projName" class="form-control border-primary"
                                               placeholder="Project Name" name="projName" value=""/>
                                        <input type="hidden" id="teamId" name="teamId"/>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div style="float: left">
                                            <label for="projStrtDate">Project Start Date</label>
                                            <input type="date" id="projStrtDate" class="form-control border-primary"
                                                   placeholder="Start Date" name="projStrtDate"/>
                                        </div>
                                        <div style="float:right;">
                                            <label for="projEndDate">Project End Date</label>
                                            <input type="date" id="projEndDate" class="form-control border-primary"
                                                   placeholder="End Date" name="projEndDate"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h4 class="form-section"><i class="feather icon-mail"></i> 프로젝트 소개</h4>

                            <div class="form-group">
                                <label for="userinput8" class="sr-only">프로젝트 소개</label>
                                <textarea id="userinput8" rows="5" class="form-control" name="projSmry"
                                          placeholder="소개"></textarea>
                            </div>

                        </div>

                        <div class="form-actions right">

                            <input type="submit" class="btn btn-outline-warning mr-1" value="등록"/>
                        </div>
                        <input type="hidden" name="memAuthList[0].memAuth" value="ROLE_MEMBER"/>
                        <input type="hidden" name="memAuthList[1].memAuth" value="ROLE_PROJECT_LEADER"/>
                        <sec:authorize access="isAuthenticated()">
                            <input type="hidden" name="memEmail"
                                   value="<sec:authentication property="principal.username"/>"/>
                            <input type="hidden" name="memCode" value="${mvo.member.memCode}"/>
                            <input type="hidden" name="" value="${mvo.member}"/>

                        </sec:authorize>
                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>

        <!-- BEGIN: Footer-->

        <!-- END: Footer-->


        <!-- BEGIN: Vendor JS-->
        <script
                src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <script
                src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
        <script
                src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script
                src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
        <script
                src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script
                src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
        <!-- END: Page JS-->
        </body>
        <!-- END: Body-->
        </html>




