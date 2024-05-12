<%@ page import="dao.BookmarkGroupDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    int orderVal = Integer.parseInt(request.getParameter("orderVal"));
    BookmarkGroupDAO dao = new BookmarkGroupDAO();
    boolean result = dao.editBookmarkGroup(id, name, orderVal);
    dao.close();
%>
<!doctype html>
<html>
<head>
    <title>와이파이 정보 구하기</title>
    <%
        if (result) {
    %>
    <script>
        alert('북마크 그룹 정보를 수정하였습니다.');
        location='bookmark-group.jsp';
    </script>
    <%
    } else {
    %>
    <script>
        alert('북마크 그룹 정보를 수정하지 못했습니다.')
        history.back();
    </script>
    <%
        }
    %>
</head>
<body>

</body>
</html>
