<%@ page import="dao.HistoryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int id = Integer.parseInt(request.getParameter("id"));
    HistoryDAO dao = new HistoryDAO();
    boolean result = dao.deleteHistory(id);
    dao.close();
%>
<html>
<head>
    <title>와이파이 정보 구하기</title>
    <%
        if (result) {
    %>
    <script>
        alert('히스토리 정보를 삭제하였습니다.');
        location='history.jsp';
    </script>
    <%
    } else {
    %>
    <script>
        alert('히스토리 정보를 삭제하지 못했습니다.')
        history.back();
    </script>
    <%
        }
    %>
</head>
<body>

</body>
</html>
