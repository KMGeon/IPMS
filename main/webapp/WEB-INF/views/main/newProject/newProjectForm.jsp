<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<head>
    <title>주문 하기</title>
    <link rel="stylesheet" type="text/css" href="/resources/GatherCss.css">
    <script src="/resources/GatherJs.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/join.css">
    <link rel="stylesheet" href="/resources/css/order.css">

    <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
    <script src="/resources/js/jquery-3.6.0.js"></script>
    <script src="/resources/js/order.js"></script>
    <script src="/resources/js/join.js"></script>
    <script src="/resources/js/common.js"></script>
    <script>
    </script>
</head>
<body>
<div id="wrap">
    <div id="container">
        <div id="main">
            <div id="content">
                <div class="user_form">
                    <h1 class="h1_tit">프로젝트 생성</h1>

                    <h2 class="tit_section fst">
                        대표 이미지
                    </h2>
                    <div id="itemList" class="page_aticle order_goodslist">
                        <ul class="list_product">
                            <li>
                                <div class="name">
                                    <div class="inner_name">
                                        <form action="/main/newProjectPost" method="post" enctype="multipart/form-data">
                                            <input type='file' name='uploadFile' multiple/>
                                    </div>
                                </div>

                            </li>
                        </ul>
                    </div>


                    <h2 class="tit_section" id="titFocusOrderer">프로젝트 세부 정보</h2>
                    <div class="order_section data_orderer">
                        <table class="goodsinfo_table">
                            <tbody>
                            <tr class="fst">
                                <th>프로젝트 이름</th>
                                <td>
                                    <input type="text" id="projName" class="form-control border-primary"
                                           placeholder="프로젝트 이름" name="projName" value=""/>
                                </td>
                            </tr>

                            <tr>
                                <th>프로젝트 기간</th>
                                <td>
                                    <div style="float: left">
                                        <input type="date" id="projStrtDate"
                                               class="form-control border-primary"
                                               placeholder="Start Date" name="projStrtDate"/>
                                    </div>
                                    <div style="float:left;">
                                        <input type="date" id="projEndDate"
                                               class="form-control border-primary"
                                               placeholder="End Date" name="projEndDate"/>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <h2 class="tit_section" id="divAddressWrapper">프로젝트 내용
                        <span class="desc">기본적인 프로젝트에 대한 소개를 작성하세요. </span>
                    </h2>

                    <div class="order_section order_address" id="dataDelivery">
                        <div class="form-group col-12 mb-2">
                                <textarea id="userinput8" rows="5" class="form-control" name="projSmry"
                                          placeholder="소개"></textarea>
                        </div>
                    </div>
                    <div class="data_method" style="margin-left: 150px;">
                        <h2 class="tit_section" id="titFocusMethod">Precautions when writing</h2>
                        <table class="goodsinfo_table tbl_left">
                            <tbody>
                            <tr>

                                <th>
                                    <label class="label_radio" id="cardBenefit_kakaopay">
                                        <span id="kakaopay">주의사항</span>
                                    </label>
                                </th>
                                <td>
                                    욕설과 타인을 비난 평가하는 내용이 포함시 해당 프로젝트는 관리자에 의하여 삭제됩니다.
                                </td>
                            </tr>
                            </tbody>
                        </table>
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
                    <div class="tit_section" style="margin-left: 400px;">
                        <input type="submit" value="등록하기" class="btn btn-secondary" style="width: 280px;height: 50px;;">
                    </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    CKEDITOR.replace('userinput8');
</script>