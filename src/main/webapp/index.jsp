<%--@elvariable id="data" type="java"--%>
<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link href="static/main.css" rel="stylesheet">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>
    <title>Tic-Tac-Toe</title>
</head>
<body>
<div class="container">
    <h1 class="title">Tic-Tac-Toe</h1>
    <table class="game-board">
    <tr>
        <td onclick="window.location='/logic?click=0'">${data.get(0).getSign()}</td>
        <td onclick="window.location='/logic?click=1'">${data.get(1).getSign()}</td>
        <td onclick="window.location='/logic?click=2'">${data.get(2).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'">${data.get(3).getSign()}</td>
        <td onclick="window.location='/logic?click=4'">${data.get(4).getSign()}</td>
        <td onclick="window.location='/logic?click=5'">${data.get(5).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'">${data.get(6).getSign()}</td>
        <td onclick="window.location='/logic?click=7'">${data.get(7).getSign()}</td>
        <td onclick="window.location='/logic?click=8'">${data.get(8).getSign()}</td>
    </tr>
</table>
<hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

    <c:if test="${winner == CROSSES}">
    <h1 class="result-message">CROSSES WIN!</h1>
    <button class="restart-button" onclick="restart()">Start again</button>
    </c:if>
    <c:if test="${winner == NOUGHTS}">
    <h1 class="result-message">NOUGHTS WIN!</h1>
    <button class="restart-button" onclick="restart()">Start again</button>
    </c:if>
    <c:if test="${draw}">
    <h1 class="result-message">IT'S A DRAW</h1>
    <br>
    <button class="restart-button draw-button" onclick="restart()">Start again</button>
    </c:if>
<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }

</script>

</body>
</html>