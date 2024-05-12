<%@ page import="dao.BookmarkDAO" %>
<%@ page import="dto.BookmarkDTO" %>
<%@ page import="dao.BookmarkGroupDAO" %>
<%@ page import="dto.BookmarkGroupDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("utf-8");
    int id = Integer.parseInt(request.getParameter("id"));
    BookmarkDAO dao = new BookmarkDAO();
    BookmarkDTO bookmark = dao.getBookmark(id);
    dao.close();

    BookmarkGroupDAO bgDao = new BookmarkGroupDAO();
    BookmarkGroupDTO bg = bgDao.getBookmarkGroup(bookmark.getBookmarkId());
    bgDao.close();
%>
<!doctype html>
<html>
<head>
    <title>와이파이 정보 구하기</title>
    <link href="/resource/css/main.css" rel="stylesheet"/>
    <script src="/resource/js/javascript.js"></script>
</head>
<body>
    <h1>북마크 삭제</h1>
    <jsp:include page="include-menu.jsp" />
    <p>북마크를 삭제하시겠습니까?</p>
<form method="post" action="bookmark-delete-submit.jsp">
    <input type="hidden" name="id" value="<%=bookmark.getId()%>"/>
    <table>
        <colgroup>
            <col style="width: 20%;">
            <col style="width: 80%;">
        </colgroup>
        <thead>
        <tr>
            <th>북마크 이름</th>
            <td><%=bg.getName()%></td>
        </tr>
        <tr>
            <th>와이파이명</th>
            <td><%=bookmark.getMgrNo()%></td>
        </tr>
        <tr>
            <th>등록일자</th>
            <td><%=bookmark.getRegDt()%></td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                <a href="bookmark-list.jsp">돌아가기</a> |
                <button type="submit">삭제</button>
            </td>
        </tr>
        </thead>
    </table>
</form>
</body>
</html>