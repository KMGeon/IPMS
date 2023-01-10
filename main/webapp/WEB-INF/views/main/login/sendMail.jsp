<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기</title>
    <script src="/resources/js/jquery-3.6.0.js"></script>
    <script>
        $(function () {
            const randomNumber = Math.floor(Math.random() * 8888)+1;
            $('input[name=text]').attr('value',randomNumber);
            let text1 = $("#text").val();
            // let text1 = randomNumber;
            let text2;
            $("#btn").on("click", function () {
                alert("Click");
                let fData = $("#frm").serialize();
                $.ajax({
                    url: "/sendMailProcess",
                    type: "post",
                    data: fData,
                    success: function (data) { //여기서 data는 controller에 list이다.
                        alert("성공");
                    }
                })
            })
            $("#btn2").on("click", function () {
                text2= $("#emailNum1").val();
                console.log("text2::" + text1);
                console.log("text5::" + text2);
                if(text1==text2){
                    alert("인증 성공");
                    $("#updateFrm").css('display', 'block');
                }else{
                    alert("인증 실패");
                }
            });
            let pwd1 = $("#newPwd1").val();
            let pwd2 = $("#newPwd2").val();
        })
function chkPwd(){
            let pwd1 = $("#newPwd1").val();
            let pwd2 = $("#newPwd2").val();
            console.log(pwd1 + " " + pwd2);
            if(pwd1==pwd2){
                alert("같다.");
                location.href="/";
                return true;
            }else{
                $("#newPwd1").focus();
                pwd1 = $("#newPwd1").val("");
                pwd2 = $("#newPwd2").val("");
                alert("다르다.");
                return false;
            }
}
    </script>
    <title>웹 메일 보내기</title>
</head>
<body>
<h1>이메일 인증</h1>
<div>
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
        <input type="text" id="from" name="from" placeholder="보내는 사람" value="charon4167@naver.com" readonly>
    </div>
    <div>
        <input type="text" id="to" name="to"
               placeholder="받는 사람" value="charon4167@naver.com" required="required"/>
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
</body>