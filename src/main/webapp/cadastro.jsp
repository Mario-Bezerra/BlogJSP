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
        <form id="login_form " class="form_class masthead" action="login/login-access.php" method="post">
            <div class="form_div">
                <label>Nome:</label>
                <input class="field_class" name="nome" type="text" placeholder="Insira o seu login" autofocus>
                <label>Sobrenome:</label>
                <input class="field_class" name="sobrenome" type="text" placeholder="Insira a sua senha">
                <label>Email:</label>
                <input class="field_class" name="email" type="text" placeholder="Insira o seu login">
                <label>Senha:</label>
                <input class="field_class" name="senha" type="password" placeholder="Insira o seu login">
                <label>Data de nascimento:</label>
                <input class="field_class" name="dataNascimento" type="date">
                <button class="submit_class btn btn-dark" type="submit" form="login_form" onclick="">Cadastrar</button>
            </div>
        </form>
    </main>
</body>
</html>