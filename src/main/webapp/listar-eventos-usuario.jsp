<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Meus Eventos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listar-eventos-usuario.css" />
    
</head>
<body>
<h2>Meus Eventos</h2>

<c:if test="${empty eventos}">
    <p>Você não cadastrou nenhum evento ainda.</p>
</c:if>

<c:if test="${not empty eventos}">
    <table>
		<thead>
		    <tr>
		        <th class="nome-usuario">Nome do Usuário</th>
		        <th>Endereço</th>
		        <th class="data-evento">Data do Evento</th>
		        <th>Comentário</th>
		    </tr>
		</thead>
		<tbody>
		    <c:forEach var="evento" items="${eventos}">
		        <tr>
		            <td class="nome-usuario">${usuarioLogado.nome} ${usuarioLogado.sobrenome}</td>
		            
		            <td>
		                <c:set var="endereco" value="${enderecosMap[evento.idEndereco]}" />
		                Logradouro: ${endereco.logradouro}
		                Número: ${endereco.numero}
		                Bairro: ${endereco.bairro}
		                Cidade: ${endereco.cidade} - ${endereco.estado}
		                CEP: ${endereco.cep}
		            </td>
		            
		            <td class="data-evento">${evento.dataEvento}</td>
		            <td class="comentario">${evento.comentario}</td>
		        </tr>
		    </c:forEach>
		</tbody>
    </table>
</c:if>


<br/>

<div class="btn-container">
  <button onclick="location.href='${pageContext.request.contextPath}/perfil-usuario?id=${usuarioLogado.id}'">
    Voltar
</button>
  
  </div>


</body>
</html>
