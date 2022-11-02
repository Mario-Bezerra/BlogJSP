<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css"> @import url("../css/form.css"); </style>
    <title>Adicionar comentario</title>
<body>
    <main>
        <form id="login_form" class="form_class masthead" action="comentarioForm.jsp" method="post">
            <div class="form_div">
                <input type="hidden" name="idUsuario" id="idUsuario">
                <input id ="idPost" name="idPost" type="hidden">
                <label>Texto:</label>
                <textarea class="field_class" name="comentario" id="comentario" cols="30" rows="10" placeholder="Digite seu comentario"></textarea>
                <button class="submit_class btn btn-dark" type="submit" form="login_form">Enviar</button>
            </div>
        </form>
    </main>
    <script>
        function salvar(){
           event.preventDefault()
           var comentario = document.getElementById('comentario')
           if(comentario.value == ''){
            comentario.focus()
             return
           }
           document.getElementById("login_form").submit()
        }

        const urlParams = new URLSearchParams(window.location.search)
        var idPost = urlParams.get('idPost')
        document.getElementById('idPost').setAttribute("value", idPost)

        var idUsuario = window.sessionStorage.getItem('id');
        document.getElementById('idUsuario').setAttribute("value", idUsuario)
    </script>
</body>
</html>