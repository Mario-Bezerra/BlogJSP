<%@ page import="Entidades.Postagem" %>
<%@ page import="Dao.DaoPostagem" %>
<% 
    String idPost = request.getParameter("idPost");
    Postagem p = DaoPostagem.consultar(Integer.valueOf(idPost));
%>

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
        <form id="editarPost" class="form_class masthead" action='editaPostValidacao.jsp?'>' method="post">
            <div class="form_div">
                <input id ="idUsuario" name="idUsuario" type="hidden">
                <input class="field_class" id ="postId" name="postId" readonly value='<% out.write(""+p.getId()); %>' hidden>
                <label>Titulo:</label>
                <input class="field_class" name="titulo" id="titulo" type="text" value="<% out.write(p.getTitulo());%> " >
                <label>Texto:</label>
                <textarea class="field_class" maxlength="2000" minlength="30" name="texto" id="texto" cols="30" rows="20" placeholder='<% out.write(""+p.getConteudo());%>' ></textarea>
                <button class="submit_class btn btn-dark" type="submit" form="editarPost" onclick="submit()">Atualizar</button>
            </div>
               </form>
    </main>
    <script>
        var textarea = document.getElementById(texto);
        textarea.value = '<% out.write(""+p.getConteudo());%>'
        
        function submit(){
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

            document.getElementById("editarPost").submit()
        }
    </script>

</body>
</html>