<%-- 
    Document   : index
    Created on : 2014/11/17, 下午 01:45:40
    Author     : OniYY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="assets/jquery/jquery-1.11.2.min.js"></script>
    </head>
    <body>
        <h1>Kingsbeam Connection Service</h1>
        <div id="responseLog"></div>
        <script>
            var refreshInterval = 10 * 60 * 1000;

            $(function () {
                PrintLog("Startup", "Time interval:" + 10 + "minutes");
                setTimeout(function () {
                    //GetDisconnect();
                    setTimeout(function () {
                        GetConnect();
                    }, 1000);
                }, 1000);
            });

            setInterval(function () {
                /*
                 setTimeout(function () {
                 GetDisconnect();
                 setTimeout(function () {
                 GetConnect();
                 }, 1000);
                 }, 1000);
                 */
                window.location.href = "index.jsp";
            }, refreshInterval);


            function GetConnect() {
                $.get("Transervlet", {"cmd": "connect", "strGwID": "40124CDC6628", "strPwd": "DC6628"}, function (back) {
                    PrintLog("connect", back);
                });
            }
            function GetDisconnect() {
                $.get("Transervlet", {"cmd": "disconnect", "strGwID": "40124CDC6628", "strPwd": "DC6628"}, function (back) {
                    PrintLog("disconnect", back);
                });
            }
            function PrintLog(cmd, text) {
                var date = new Date();
                var textnode = document.createElement("p");
                textnode.innerHTML = cmd + " result: " + date + text;
                document.getElementById("responseLog").appendChild(textnode);
            }
        </script>
    </body>
</html>
