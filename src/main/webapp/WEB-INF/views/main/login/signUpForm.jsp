<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/login-register.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
    function registerCheck(){

        var memEmail =$("#memEmail").val();

        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (memEmail.match(regExp) != null) {
            alert('Good!');
        }
        else {
            alert('이메일 형식으로 입력하세요.');
            return false;
        }

        if(memEmail==""){
            $("#passMessage").html("이메일을 다시 입력하세요.");
            $("#passMessage").css("color", "red");
            return false;
        }
        $.ajax({
            url:"/main/memRegisterCheck",
            type:"get",
            data: {"memEmail": memEmail},
            success: function (result) {
                if (result == 0) {
                    $("#passMessage").html("이메일 사용이 가능합니다.");
                    $("#passMessage").css("color", "blue");
                    console.log(result)
                    $("#btn").css('display', 'block');
                    $("#chgBtn").css('display', 'none');
                } else {
                    $("#passMessage").html("이메일을 다시 입력하세요.");
                    $("#passMessage").css("color", "red");
                    console.log(result);
                    $("#memEmail").val("");
                }
            }
        });
    }


    $("select[name=location]").change(function(){
        console.log($(this).val()); //value값 가져오기
        console.log($("select[name=location] option:selected").text()); //text값 가져오기
    });

    $(document).ready(function () {
        $("#memEmail").change(function () {
            var to = $("#memEmail").val();
            $("#to").attr("value", to);
            console.log(to);
        })

        $("#selectBoxChange").change(function(){
            console.log("변경"+$(this).val());
        })
    })

    $(function () {
        const randomNumber = Math.floor(Math.random() * 8888)+1;
        $('input[name=text]').attr('value',randomNumber);
        let text1 = $("#text").val();
        let memEmail ;
        let to = $("#to").val();
        to= $("#memEmail").val();
        // let text1 = randomNumber;
        let text2;
        $("#btn").on("click", function () {
            to= $("#memEmail").val();
            alert("Click");
            console.log("to::"+to);
            let fData = $("#frm").serialize();

            $.ajax({
                url: "/sendMailProcess",
                type: "post",
                data: fData,
                beforeSend : function(xhr) {   // 데이터 전송 전  헤더에 csrf값 설정
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) { //여기서 data는 controller에 list이다.
                    $("#hideEmail").css('display','block');
                },
                error:function(){
                    alert("오류입니다.");
                    $("#hideEmail").css('display','none');
                }
            })
        })
        $("#btn2").on("click", function () {
            text2= $("#emailNum1").val();
            console.log("text2::" + text1);
            console.log("text5::" + text2);
            if(text1==text2){
                alert("인증 성공");
                $("#pwdForm1").css('display','block');
                $("#pwdForm2").css('display','block');

            }else{
                alert("인증 실패");
            }
        });
        let pwd1 = $("#newPwd1").val();
        let pwd2 = $("#newPwd2").val();
    })
    $(function () {
        $("#emailBtn").on("click", function () {
            $("#hideEmail").css("display", 'block');
        });
    });



    function passwordCheck() {
        var password = $("#memPasswd").val();
        var password2 = $("#paswd2").val();
        if (password != password2) {
            $("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
            $("#passMessage").css("color", "red");
            $("#password").attr("value", "$#@!");
            $("#sbtBtn").css('display', 'none');
            return false;
        } else {
            $("#passMessage").html("비밀번호가 서로 같습니다..");
            $("#passMessage").css("color", "blue");
            $("#sbtBtn").css('display', 'block');
            return true;
        }
    }
    $(function (){
        $("#chgBtn")
    })

    function handleOnChange(e) {
        var arr = [6];
        // 선택된 데이터 가져오기
        const value = e.value;
        for(i=0;i<arr.length;i++) {
            arr[i] = value;
        }
        for(i=0;i<arr.length;i++) {
        console.log(arr[i]);
        }
    }

    function checkReg(){
        var reg = /^[가-힣]{2,4}$/; //한글 2~3
        var reg = "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";//최소 8 자, 하나 이상의 문자와 하나의 숫자 정규식
        var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
    }


</script>
<!-- END: Custom CSS-->


<!-- BEGIN: Content-->

<div class="app-content container center-layout mt-2">
    <div class="content-wrapper">
        <div class="content-header row"></div>
        <div class="content-body">
            <section class="row flexbox-container">
                <div class="col-12 d-flex align-items-center justify-content-center">
                    <div class="col-lg-4 col-md-8 col-10 box-shadow-2 p-0" style="margin-top:auto">
                        <div class="card border-grey border-lighten-3 px-2 py-2 m-0">
                            <div class="card-header border-0">
                                <div class="card-title text-center">
                                    <img src="/resources/logoImage/logo.jpg" alt="branding logo"
                                         style="width: 100px; height: auto;">
                                </div>
                                <h6
                                        class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2">
                                    <span>Create Account</span>
                                </h6>
                            </div>
                            <div class="card-content" >
                                <div class="card-body">
                                    <form class="form-horizontal form-simple" action="/main/signUpForm" method="post" novalidate>
                                        <fieldset
                                                class="form-group position-relative has-icon-left mb-1">
                                            <input type="text" class="form-control form-control-lg"
                                                   id="name" name="memName" placeholder="이름" required="required">
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset
                                                class="form-group position-relative has-icon-left mb-1">

                                            <div >
                                                <input type="text" class="form-control form-control-lg"  id="memEmail"  name="memEmail" placeholder="이메일" required="required">

                                                <button type="button" id="chgBtn"  class="btn btn-success btn-min-width mr-1 mb-1" onclick="registerCheck()"  style="float: right;width: 30px;display: block">중복체크</button>
                                                <button type="button" id="btn"  class="btn btn-info btn-min-width mr-1 mb-1"  style="float: right;width: 30px;display: none">인증번호 전송</button>
                                            </div>
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group position-relative has-icon-left mb-1" id="hideEmail"
                                                  style="display: none">

                                            <input type="password" class="form-control form-control-lg"
                                                   style="float: left; width: 60%" id="emailNum1" name="emailNum1"
                                                   placeholder="이메일 인증번호" required="required">
                                            <button type="button" id="btn2"
                                                    class="btn btn-success btn-min-width mr-1 mb-1"
                                                    style="float: right;width: 30px;">인증번호 확인
                                            </button>

                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group position-relative has-icon-left mb-1">
                                            <input type="text" class="form-control form-control-lg" id="memPhoneNumber" name="memPhoneNumber" placeholder="010xxxxyyyy" maxlength="11" required="required"><div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset
                                                class="form-group position-relative has-icon-left mb-1">
                                            <input type="text" class="form-control form-control-lg" id="memPasswd"
                                                   name="memPasswd" placeholder="비밀번호" onkeyup="passwordCheck()"
                                                   required="required">
                                            <div class="form-control-position">
                                                <i class="fa fa-key"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset
                                                class="form-group position-relative has-icon-left mb-1">
                                            <input type="password" class="form-control form-control-lg" id="paswd2"
                                                   name="paswd2" placeholder="비밀번호 확인" onkeyup="passwordCheck()"
                                                   required="required">
                                            <div class="form-control-position">
                                                <i class="fa fa-key"></i>
                                            </div>
                                        </fieldset>

                                        <fieldset class="form-group position-relative has-icon-left">
                                            <div>
                                                <!-- ======================================-->
                                            </div>
                                        </fieldset>
                                        <fieldset>

                                                        <label>기술 스택</label>
                                                        <select class="select2 form-control select2-hidden-accessible" onchange="handleOnChange(this)" multiple data-select2-id="12" tabindex="-1" aria-hidden="true" aria-invalid="false">
                                                        <optgroup label="보유한 기술 스택을 선택하세요." data-select2-id="25">
                                                            <option value="spring" data-select2-id="26">SPRING</option>
                                                            <option value="vue" data-select2-id="27">Vue</option>
                                                            <option value="js" data-select2-id="28">JS</option>
                                                            <option value="mysql" data-select2-id="29">MYSQL</option>
                                                        </optgroup>
                                                    </select>
                                        </fieldset>

                                        <div>
                                            <span id="passMessage" style="color: red"/>
                                        </div>
<%--                                        <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}">--%>
                                        <button type="button" id="sbtBtn" name="sbtBtn"
                                                class="btn btn-primary btn-lg btn-block" onclick="checkReg()" style="display:none;">
                                            <i class="feather icon-unlock"></i> Register
                                        </button>
                                        <input type="hidden" name="memAuthList[0].memAuth" value="ROLE_MEMBER"/>
                                        <sec:csrfInput/>
                                    </form>
                                </div>
                                <p class="text-center">모든 정보를 입력하세요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<!-- END: Content-->
