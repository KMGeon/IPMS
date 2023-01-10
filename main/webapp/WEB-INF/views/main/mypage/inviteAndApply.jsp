<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script type="text/javascript"
        src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/join.css">


<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/join.js"></script>
<script src="/resources/js/common.js"></script>
<!DOCTYPE html>
<head>
    <title>마이 페이지 - 초대/신청 현황 조회</title>
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/forms/validation/form-validation.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/pickers/pickadate/pickadate.css">
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/tables/datatable/datatables.min.css">
    <script>
        $(document).ready(function () {
            projectsApplied();
            memberWhoApplied();
            invitationWaitingList();
        });

        function projectsApplied() {
            $.ajax({
                url: "/main/projectsApplied",
                type: "get",
                dataType: "json",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: makeView,
                error: function () {
                    alert("에러");
                }
            });
        }

        function makeView(data) {
            var listHtml = "<table class='table table-bordered'>";
            listHtml += "<tr>";
            listHtml += "<td>번호</td>";
            listHtml += "<td>프로젝트명</td>";
            listHtml += "<td>신청인</td>";
            listHtml += "<td>승인 여부</td>";
            listHtml += "</tr>";

            $.each(data, function (index, obj) {
                listHtml += "<tr>";
                listHtml += "<td>" + (index + 1) + "</td>";
                listHtml += "<td>" + obj.projName + "</td>";
                listHtml += "<td>" + '${mvo.member.memName}' + "</td>";
                listHtml += '<td class="text-truncate"><span class="badge badge-warning">대기중</span>';
                listHtml += "</tr>";
            });
            $("#projectsApplied").html(listHtml);
        }


        function memberWhoApplied() {
            $.ajax({
                url: "/main/memberWhoApplied",
                type: "get",
                dataType: "json",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: memberWhoAppliedView,
                error: function () {
                    alert("에러");
                }
            });
        }

        function memberWhoAppliedView(data) {
            var listHtml = "<table class='table table-bordered'>";
            listHtml += "<tr>";
            listHtml += "<td>번호</td>";
            listHtml += "<td>프로젝트명</td>";
            listHtml += "<td>신청인</td>";
            listHtml += "<td>승인 여부</td>";
            listHtml += "</tr>";

            $.each(data, function (index, obj) {
                let memCode = "'" + obj.memCode + "'";
                let projId = "'" + obj.projId + "'";
                listHtml += "<tr>";
                listHtml += "<td>" + (index + 1) + "</td>";
                listHtml += "<td>" + obj.projName + "</td>";
                listHtml += "<td>" + obj.memName + "</td>";
                listHtml += ' <td class="text-truncate">';
                listHtml += '<button type="button" id="sbscrMmbtn" class="btn btn-success btn-sm" onclick="fn_approve(' + projId + ',' + memCode + ')">승인</button>';
                listHtml += '<button type="button" id="companionButton" class="btn btn-danger btn-sm" onclick="fn_companion(' + projId + ',' + memCode + ' )">반려</button>';
                listHtml += '</td>';
                listHtml += "</tr>";

            });
            $("#memberWhoAppliedView").html(listHtml);
        }

        function fn_approve(projId, memCode) {
            $.ajax({
                url: "/main/approveProject",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("승인완료");
                        setTimeout(function () {
                            location.reload();
                        });
                    } else {
                        alert("실패");
                    }
                }
            });
        }


        function invitationWaitingList() {
            $.ajax({
                url: "/main/invitationWaitingList",
                type: "get",
                dataType: "json",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: invitationWaitingListView,
                error: function () {
                    alert("에러");
                }
            });
        }

        function invitationWaitingListView(data) {
            var listHtml = "<table class='table table-bordered'>";
            listHtml += "<tr>";
            listHtml += "<td>번호</td>";
            listHtml += "<td>프로젝트 이름</td>";
            listHtml += "<td>승인 여부</td>";
            listHtml += "</tr>";

            $.each(data, function (index, obj) {
                let memCode = "'" + obj.memCode + "'";
                let projId = "'" + obj.projId + "'";
                listHtml += "<tr>";
                listHtml += "<td>" + (index + 1) + "</td>";
                listHtml += "<td>" + obj.projName + "</td>";
                listHtml += ' <td class="text-truncate">';
                listHtml += '<button type="button" id="sbscrMmbtn" class="btn btn-success btn-sm" onclick="fn_acceptInvitationBtn(' + projId + ',' + memCode + ')">승인</button>';
                listHtml += '<button type="button" id="companionButton" class="btn btn-danger btn-sm" onclick="fn_refusalInvitation(' + projId + ',' + memCode + ')">반려</button>';
                listHtml += '</td>';
                listHtml += "</tr>";

            });
            $("#invitationWaitingListView").html(listHtml);
        }


        function fn_companion(memCode, projId) {
            console.log(memCode);
            console.log(projId);
            $.ajax({
                url: "/main/projectCompanionship",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("승인완료");
                    } else {
                        alert(${msg});
                    }
                }
            });
        }

        function fn_acceptInvitationBtn(projId, memCode) {
            $.ajax({
                url: "/main/acceptInvitation",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("승인완료");
                    } else {
                        alert(division);
                        alert("실패");
                    }
                    setTimeout(function () {
                        location.reload();
                    });
                }
            });
        }

        function fn_refusalInvitation(projId, memCode) {
            $.ajax({
                url: "/main/refusalInvitation",
                type: "post",
                data: {"memCode": memCode, "projId": projId},
                dataType: "json",
                beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    setTimeout(function () {
                        location.reload();
                    });
                }
            });
        }

    </script>
