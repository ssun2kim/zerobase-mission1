<%@ page import="dao.HistoryDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.HistoryDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HistoryDAO dao = new HistoryDAO();
    List<HistoryDTO> historyList = dao.getHistoryList();
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
    <h1>위치 히스토리 목록</h1>
    <jsp:include page="include-menu.jsp" />
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>X좌표</th>
                <th>Y좌표</th>
                <th>조회일자</th>
                <th>비고</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (historyList != null && !historyList.isEmpty()) {
                for (HistoryDTO dto : historyList) {
        %>
        <tr>
            <td><%=dto.getId()%></td>
            <td><%=dto.getLat()%></td>
            <td><%=dto.getLnt()%></td>
            <td><%=dto.getRegDt()%></td>
            <td>
                <div align="center">
                    <button onclick="location.href='history-delete.jsp?id=<%=dto.getId()%>'">삭제</button>
                </div>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5">
                <p id="noData">위치 정보를 입력한 후에 조회해 주세요.</p>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    </form>
</body>
</html>