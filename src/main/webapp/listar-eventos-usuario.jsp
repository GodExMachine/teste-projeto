<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Meus Eventos</title>
</head>
<body>
<h2>Meus Eventos</h2>

<c:if test="${empty eventos}">
    <p>Você não cadastrou nenhum evento ainda.</p>
</c:if>

<c:if test="${not empty eventos}">
    <table border="1" cellpadding="5">
        <tr>
            <th>Data</th>
            <th>Comentário</th>
            <th>ID Endereço</th>
        </tr>
        <c:forEach var="evento" items="${eventos}">
            <tr>
                <td>${evento.dataEvento}</td>
                <td>${evento.comentario}</td>
                <td>${evento.idEndereco}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

</body>
</html>
