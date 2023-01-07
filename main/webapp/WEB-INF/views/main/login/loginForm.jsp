<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" type="text/css" href="/resources/GatherCss.css">
<script src="/resources/GatherJs.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/join.css">


<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/join.js"></script>
<script src="/resources/js/common.js"></script>

<script>
    $(document).ready(function(){
        if(${param.error!=null}){
            alert("다시 입력하세요");
        }
    });
</script>

<section class="">
    <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-image: url('/resources/images/bg_visual (2).jpg')">
        <div class="container" style="margin-top: px;">
            <div class="row gx-lg-5 align-items-center" >
                <div class="col-lg-6 mb-5 mb-lg-0" style="padding-bottom: 400px">
                    <h1 class="my-5 display-3 fw-bold ls-tight" style="color: white;">
                        Creative Energy <br/>
                        <span class="text-primary" style="text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;">Solution Leader</span>
                    </h1>
                    <span style="color: white;">
		                        변화와 혁신을 바탕으로 기술과 시장을 선도하는
					   창조적인 리더가 되겠습니다.
                    </span>
                </div>


                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="card">
                        <div class="card-body py-3 px-md-5">
                        
                        	<form action="/login" method="post">
                                <input type="hidden" name="memEmail" value="java">
                                <input type="hidden" name="memPasswd" value="1234">
                                <div class="btn-group" role="group" aria-label="Basic example" style="padding-bottom:20px;">
<!--                                 <button type="submit" class="form-control" value="이문주(리더)">이문주(리더)</button> -->
									<button type="button" class="btn btn-primary">박종환(팀원)</button>
									<button type="button" class="btn btn-secondary">이문주(리더)</button>
									<button type="button" class="btn btn-primary">이준혁(팀원)</button>
									<button type="button" class="btn btn-secondary">김효정(리더)</button>
									<button type="button" class="btn btn-primary">김무건(팀원)</button>
                                </div>
                                <sec:csrfInput/>
                            </form>
                            
                            <div class="card-title text-center">
                                <img src="/resources/logoImage/logo.jpg" href="" alt="branding logo"
                                     style="width: 100px; height: auto;">
                            </div>
                            <h6 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2"><span>Login with IPMS</span>
                            </h6>
                            <form action="/login" method="post">

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label" style="float: left; padding-top:10px;">아이디 </label>
                                    <input type="text" id="email" name="memEmail" class="form-control" placeholder="Your Email" required/>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label" style="float: left">비밀번호</label>
                                    <input type="password" id="paswd" name="memPasswd" class="form-control"
                                           placeholder="Enter Password" required/>
                                </div>
                                <!-- Remember-Me -->
                                <div class="col-sm-6 col-12 text-center text-sm-left">
                                    <fieldset style="padding-bottom:20px;">
                                        <input type="checkbox" name="remember-me">로그인 유지<br>
                                    </fieldset>
                                </div>
                                <!-- Submit button -->
                                <button type="submit" class="btn btn-primary btn-block mb-4">로그인</button>
                                <div><a href="/main/signUpForm">회원가입</a>
                                &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                                <a href="/main/fgtPwd">비밀번호 찾기</a></div>
                                <!-- Register buttons -->
                                <!--  csrf 공격 방어를 위해 동적 생성 -->
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
                                <sec:csrfInput/>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Jumbotron -->
</section>