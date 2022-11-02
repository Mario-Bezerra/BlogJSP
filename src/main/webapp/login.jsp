<%--
    Document   : homePost
    Created on : 02-11-2022
    Author     : Mario Bezerra
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css"> @import url("../css/form.css"); </style>
    <title>Document</title>
<body>
    <main>
        <form id="login_form" class="form_class masthead" action="validacaoLogin.jsp" method="POST">
            <div class="form_div">
                <label>Login:</label>
                <input class="field_class" name="email" id="email" type="text" placeholder="Insira o seu login" autofocus>
                <label>Password:</label>
                <input id="pass" class="field_class" name="senha" id="senha" type="password" placeholder="Insira a sua senha">
                <button class="submit_class btn btn-dark" form="login_form" onclick="salvar()">Entrar</button>
            </div>
            <div class="info_div">
                <p>Ainda não é um usuário registrado? <a href="cadastro.jsp">Cadastre-se!</a></p>
            </div>
        </form>
    </main>
    <script>
         function salvar(){
            event.preventDefault()
            var email = document.getElementById('email')
            if(email.value == ''){
              email.focus()
              return
            }
            document.getElementById("login_form").submit()
         }
     </script>
</body>
</html>