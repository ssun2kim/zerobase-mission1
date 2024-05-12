<%@ page import="dao.BookmarkGroupDAO" %>
<%@ page import="dto.BookmarkGroupDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    int id = Integer.parseInt(request.getParameter("id"));
    BookmarkGroupDAO dao = new BookmarkGroupDAO();
    BookmarkGroupDTO bookmarkGroup = dao.getBookmarkGroup(id);
    dao.close();
%>
<!doctype html>
<html>
<head>
    <title>와이파이 정보 구하기</title>
    <link href="/resource/css/main.css" rel="stylesheet"/>
    <script src="/resource/js/javascript.js"></script>
</head>
<body>
<h1>북마크 그룹 수정</h1>
<jsp:include page="include-menu.jsp"/>
<form method="post" action="bookmark-group-edit-submit.jsp">
    <input type="hidden" name="id" value="<%=bookmarkGroup.getId()%>"/>
    <table>
        <colgroup>
            <col style="width: 20%;">
            <col style="width: 80%;">
        </colgroup>
        <thead>
        <tr>
            <th>북마크 이름</th>
            <td>
                <input type="text" name="name" value="<%=bookmarkGroup.getName()%>" required/>
            </td>
        </tr>
        <tr>
            <th>순서</th>
            <td>
                <input type="text" name="orderVal" value="<%=bookmarkGroup.getOrderVal()%>" required/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                <a href="bookmark-group.jsp">돌아가기</a> |
                <button type="submit">수정</button>
            </td>
        </tr>
        </thead>
    </table>
</form>
</body>
</html>
