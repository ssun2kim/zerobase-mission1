<%@ page import="dao.WifiDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.WifiDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<WifiDTO> wifiList = null;
    Double lat = null;
    Double lnt = null;
    if (request.getParameter("lat") != null && request.getParameter("lnt") != null) {
    lat = Double.parseDouble(request.getParameter("lat"));
    lnt = Double.parseDouble(request.getParameter("lnt"));
    WifiDAO dao = new WifiDAO();
    wifiList = dao.getWifiList(lat, lnt);
    dao.close();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>와이파이 정보 구하기</title>
    <link href="/resource/css/main.css" rel="stylesheet"/>
    <script src="/resource/js/javascript.js"></script>
</head>
<body>
    <h1>와이파이 정보 구하기</h1>
    <jsp:include page="include-menu.jsp" />

<div class="position">
    <form action="">
        LAT: <input id="lat" type="text" name="lat" value="<%=lat == null ? 0.0 : lat%>" required> ,
        LNT: <input id="lnt" type="text" name="lnt" value="<%=lnt == null ? 0.0 : lnt%>" required>
        <button id="curPosBtn" type="button">내 위치 가져오기</button>
        <button type="submit">근처 WIPI 정보 보기</button>
    </form>
</div>

    <table>
        <thead>
            <tr>
                <th>거리(Km)</th>
                <th>관리번호</th>
                <th>자치구</th>
                <th>와이파이명</th>
                <th>도로명주소</th>
                <th>상세주소</th>
                <th>설치위치(층)</th>
                <th>설치유형</th>
                <th>설치기관</th>
                <th>서비스구분</th>
                <th>망종류</th>
                <th>설치년도</th>
                <th>실내외구분</th>
                <th>WIFI접속환경</th>
                <th>X좌표</th>
                <th>Y좌표</th>
                <th>작업일자</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (wifiList != null && !wifiList.isEmpty()) {
                    for (WifiDTO dto : wifiList) {
            %>
            <tr>
                <td><%=String.format("%.4f", dto.getDistance())%></td>
                <td><%=dto.getMgrNo()%></td>
                <td><%=dto.getWrdofc()%></td>
                <td>
                    <a href="detail.jsp?mgrNo=<%=dto.getMgrNo()%>">
                        <%=dto.getMainNm()%>
                    </a>
                <td><%=dto.getAdres1()%></td>
                <td><%=dto.getAdres2()%></td>
                <td><%=dto.getInstlFloor()%></td>
                <td><%=dto.getInstlTy()%></td>
                <td><%=dto.getInstlMby()%></td>
                <td><%=dto.getSvcSe()%></td>
                <td><%=dto.getCmcwr()%></td>
                <td><%=dto.getCnstcYear()%></td>
                <td><%=dto.getInoutDoor()%></td>
                <td><%=dto.getRemars3()%></td>
                <td><%=dto.getLat()%></td>
                <td><%=dto.getLnt()%></td>
                <td><%=dto.getWorkDttm()%></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="17">
                    <p id="noData">위치 정보를 입력한 후에 조회해 주세요.</p>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>