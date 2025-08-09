<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<title>Página Inicial</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />

</head>
<body>
	<div class="container">
		<h2>Oi, tudo bem?</h2>

		<form action="/testeprojeto/novo-usuario" method="get">
			<button type="submit">Cadastrar novo usuário</button>
		</form>

		<form action="/testeprojeto/login-usuario" method="get">
			<button type="submit">Fazer Login</button>
		</form>

		<c:if test="${not empty sessionScope.usuarioLogado}">
			<form action="/testeprojeto/novo-evento" method="get">
				<button type="submit">Novo Evento</button>
			</form>
		</c:if>

	</div>
</body>
</html>
