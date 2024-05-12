<%@ page import="dao.BookmarkGroupDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int id = Integer.parseInt(request.getParameter("id"));
    BookmarkGroupDAO dao = new BookmarkGroupDAO();
    boolean result = dao.deleteBookmarkGroup(id);
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
        alert('북마크 그룹 정보를 삭제하였습니다.');
        location='bookmark-group.jsp';
    </script>
    <%
    } else {
    %>
    <script>
        alert('북마크 그룹 정보를 삭제하지 못했습니다.')
        history.back();
    </script>
    <%
        }
    %>
</head>
<body>

</body>
</html>
