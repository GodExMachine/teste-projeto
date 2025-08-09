<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Página Inicial</title>
    <style>
        /* Centralizar conteúdo vertical e horizontalmente */
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background: white;
            padding: 40px 50px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            text-align: center;
            width: 360px;
        }
        h2 {
            margin-bottom: 30px;
            color: #333;
        }
        form {
            margin: 15px 0;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #0066cc;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 17px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-sizing: border-box;
        }
        button:hover {
            background-color: #004999;
        }
    </style>
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
    </div>
</body>
</html>
