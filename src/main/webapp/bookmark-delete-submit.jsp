<%@ page import="dao.BookmarkDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    int id = Integer.parseInt(request.getParameter("id"));
    BookmarkDAO dao = new BookmarkDAO();
    boolean result = dao.deleteBookmark(id);
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
        location='bookmark-list.jsp';
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