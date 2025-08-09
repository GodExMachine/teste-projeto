<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Cadastrar Evento</title>
    <style>
        /* Centralizar formulário na tela */
        .form-container {
            display: flex;
            justify-content: center;
            padding: 40px 0;
            min-height: 100vh;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        form {
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 400px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            font-size: 14px;
            resize: vertical;
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
            margin-top: 10px;
        }
        button:hover {
            background-color: #004999;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="inserir-evento" method="post">
            <h1>Cadastrar Evento</h1>

        <c:if test="${not empty sessionScope.usuarioLogado}">
    <input type="hidden" id="idUsuario" name="idUsuario" value="${sessionScope.usuarioLogado.id}" />
</c:if>

            <h3>Endereço do Evento</h3>

            <label for="logradouro">Logradouro</label>
            <input type="text" id="logradouro" name="logradouro" placeholder="Rua, avenida, etc." required />

            <label for="numero">Número</label>
            <input type="text" id="numero" name="numero" placeholder="Número" required />

            <label for="bairro">Bairro</label>
            <input type="text" id="bairro" name="bairro" placeholder="Bairro" required />

            <label for="cidade">Cidade</label>
            <input type="text" id="cidade" name="cidade" placeholder="Cidade" required />

            <label for="estado">Estado</label>
            <input type="text" id="estado" name="estado" placeholder="Estado" required />

            <label for="cep">CEP</label>
            <input type="text" id="cep" name="cep" placeholder="CEP" required />

            <label for="dataEvento">Data do Evento</label>
            <input type="date" id="dataEvento" name="dataEvento" required />

            <label for="comentario">Comentário</label>
            <textarea id="comentario" name="comentario" rows="4" placeholder="Digite um comentário sobre o evento"></textarea>

            <button type="submit" onclick="alert('Evento cadastrado com sucesso!')">Cadastrar</button>
        </form>
    </div>
</body>
</html>
