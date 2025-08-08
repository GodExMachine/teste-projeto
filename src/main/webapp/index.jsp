<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Página Inicial</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column;
            justify-content: center; /* vertical */
            align-items: center;    /* horizontal */
            font-family: Arial, sans-serif;
        }
        h2 {
            margin-bottom: 20px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Oi tudo bem</h2>

    <form action="/testeprojeto/novo-usuario" method="get">
        <button type="submit">Cadastrar novo usuario</button>
    </form>
</body>
</html>