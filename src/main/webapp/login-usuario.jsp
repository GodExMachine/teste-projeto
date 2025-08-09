<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Login do Usuário</title>
    <style>
        /* Centralizar formulário na tela */
        .form-container {
            display: flex;
            justify-content: center; /* só horizontal */
            padding: 40px 0;         /* espaço vertical */
            min-height: 100vh;
            box-sizing: border-box;
        }
        form {
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 350px;
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #004999;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
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
        </form>
    </div>
</body>
</html>
