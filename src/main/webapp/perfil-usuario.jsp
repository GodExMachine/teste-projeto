<%@ page import="modelo.entidade.usuario.Usuario" %>
<%@ page import="modelo.entidade.endereco.Endereco" %>
<%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    Endereco endereco = (Endereco) request.getAttribute("endereco");
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Perfil do Usuário</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 450px;
            margin: 50px auto;
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            box-sizing: border-box;
        }
        h1, h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            margin: 8px 0;
            color: #555;
        }
        b {
            color: #222;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 25px;
            background-color: #0066cc;
            color: white;
            font-size: 16px;
            text-align: center;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            box-sizing: border-box;
        }
        .btn:hover {
            background-color: #004999;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Perfil do Usuário</h1>

        <h2>Dados Pessoais</h2>
        <p><b>Nome:</b> <%= usuario.getNome() %> <%= usuario.getSobrenome() %></p>
        <p><b>Email:</b> <%= usuario.getEmail() %></p>

        <h2>Endereço</h2>
        <p><b>Logradouro:</b> <%= endereco != null ? endereco.getLogradouro() : "-" %></p>
        <p><b>Número:</b> <%= endereco != null ? endereco.getNumero() : "-" %></p>
        <p><b>Complemento:</b> <%= endereco != null && endereco.getComplemento() != null ? endereco.getComplemento() : "-" %></p>
        <p><b>Bairro:</b> <%= endereco != null ? endereco.getBairro() : "-" %></p>
        <p><b>Cidade:</b> <%= endereco != null ? endereco.getCidade() : "-" %></p>
        <p><b>Estado:</b> <%= endereco != null ? endereco.getEstado() : "-" %></p>
        <p><b>CEP:</b> <%= endereco != null ? endereco.getCep() : "-" %></p>

        <a href="editar-perfil" class="btn">Editar Perfil</a>
        <a href="logout" class="btn" style="background-color:#cc3300; margin-top:10px;">Sair</a>
        <a href="index.jsp" class="btn" style="background-color:#777; margin-top:10px;">Voltar para Início</a>

    </div>
</body>
</html>
