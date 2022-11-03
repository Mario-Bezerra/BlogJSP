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
        <form id="login_form" class="form_class masthead" action="cadastroUsuario.jsp" method="post">
            <div class="form_div">
                <label>Nome:</label>
                <input class="field_class" name="nome" id="nome" type="text" placeholder="Insira o seu login" autofocus>
                <label>Sobrenome:</label>
                <input class="field_class" name="sobrenome" id="sobrenome" type="text" placeholder="Insira a sua senha">
                <label>Email:</label>
                <input class="field_class" name="email" id="email" type="text" placeholder="Insira o seu login">
                <label>Senha:</label>
                <input class="field_class" name="senha" type="password" placeholder="Insira o seu login">
                <label>Data de nascimento:</label>
                <input class="field_class" name="dataNascimento" id="dataNascimento" type="date">
                <button class="submit_class btn btn-dark" type="submit" form="login_form" onclick="cadastro()">Cadastrar</button>
            </div>
               </form>
    </main>
    <script>
        function cadastro(){
            event.preventDefault()

            var nome = document.getElementById('nome')
            if(nome.value == ''){
                nome.focus()
              return
            }

            var sobrenome = document.getElementById('sobrenome')
            if(sobrenome.value == ''){
                sobrenome.focus()
              return
            }
            
            var email = document.getElementById('email')
            if(email.value == ''){
                email.focus()
              return
            }

            var dataNascimento = document.getElementById('dataNascimento')
            if(dataNascimento.value == ''){
                dataNascimento.focus()
              return
            }

            document.getElementById("login_form").submit()
        }
    </script>
    
</body>
</html>