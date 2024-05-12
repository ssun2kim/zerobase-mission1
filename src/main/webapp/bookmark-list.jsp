<%@ page import="dao.BookmarkDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.BookmarkDTO" %>
<%@ page import="dao.BookmarkGroupDAO" %>
<%@ page import="dto.BookmarkGroupDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    BookmarkDAO dao = new BookmarkDAO();
    List<BookmarkDTO> list = dao.getBookmarkList();
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
    <h1>북마크 목록</h1>
    <jsp:include page="include-menu.jsp" />
<form>

</form>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>북마크 이름</th>
            <th>와이파이명</th>
            <th>등록일자</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (list != null && !list.isEmpty()) {
                BookmarkGroupDAO bgDao = new BookmarkGroupDAO();
                for (BookmarkDTO dto : list) {
                    BookmarkGroupDTO bgDto = bgDao.getBookmarkGroup(dto.getBookmarkId());
        %>
        <tr>
            <td><%=dto.getId()%></td>
            <td><%=bgDto.getName()%></td>
            <td><%=dto.getMgrNo()%></td>
            <td><%=dto.getRegDt()%></td>
            <td style="text-align: center">
                <a href="bookmark-delete.jsp?id=<%=dto.getId()%>">삭제</a>
            </td>
        </tr>
        <%
                }
                bgDao.close();
            } else {
        %>
        <tr>
            <td colspan="5">
                <p id="noData">정보가 존재하지 않습니다.</p>
            </td>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</body>
</html>