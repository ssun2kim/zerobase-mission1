<%@ page import="dao.WifiDAO" %>
<%@ page import="dto.WifiDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.BookmarkGroupDTO" %>
<%@ page import="dao.BookmarkGroupDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    WifiDAO wifiDao = new WifiDAO();
    WifiDTO wifiDetail = wifiDao.getWifiDetail(request.getParameter("mgrNo"));
    wifiDao.close();

    BookmarkGroupDAO bgDao = new BookmarkGroupDAO();
    List<BookmarkGroupDTO> bgList = bgDao.getBookmarkGroupList();
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
    <h1>와이파이 정보 구하기</h1>
    <jsp:include page="include-menu.jsp" />

<div>
    <div>
        <form method="post" action="bookmark-add-submit.jsp">
            <input type="hidden" name="mgrNo" value="<%=wifiDetail.getMgrNo()%>">
            <select name="bookmarkGroupId" required>
                <option value="">북마크 그룹 이름 선택</option>
                <%
                    if (bgList != null) {
                        for (BookmarkGroupDTO dto : bgList) {
                %>
                <option value="<%=dto.getId()%>"><%=dto.getName()%></option>
                <%
                        }
                    }
                %>
            </select>
            <button type="submit">북마크 추가하기</button>
        </form>
    </div>

    <table>
        <colgroup>
            <col style="width: 20%;"/>
            <col style="width: 80%;"/>
        </colgroup>
        <thead>
        <tr>
            <th>거리(Km)</th>
            <td><%=wifiDetail.getDistance()%></td>
        </tr>
        <tr>
            <th>관리번호</th>
            <td><%=wifiDetail.getMgrNo()%></td>
        </tr>
        <tr>
            <th>자치구</th>
            <td><%=wifiDetail.getWrdofc()%></td>
        </tr>
        <tr>
            <th>와이파이명</th>
            <td>
                <a href="detail.jsp?mgrNo=<%=wifiDetail.getMgrNo()%>">
                    <%=wifiDetail.getMainNm()%>
                </a>
            </td>
        </tr>
        <tr>
            <th>도로명주소</th>
            <td><%=wifiDetail.getAdres1()%></td>
        </tr>
        <tr>
            <th>상세주소</th>
            <td><%=wifiDetail.getAdres2()%></td>
        </tr>
        <tr>
            <th>설치위치(층)</th>
            <td><%=wifiDetail.getInstlFloor()%></td>
        </tr>
        <tr>
            <th>설치유형</th>
            <td><%=wifiDetail.getInstlTy()%></td>
        </tr>
        <tr>
            <th>설치기관</th>
            <td><%=wifiDetail.getInstlMby()%></td>
        </tr>
        <tr>
            <th>서비스구분</th>
            <td><%=wifiDetail.getSvcSe()%></td>
        </tr>
        <tr>
            <th>망종류</th>
            <td><%=wifiDetail.getCmcwr()%></td>
        </tr>
        <tr>
            <th>설치년도</th>
            <td><%=wifiDetail.getCnstcYear()%></td>
        </tr>
        <tr>
            <th>실내외구분</th>
            <td><%=wifiDetail.getInoutDoor()%></td>
        </tr>
        <tr>
            <th>WIFI접속환경</th>
            <td><%=wifiDetail.getRemars3()%></td>
        </tr>
        <tr>
            <th>X좌표</th>
            <td><%=wifiDetail.getLat()%></td>
        </tr>
        <tr>
            <th>Y좌표</th>
            <td><%=wifiDetail.getLnt()%></td>
        </tr>
        <tr>
            <th>작업일자</th>
            <td><%=wifiDetail.getWorkDttm()%></td>
        </tr>
        </thead>
    </table>
</div>
</body>
</html>
