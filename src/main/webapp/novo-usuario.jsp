<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Cadastrar Usuário</title>
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
        h1, h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
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
    </style>
</head>
<body>
    <div class="form-container">
        <form action="inserir-usuario" method="post">
            <h1>Cadastrar Usuário</h1>

            <label for="nome">Nome</label><br/>
            <input type="text" id="nome" name="nome" required />

            <label for="sobrenome">Sobrenome</label><br/>
            <input type="text" id="sobrenome" name="sobrenome" required />

            <label for="email">E-mail</label><br/>
            <input type="email" id="email" name="email" required />

            <label for="senha">Senha</label><br/>
            <input type="password" id="senha" name="senha" required />

            <h3>Endereço</h3>

            <label for="logradouro_endereco">Logradouro (Rua, Av...)</label><br/>
            <input type="text" id="logradouro_endereco" name="logradouro" required />

            <label for="numero_endereco">Número</label><br/>
            <input type="text" id="numero_endereco" name="numero" required />

            <label for="complemento_endereco">Complemento</label><br/>
            <input type="text" id="complemento_endereco" name="complemento" />

            <label for="bairro_endereco">Bairro</label><br/>
            <input type="text" id="bairro_endereco" name="bairro" required />

            <label for="cidade_endereco">Cidade</label><br/>
            <input type="text" id="cidade_endereco" name="cidade" required />

            <label for="estado_endereco">Estado</label><br/>
            <input type="text" id="estado_endereco" name="estado" required />

            <label for="cep_endereco">CEP</label><br/>
            <input type="text" id="cep_endereco" name="cep" required />

            <button type="submit">Cadastrar</button>
        </form>
    </div>
</body>
</html>
