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
</head>
<body>
    <h1>Perfil do Usuário</h1>

    <h2>Dados pessoais</h2>
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


</body>
</html>