</head>

<body>

<div class="card" style="width: 1050px;height: 500px;">
    <div class="card-content">
        <div class="card-body" style="width: 100%;">
            <ul class="nav nav-tabs mb-2" role="tablist">
                <li class="nav-item"><a class="nav-link d-flex align-items-center active" id="invite-tab"
                                        data-toggle="tab" href="#invite" aria-controls="invite" role="tab"
                                        aria-selected="true"> <i class="feather icon-user mr-25"></i><span
                        class="d-none d-sm-block">신청한 프로젝트</span>
                </a></li>
                <li class="nav-item"><a class="nav-link d-flex align-items-center" id="apply-tab"
                                        data-toggle="tab" href="#apply" aria-controls="apply" role="tab"
                                        aria-selected="false"> <i class="feather icon-info mr-25"></i><span
                        class="d-none d-sm-block">신청한 회원</span>
                </a></li>
                <li class="nav-item"><a class="nav-link d-flex align-items-center" id="test-tab" data-toggle="tab"
                                        href="#test" aria-controls="ivtProj" role="tab"
                                        aria-selected="false"> <i class="feather icon-info mr-25"></i><span
                        class="d-none d-sm-block">초대된 프로젝트</span>
                </a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="invite" aria-labelledby="invite-tab" role="tabpanel">
                    <!-- users edit account form start -->
                    <form novalidate>
                        <div class="col-xl-8 col-lg-12">
                            <div class="card" style="width: 1000px;">
                                <div class="card-content">
                                    <div class="table-responsive">
                                        <div id="projectsApplied"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="tab-pane" id="apply" aria-labelledby="apply-tab" role="tabpanel">
                    <form novalidate>
                        <div class="col-xl-8 col-lg-12">
                            <div class="card" style="width: 1000px;">
                                <div class="card-content">
                                    <div class="table-responsive">
                                        <div id="memberWhoAppliedView"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- users edit Info form ends -->
                </div>


                <div class="tab-pane" id="test" aria-labelledby="apply-tab" role="tabpanel">
                    <!-- users edit Info form start -->
                    <form novalidate>
                        <div class="col-xl-8 col-lg-12">
                            <div class="card" style="width: 1000px;overflow: auto">
                                <div class="card-content">
                                    <div class="table-responsive">
                                        <div id="invitationWaitingListView"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- users edit Info form ends -->
                </div>


            </div>
        </div>
    </div>
</div>
</section>
</body>

<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/pickers/pickadate/picker.date.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/page-users.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/navs/navs.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/tables/datatables/datatable-styling.js"></script>
<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>