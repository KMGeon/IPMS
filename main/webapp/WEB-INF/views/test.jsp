<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="/resources/js/jquery-3.6.0.js"></script>
    <script>
        $(document).ready(function(){
            $("#sendBtn").click(function(){
                sendMessage();
            });
        });

        sock = new SockJS("/echo-ws");
        sock.onmessage = onMessage;

        sock.onclose = onClose;

        function sendMessage(){
            sock.send($("#message").val()+"<br>");
        }

        function onMessage(evt){
            var data = evt.data;
            $("#data").append(data);
            alert(data);
        }
        function onClose(evt){
            $("#data").append("Connection Closed");
            console.log("Close");
        }
    </script>
</head>
<body>
    <input type="text" id="message"/>
<input type="button" id="sendBtn" value="SEND"/>
<div id="data"></div>
</body>


