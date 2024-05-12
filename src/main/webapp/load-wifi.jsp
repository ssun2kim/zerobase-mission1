<%@ page import="dao.WifiDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    WifiDAO dao = new WifiDAO();
    int cnt = dao.saveWifi();
    dao.close();
%>
<!doctype html>
<html>
<head>
    <title>와이파이 정보 구하기</title>
    <link href="/resource/css/main.css" rel="stylesheet"/>
</head>
<body>
    <div align="center">
        <h1><%=cnt%>개의 WIFI 정보를 정상적으로 저장하였습니다.</h1>
        <a href="/">홈 으로 가기</a>
    </div>
</body>
</html>