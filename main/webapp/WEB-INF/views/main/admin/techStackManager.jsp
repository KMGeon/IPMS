<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<!DOCTYPE html>
<head>
    <script type="text/javascript" src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#addBtn").on("click", function () {
                $("#addInputBtn").css("display", "block");
            });
        });

        function fn_addStack() {
            let commonCodeValue = $("#commonCodeValue").val();
            let commonCodeEplntn = $("#commonCodeEplntn").val();
            $.ajax({
                type: 'post',
                url: '/main/addSkillStack',
                dataType: 'json',
                data: {"commonCodeValue": commonCodeValue , "commonCodeEplntn":commonCodeEplntn},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    if (data == 1) {
                        alert("추가 되었습니다.");
                        setTimeout(function () {
                            location.reload();
                        });
                    } else {
//                         alert(data);
                    }
                }
            });
        }

        function fn_techDelete(param) {

            $.ajax({
                type: 'post',
                url: '/main/clearSkillStack',
                dataType: 'json',
                data: {"commonCodeValue": param},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    if (data == 1) {
                        alert("삭제 되었습니다.");
                        setTimeout(function () {
                            location.reload();
                        });
                    } else {
//                         alert(data);
                    }
                }
            });
        }
    </script>

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->

<body>
<!-- BEGIN: Content-->
<section class="row all-contacts">
    <div class="col-12">
        <div class="card" style="width: 1000px;">
            <div class="card-content" style="width: 1000px;">
                <div class="card-body">
                    <!-- Task List table -->
                    <div class="table-responsive">
                        <h3 style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">기술 스텍 관리</h3>
                        <br>
                        <table id="users-contacts"
                               class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle text-center">
                            <colgroup>
                                <col width="10%">
                                <col width="80%">
                                <col width="10%">
                            </colgroup>
                            <thead style="background: #3F4E89; color: white;">
                            <tr>
                                <th>번호</th>
                                <th>기술 스텍</th>
                                <th>삭제 버튼</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${list}" varStatus="idx">
                                <tr>

                                    <td class="text-center">${idx.count}</td>
                                    <td>${item.commonCodeValue}</td>
                                    <td style="text-align:center;">
                                        <button class="btn btn-danger btn-sm"
                                                onclick="fn_techDelete('${item.commonCodeValue}')">삭제
                                        </button>
                                    </td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="row" style="margin: auto; padding-top:5px;">
                            <div class="col-sm-12 col-md-7">
                                <div style="float: left;">
                                    <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#success"
                                            style="background-color: #546E7A; color: white;">추가하기
                                    </button>
<%--                                    <button type="button" class="btn btn-sm" data-toggle="modal" data-target="#success" style="margin-bottom: 50px;">신청 목록 보기</button>--%>
                                </div>
                                <div class="dataTables_paginate paging_simple_numbers"
                                     id="DataTables_Table_0_paginate" style="padding-left: 455px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade text-left" id="success" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel9" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-secondary white">
                    <h4 class="modal-title" id="myModalLabel9" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">기술 스텍 추가하기</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table table-hover mb-0 ps-container ps-theme">
                        <thead>
                        <tr>
                            <th>기술 스텍</th>
                            <th>소개</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="text" id="commonCodeValue" name="commonCodeValue" class="form-control" placeholder="기술 스텍"></td>
                            <td><input type="text" id="commonCodeEplntn" name="commonCodeEplntn" class="form-control" placeholder="소개"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn grey btn-outline-secondary" onclick="fn_addStack()">등록</button>
                    <button type="button" class="btn grey btn-outline-secondary" data-dismiss="modal">닫기
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<!-- END: Body-->

</html>
