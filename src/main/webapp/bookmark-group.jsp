<%@ page import="dao.BookmarkGroupDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.BookmarkGroupDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    BookmarkGroupDAO dao = new BookmarkGroupDAO();
    List<BookmarkGroupDTO> list = dao.getBookmarkGroupList();
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
    <h1>북마크 그룹</h1>
    <jsp:include page="include-menu.jsp" />

    <form>
        <button type="button" onclick="location='bookmark-group-add.jsp'">북마크 그룹 이름 추가</button>
    </form>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>북마크 이름</th>
                <th>순서</th>
                <th>등록일자</th>
                <th>수정일자</th>
                <th>비고</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (list != null && !list.isEmpty()) {
                for (BookmarkGroupDTO dto : list) {
        %>
        <tr>
            <td><%=dto.getId()%></td>
            <td><%=dto.getName()%></td>
            <td><%=dto.getOrderVal()%></td>
            <td><%=dto.getRegDt()%></td>
            <td><%=dto.getUpdDt() != null ? dto.getUpdDt() : ""%></td>
            <td>
                <div align="center">
                    <a href="bookmark-group-edit.jsp?id=<%=dto.getId()%>">수정</a>
                    <a href="bookmark-group-delete.jsp?id=<%=dto.getId()%>">삭제</a>
                </div>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">
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