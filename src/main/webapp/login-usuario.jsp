<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Login do Usuário</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-usuario.css" />

</head>
<body>
    <div class="form-container">
        <form action="login" method="post">
            <h1>Login</h1>

            <c:if test="${not empty erro}">
                <div class="error-message">${erro}</div>
            </c:if>

            <label for="email">E-mail</label><br/>
            <input type="email" id="email" name="email" required />

            <label for="senha">Senha</label><br/>
            <input type="password" id="senha" name="senha" required />

            <button type="submit">Entrar</button>
            
            <a href="index.jsp" class="btn">Voltar </a>
            
        </form>
		


	</div>
</body>
</html>
