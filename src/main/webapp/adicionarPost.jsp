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
        <form id="login_form" class="form_class masthead" action="validaERegistraPost.jsp" method="post">
            <div class="form_div">
                <input id ="idUsuario" name="idUsuario" type="hidden">
                <label>Titulo:</label>
                <input class="field_class" name="titulo" id="titulo" type="text" placeholder="Insira o titulo" autofocus>
                <label>Texto:</label>
                <textarea class="field_class" maxlength="1000" minlength="30" name="texto" id="texto" cols="30" rows="20" placeholder="Digite seu comentario" required></textarea>
                <button class="submit_class btn btn-dark" type="submit" form="login_form" onclick="cadastro()">Cadastrar</button>
            </div>
               </form>
    </main>
    <script>
        function cadastro(){
            event.preventDefault()

            var titulo = document.getElementById('titulo')
            if(titulo.value == ''){
              titulo.focus()
              return
            }

            var texto = document.getElementById('texto')
            if(texto.value == ''){
              texto.focus()
              return
            }
        
            var idUsuario = window.sessionStorage.getItem('id');
            document.getElementById('idUsuario').setAttribute("value", idUsuario)

            document.getElementById("login_form").submit()
        }
    </script>

</body>
</html>