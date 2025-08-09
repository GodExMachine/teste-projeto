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
        input[type="date"],
        select,
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

            <label for="idUsuario">Usuário</label>
            <input type="text" id="idUsuario" name="idUsuario" placeholder="ID do usuário" required />

            <label for="idEndereco">Endereço</label>
            <input type="text" id="idEndereco" name="idEndereco" placeholder="ID do endereço" required />

            <label for="dataEvento">Data do Evento</label>
            <input type="date" id="dataEvento" name="dataEvento" required />

            <label for="comentario">Comentário</label>
            <textarea id="comentario" name="comentario" rows="4" placeholder="Digite um comentário sobre o evento"></textarea>

            <button type="submit" onclick="alert('Evento cadastrado com sucesso!')">Cadastrar</button>
        </form>
    </div>
</body>
</html>