<!-- 이메일 -->
<div style="display:none;">
    <%--	<div>--%>
    <%--		<input type="button" name="btn" id="btn" value="이메일 보내기">--%>
    <%--	</div>--%>
    <%--	<div id="layer2">--%>
    <%--		<input type="text" id="emailNum1" name="emailNum1" value="" placeholder="입력하세요">--%>
    <%--		<input type="text" id="emailNum2" name="emailNum2" value="" placeholder="입력하세요" style="display: block">--%>
    <%--		<input type="button" id="btn2" name="btn2" value="인증번호 확인">--%>
    <%--	</div>--%>

        <div style="display:none;">
            <div>
                <input type="button" name="btn" id="btn" value="이메일 보내기">
            </div>
            <div id="layer2">
                <input type="text" id="emailNum1" name="emailNum1" value="" placeholder="입력하세요">
                <input type="text" id="emailNum2" name="emailNum2" value="" placeholder="입력하세요" style="display: none">
                <input type="button" id="btn2" name="btn2" value="인증번호 확인">
            </div>

            <form id="updateFrm" style="display: none">
                <input type="text" id="newPwd1" name="newPwd1" placeholder="새로운 비밀번호">
                <br>
                <input type="text" id="newPwd2" name="newPwd2" placeholder="새로운 비밀번호 확인">
                <br>
                <input type="button" id="chkBtn" name="chkBtn" value="확인버튼" onclick="chkPwd()">
            </form>

            <form action="<%=request.getContextPath()%>/mail/sendMailProcess" id="frm" name="frm" method="post" style="display: none">
                <div>
                    <input type="text" id="from" name="from" placeholder="보내는 사람" value="pos04167@naver.com" readonly>
                </div>
                <div>
                    <input type="text" id="to" name="to"
                           placeholder="받는 사람" value="" required="required"/>
                </div>
                <div>
                    <input type="text" id="subject" name="subject"
                           placeholder="제목" value="이메일 인증번호" required="required"/>
                    <br>
                    <input type="text" id="text" name="text" value=""/>
                </div>
                <button type="submit">메일 전송하기</button>
            </form>
        </div>

        <!-- BEGIN: Page JS-->
<script>
    $('select').select2();
</script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/forms/form-login-register.js"></script>
<!-- END: Page JS-->

<!-- BEGIN: Page Vendor JS-->
<script
        src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
<!-- END: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.min.js"></script>
<script src="/resources/stack-admin-v4.0/app-assets/js/scripts/customizer.min.js"></script>
<script src="/resources/stack-admin-v4.0/app-assets/js/scripts/ui/breadcrumbs-with-stats.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/forms/select/form-select2.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>