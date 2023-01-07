<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
    <script type="text/javascript"
            src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/GatherCss.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/join.css">


    <script src="/resources/js/jquery-3.6.0.js"></script>
    <script src="/resources/js/join.js"></script>
    <script src="/resources/js/common.js"></script>
    <title>회원가입</title>

    <script>

        function registerCheck() {
            var memEmail = $("#memEmail").val();
            $.ajax({
                url: "/main/memRegisterCheck",
                type: "post",
                data: {"memEmail": memEmail},
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (result) {
                    if (result == 0) {
                        alert("사용 가능한 이메일 입니다.");
                        console.log(result)
                    } else {
                        console.log(result);
                        alert("중복되는 이메일 입니다.");
                        $("#memEmail").val("");
                    }
                }
            });
        }


        function pw_check() {
            var pw = $(".field_memPasswd input").val();                   // 변수 pw에 pw값 대입

            var num = /[0-9]/;
            var eng = /[a-zA-Z]/;
            var spe = /[~!@#$%^&*()_+|<>?:{}]/;


            if (pw.length < 10) {                                  //pw의 길이가 10 이하일 때
                $(".field_pw .txt_guide .txt_case1").css('color', '#b3130b');
            }

            if (pw.length >= 10) {                                  //pw의 길이가 10 이상일 때
                $(".field_pw .txt_guide .txt_case1").css('color', '#0f851a');
            }

            if (num.test(pw) == 0 || eng.test(pw) == 0 || spe.test(pw) == 0) {    // pw의 숫자가 없거나 , 영어가 없거나, 특수문자가 없을경우 실패
                $(".field_pw .txt_guide .txt_case2").css('color', '#b3130b');
            }


            if (num.test(pw) == 1 && eng.test(pw) == 1 && spe.test(pw) == 1) { // pw의 숫자,영어,특수문자가 1개이상씩 있을경우 성공
                $(".field_pw .txt_guide .txt_case2").css('color', '#0f851a');
            }

        }


        function pw2_check() {
            var pwd1 = $(".field_pw input").val();
            var pwd2 = $(".field_repw input").val();

            if (pwd1 != '' && pwd2 == '') {          //둘다 빈칸일 경우 아무것도 하지 않음
                null;
            } else if (pwd1 != "" || pwd2 != "") {     // 빈칸이 아닐 경우
                if (pwd1 == pwd2) {                    // 비교해서 같으면
                    $(".field_repw .txt_guide .txt_case1").css('color', '#0f851a');
                    $(".field_repw .txt_guide .txt_case1").text("비밀번호가 동일합니다.");


                } else {        // 비교해서 같지 않으면
                    $(".field_repw .txt_guide .txt_case1").css('color', '#b3130b');
                    $(".field_repw .txt_guide .txt_case1").text("비밀번호가 일치하지 않습니다.");


                }
            }


        }


    </script>

    <script>

        function on_pw_check() {           //비밀번호 검사 함수
            var pw = $(".field_memPasswd input").val();
            var num = /[0-9]/;
            var eng = /[a-zA-Z]/;
            var spe = /[~!@#$%^&*()_+|<>?:{}]/;
            if (pw.length < 10) {

                alert('비밀번호를 정확히 입력해주세요');
                return false;
            } else if (num.test(pw) == 0 || eng.test(pw) == 0 || spe.test(pw) == 0) {

                alert('비밀번호를 정확히 입력해주세요');
                return false;
            } else {

                return true;
            }
        }

        function on_pw2_check() {           //비밀번호 확인 검사 함수
            var pw = $(".field_memPasswd input").val();
            var pw2 = $(".field_memPasswd2 input").val();
            if (pw2.length == 0) {

                alert('비밀번호 확인을 다시해주세요');
                return false;
            } else if (pw != pw2) {

                alert('비밀번호 확인을 다시해주세요');
                return false;
            } else {

                return true;
            }
        }

        function on_name_check() {             //이름 검사 함수
            var name = $(".field_memName input").val();
            if (name.length == 0) {

                alert('이름을 입력해주세요');
                return false;
            } else {

                return true;
            }
        }

        function on_email_check() {             //이메일 검사 함수
            var email = $(".field_memEmail input").val();
            if (email.length == 0) {

                alert('이메일을 정확히 입력해주세요');
                return false;
            } else {

                return true;
            }
        }

        function on_phone_check() {               //휴대폰번호 검사함수
            var phone = $(".field_memPhoneNumber input").val();
            if (phone.length == 0) {

                alert('휴대폰 번호를 입력해주세요');
                return false;
            } else {

                return true;
            }
        }


        function on_submit_check() {               // fomr에 onsubmit으로 최종적으로 넘겨야될 함수
            var check = false;                   //check변수에 false를 넣어주고 다른 함수들이 false를 반환하면 다음페이지로 못넘어가게 설정
            if (on_pw_check() == check) {
                return false;
            } else if (on_pw2_check() == check) {
                return false;
            } else if (on_name_check() == check) {
                return false;
            } else if (on_email_check() == check) {
                return false;
            } else if (on_phone_check() == check) {
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body>
<div id="container">
    <div id="main">
        <div id="content">
            <div class="page_aticle">
                <div class="type_form member_join">
                    <form class="form-horizontal form-simple" action="/main/signUpForm" method="post">
                        <div class="field_head">
                            <h3 class="tit">회원가입</h3>
                            <p class="sub">
                                <span class="ico">*</span>
                                필수입력사항
                            </p>
                        </div>
                        <table class="tbl_comm">
                            <tbody>
                            <tr class="fst field_id">
                                <th>아이디
                                    <span class="ico">
                                                *
                                                <span class="screen_out">필수항목</span>
                                            </span>
                                </th>
                                <td>
                                    <input type="text" id="memEmail" name="memEmail" maxlength="40" req
                                           placeholder="이메일 형식을 맞춰서 입력하세요.">
                                    <button type="button" id="fchgBtn"
                                            class="btn btn-success btn-min-width mr-1 mb-1" onclick="registerCheck()"
                                            style="float: right;width: 30px;display: block">중복체크
                                    </button>
                                    <p class="txt_guide square">
                                                <span class="
">
                                                    예)ipms1234@naver.com
                                                </span>
                                        <span class="txt txt_case2">
                                                    아이디 중복확인
                                                </span>
                                    </p>
                                </td>
                            </tr>

                            <tr class="field_pw">
                                <th>
                                    비밀번호
                                    <span class="ico">*
                                                <span class="screen_out">필수항목</span>
                                            </span>
                                </th>
                                <td>
                                    <input type="password" name="memPasswd" option="regPass" value="123412341234!"
                                           onkeyup="pw_check()"
                                           maxlength="16" class="reg_pw bad" placeholder="비밀번호를 입력해주세요">
                                    <p class="txt_guide square">
                                                <span class="txt txt_case1">
                                                    10자 이상 입력
                                                </span>
                                        <span class="txt txt_case2">
                                                    영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합
                                                </span>
                                    </p>
                                </td>
                            </tr>

                            <tr class="member_pwd field_repw">
                                <th>
                                    비밀번호확인
                                    <span class="ico">
                                                *
                                                <span class="screen_out">필수항목</span>
                                            </span>
                                </th>
                                <td>
                                    <input type="password" name="memPasswd2" option="regPass" onkeyup="pw2_check()"
                                           value="123412341234!"
                                           maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
                                    <p class="txt_guide square">
                                                <span class="txt txt_case1">
                                                    동일한 비밀번호를 입력해주세요.
                                                </span>
                                    </p>
                                </td>
                            </tr>

                            <tr class="field_name">
                                <th>
                                    이름
                                    <span class="ico">
                                                *
                                                <span class="screen_out">필수항목</span>
                                            </span>
                                </th>
                                <td>
                                    <input type="text" name="memName" label="이름" placeholder="이름을 입력해주세요">
                                </td>
                            </tr>


                            <tr class="field_phone">
                                <th>
                                    휴대폰
                                    <span class="ico">
                                                *
                                                <span class="screen_out">필수항목</span>
                                            </span>
                                </th>

                                <td>
                                    <div class="phone_num">
                                        <input type="text" value="" pattern="[0-9]*" name="memPhoneNumber"
                                               placeholder="숫자만 입력해주세요" class="inp">

                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <label>기술 스택</label>
                                </th>
                                <td>
                                    <select name="selectedBox" class="select2 form-control select2-hidden-accessible" multiple data-select2-id="12" tabindex="-1" aria-hidden="true"
                                            onchange="handleOnChange(this)">
                                        <optgroup label="보유한 기술 스택을 선택하세요.">
                                            <c:forEach var="item" items="${list}" varStatus="idx">
                                                ${idx.count}
                                                <option value="${item.commonCodeValue}" name="techStackVOList[${idx.count-1}].techStackCode">${item.commonCodeValue}</option>
                                            </c:forEach>
                                                <input type="hidden" id="techCode" name="techStackVOList[0].techStackCode" value=""/>
                                        </optgroup>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <input type="hidden" name="memAuthList[0].memAuth" value="ROLE_MEMBER"/>
                        <sec:csrfInput/>
                        <div id="formSubmit" class="form_footer" style="border-top: 1px solid #333;">
                            <button type="submit" class="btn active btn_join">가입하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function handleOnChange(ph) {
        const values = [];
        const texts = [];
        var opts = ph.options;
        for (i = 0; i < opts.length; i++) {
            if (opts[i].selected) {
                values.push(opts[i].value);
                texts.push(opts[i].value);
            }
        }
        $("#techCode").val(values);
        console.log(values);
    }
</script>
</html>

<!-- BEGIN: Page Vendor JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>

<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/toggle/switchery.min.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>

<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/account-setting.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/forms/select/form-select2.js"></script>