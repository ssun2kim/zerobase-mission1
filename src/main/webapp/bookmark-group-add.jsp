<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>와이파이 정보 구하기</title>
    <link href="/resource/css/main.css" rel="stylesheet"/>
    <script src="/resource/js/javascript.js"></script>
</head>
<body>
    <h1>북마크 그룹 추가</h1>
    <jsp:include page="include-menu.jsp" />
<form method="post" action="bookmark-group-add-submit.jsp">
    <table>
        <colgroup>
            <col style="width: 20%;">
            <col style="width: 80%;">
        </colgroup>
        <thead>
        <tr>
            <th>북마크 이름</th>
            <td>
                <input type="text" name="name" required/>
            </td>
        </tr>
        <tr>
            <th>순서</th>
            <td>
                <input type="text" name="orderVal" required/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
                    <button type="submit">추가</button>
            </td>
        </tr>
        </thead>
    </table>
</form>
</body>
</html>
