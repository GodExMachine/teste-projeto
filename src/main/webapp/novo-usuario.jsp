<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Cadastrar Usuário</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/novo-usuario.css" />

</head>
<body>
    <div class="form-container">
        <form action="inserir-usuario" method="post">
<h1>Cadastrar Usuário</h1>

<div class="form-columns">
    <div class="form-column">
        <!-- Dados pessoais -->
        <label for="nome">Nome</label>
        <input type="text" id="nome" name="nome" required />

        <label for="sobrenome">Sobrenome</label>
        <input type="text" id="sobrenome" name="sobrenome" required />

        <label for="email">E-mail</label>
        <input type="email" id="email" name="email" required />

        <label for="senha">Senha</label>
        <input type="password" id="senha" name="senha" required />
    </div>

    <div class="form-column">
        <!-- Endereço -->
        <h3>Endereço</h3>

        <label for="logradouro_endereco">Logradouro (Rua, Av...)</label>
        <input type="text" id="logradouro_endereco" name="logradouro" required />

        <label for="numero_endereco">Número</label>
        <input type="text" id="numero_endereco" name="numero" required />

        <label for="complemento_endereco">Complemento</label>
        <input type="text" id="complemento_endereco" name="complemento" />

        <label for="bairro_endereco">Bairro</label>
        <input type="text" id="bairro_endereco" name="bairro" required />

        <label for="cidade_endereco">Cidade</label>
        <input type="text" id="cidade_endereco" name="cidade" required />

        <label for="estado_endereco">Estado</label>
        <input type="text" id="estado_endereco" name="estado" required />

        <label for="cep_endereco">CEP</label>
        <input type="text" id="cep_endereco" name="cep" required />
    </div>
</div>

<button type="submit" onclick="alert('Usuário cadastrado com sucesso!')">Cadastrar</button>
    
        </form>
    </div>
</body>
</html>
