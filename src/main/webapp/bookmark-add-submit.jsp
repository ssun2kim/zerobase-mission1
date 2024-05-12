<%@ page import="dao.BookmarkDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    String mgrNo = request.getParameter("mgrNo");
    int id = Integer.parseInt(request.getParameter("bookmarkGroupId"));
    BookmarkDAO dao = new BookmarkDAO();
    boolean result = dao.saveBookmark(mgrNo, id);
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
        alert('북마크 정보를 추가하였습니다.');
        location='bookmark-list.jsp';
    </script>
    <%
    } else {
    %>
    <script>
        alert('북마크 정보를 추가하지 못했습니다.')
        history.back();
    </script>
    <%
        }
    %>
</head>
<body>

</body>
</html>