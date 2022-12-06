<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    $(document).ready(function () {
        $("#email").change(function () {
            var to = $("#email").val();
            $("#to").attr("value", to);
            console.log(to);
        })
    })


    $(function () {

        const randomNumber = Math.floor(Math.random() * 8888) + 1;
        $('input[name=text]').attr('value', randomNumber);
        let text1 = $("#text").val();
        let email;
        let text2;
        $("#btn").on("click", function () {

            alert("Click");
            console.log("to::" + to);
            let fData = $("#frm").serialize();
            $.ajax({
                url: "/sendMailProcess",
                type: "post",
                data: fData,
                success: function (data) { //여기서 data는 controller에 list이다.
                    $("#hideEmail").css('display', 'block');
                }

            })
        })


        $("#btn2").on("click", function () {
            text2 = $("#emailNum1").val();
            console.log("text2::" + text1);
            console.log("text5::" + text2);
            if (text1 == text2) {
                alert("인증 성공");
                $("#pwdForm1").css('display', 'block');
                $("#pwdForm2").css('display', 'block');

            } else {
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
        var password = $("#paswd").val();
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


</script>
<!-- END: Custom CSS-->

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<!-- BEGIN: Content-->

<div class="app-content container center-layout mt-2">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-header row"></div>
        <div class="content-body">
            <section class="row flexbox-container">
                <div class="col-12 d-flex align-items-center justify-content-center">
                    <div class="col-lg-4 col-md-8 col-10 box-shadow-2 p-0">
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
                            <div class="card-content">
                                <div class="card-body">
                                    <form class="form-horizontal form-simple" action="/main/signUpForm" method="post"
                                          novalidate>
                                        <fieldset
                                                class="form-group position-relative has-icon-left mb-1">
                                            <input type="text" class="form-control form-control-lg"
                                                   id="name" name="name" placeholder="이름" required="required">
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset
                                                class="form-group position-relative has-icon-left mb-1">

                                            <div >
                                                <input type="text" class="form-control form-control-lg"  id="email" placeholder="이메일" required="required">


                                                <<button type="button" id="btn"  class="btn btn-success btn-min-width mr-1 mb-1"  style="float: right;width: 30px;">인증번호 전송</button>

                                            </div>
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset class="form-group position-relative has-icon-left mb-1" id="hideEmail"
                                                  style="display: none">

                                            <input type="password" class="form-control form-control-lg"
                                                   style="float: left; width: 60%" id="emailNum1" name="email"
                                                   placeholder="이메일 인증번호" required="required">
                                            <button type="button" id="btn2"
                                                    class="btn btn-success btn-min-width mr-1 mb-1"
                                                    style="float: right;width: 30px;">인증번호 확인
                                            </button>

                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                        </fieldset>
                                        <fieldset
                                                class="form-group position-relative has-icon-left mb-1">
                                            <input type="text" class="form-control form-control-lg" id="paswd"
                                                   name="paswd" placeholder="비밀번호" onkeyup="passwordCheck()"
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
                                            <div style="margin-left:10px;">
                                                <!-- 속성에 multiple를 추가합시다. -->
                                                <select class="form-control" multiple="multiple">
                                                    <option>option1</option>
                                                    <option>option2</option>
                                                    <option>option3</option>
                                                    <option>option4</option>
                                                    <option>option5</option>

                                                </select>
                                            </div>

                                        </fieldset>
                                        <div>
                                            <span id="passMessage" style="color: red"/>
                                        </div>
                                        <button type="submit" id="sbtBtn" name="sbtBtn"
                                                class="btn btn-primary btn-lg btn-block" style="display:none;">
                                            <i class="feather icon-unlock"></i> Register
                                        </button>
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

    <form id="updateFrm" style="display: none">
        <input type="text" id="newPwd1" name="newPwd1" placeholder="새로운 비밀번호">
        <br>
        <input type="text" id="newPwd2" name="newPwd2" placeholder="새로운 비밀번호 확인">
        <br>
        <input type="button" id="chkBtn" name="chkBtn" value="확인버튼" onclick="chkPwd()">
    </form>

    <form action="<%=request.getContextPath()%>/mail/sendMailProcess" id="frm" name="frm" method="post"
          style="display: none">
        <div>
            <input type="text" id="from" name="from" placeholder="보내는 사람" value="charon4167@naver.com" readonly>
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