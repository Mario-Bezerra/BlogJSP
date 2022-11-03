<%-- Document : homePost Created on : 02-11-2022 Author : Mario Bezerra --%>

    <%@ page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ page import="Entidades.Postagem" %>
            <%@ page import="Dao.DaoPostagem" %>
            <%@ page import="Entidades.Comentario" %>
            <%@ page import="Controller.Buscador" %>
            <%@page import="java.util.List" %>

                <% int id=Integer.valueOf(request.getParameter("id")); 
                Postagem p=DaoPostagem.consultar(id); 
                Comentario com=new Comentario(); 
                List<Comentario> lista = Buscador.comentariosDaPostagem(p.getId());
                System.out.println(lista);
                %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="utf-8" />
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                        <meta name="description" content="" />
                        <meta name="author" content="" />
                        <title>Science Blog</title>
                        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
                            crossorigin="anonymous"></script>
                        <!-- Google fonts-->
                        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
                            rel="stylesheet" type="text/css" />
                        <link
                            href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
                            rel="stylesheet" type="text/css" />
                        <!-- Core theme CSS (includes Bootstrap)-->
                        <style type="text/css">
                            @import url("../css/index.css");
                        </style>
                    </head>

                    <body>
                        <!-- Navigation-->
                        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
                            <div class="container px-4 px-lg-5">
                                <a class="navbar-brand" href="index.jsp">Science Blog</a>
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                    Menu
                                    <i class="fas fa-bars"></i>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarResponsive">
                                    <ul class="navbar-nav ms-auto py-4 py-lg-0" id="itensNav">
                                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
                                                href="index.jsp">Home</a></li>
                                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 utils"
                                                href="login.jsp">Entrar</a></li>
                                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 "
                                                href="cadastro.jsp">Cadastrar</a></li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                        <!-- Page Header-->
                        <header class="masthead"
                            style="background-image: url('https://static9.depositphotos.com/1000401/1168/i/600/depositphotos_11686120-stock-photo-starry-background-of-deep-outer.jpg')">
                            <div class="container position-relative px-4 px-lg-5">
                                <div class="row gx-4 gx-lg-5 justify-content-center">
                                    <div class="col-md-10 col-lg-8 col-xl-7">
                                        <div class="post-heading">
                                            <h1>
                                                <% out.write(""+p.getTitulo()); %>
                                            </h1>
                                            <span class="meta">
                                                Postado por
                                                <a href="#!">
                                                    <% out.write(""+p.getUsuarioId().getNome()); %>
                                                </a>
                                                em <% out.write(""+p.getTempoCriado()); %>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </header>
                        <!-- Post Content-->
                        <article class="mb-4">
                            <div class="container px-4 px-lg-5">
                                <div class="row gx-4 gx-lg-5 justify-content-center">
                                    <div class="col-md-10 col-lg-8 col-xl-7">
                                        <p>
                                            <% out.write(""+p.getConteudo()); %>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="container px-4 px-lg-5">
                                <hr class="my-4" />
                                <div class="d-flex justify-content-around">
                                    <h4> Comentarios <h4>
                                            <div id="adicionarComentario"></div>
                                </div>
                            </div>
                            <hr class="my-4" />
                                <% for(Comentario c : lista) {%>
                                    <form action="apagarComentario.jsp" id="apagarComentario">
                                    <div class="container px-4 px-lg-5">
                                        <div class="row gx-4 gx-lg-5 justify-content-center">
                                            <div class="col-md-10 col-lg-8 col-xl-7">
                                                <!-- Post preview-->
                                                <div class="post-preview">
                                                    <input name="idC" id="idC" value='<% out.write(""+c.getId()); %>' hidden>
                                                    <input name="idP" id="idP" value='<% out.write(""+c.getPostagemId().getId()); %>' hidden>
                                                    <%out.write("<a href=post.jsp?id="+c.getPostagemId().getId()+">");%>
                                                        <h4 class="">
                                                            <% out.write(""+c.getUsuarioId().getNome()); %>
                                                        </h4>
                                                        <h5 class="post-subtitle">
                                                            <% out.write(""+c.getConteudo()); %>
                                                        </h5>
                                                        </a>
                                                        <p class="post-meta">
                                                            Postado no post
                                                            <a href="#!">
                                                                <% out.write(""+c.getPostagemId().getTitulo()); %>
                                                            </a>
                                                            em <% out.write(""+c.getTempoCriado()); %>
                                                        </p>
                                                        <p id="deletarComentario"></p>
                                                    </div>
                                                <!-- Divider-->
                                                <hr class="my-4" />
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                    <%}%>
                        </article>
                        <!-- Bootstrap core JS-->
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
                        </script>
                        <script>
                            window.onload = verificaPerfil();

                            var logado = window.sessionStorage.getItem('logado')
                            var perfil = window.sessionStorage.getItem('perfil')
                            const urlParams = new URLSearchParams(window.location.search)
                            var idPost = urlParams.get('id')

                            if (logado == 'true') {
                                const areaComentario = document.getElementById('adicionarComentario')
                                areaComentario.innerHTML = '<button type="button" class="btn btn-dark"' +
                                    'onclick="adicionarComentario()">Adicionar comentario</button>'
                            } else {
                                const areaComentario = document.getElementById('adicionarComentario')
                                areaComentario.innerHTML =
                                    '<button type="button" class="btn btn-warning"' +
                                    'onclick="login()">Para comentar precisa estar logado, clique aqui</button>'
                            }


                            if (perfil == 'MODERADOR') {
                                const areaComentario = document.getElementById('adicionarComentario')
                                areaComentario.innerHTML = '<button type="button" class="btn btn-dark"' +
                                    'onclick="adicionarComentario()">Adicionar comentario</button>' +
                                    '<button type="button" class="btn btn-danger"' +
                                    'onclick="removerPost()">REMOVER POST</button>' +
                                    '<button type="button" class="btn btn-warning"' +
                                    'onclick="editarPost()">EDITAR POST</button>'
                                const comentario = document.getElementById('deletarComentario')
                                comentario.innerHTML = '<button type="button" class="btn btn-danger"' +
                                    'onclick="excluirComentario()">EXCLUIR COMENT.</button>'
                            }

                            function adicionarComentario() {
                                window.location.href = "comentario.jsp?idPost=" + idPost;
                            }

                            function removerPost() {
                                console.log(idPost)
                                window.location.href = "remover.jsp?idPost=" + idPost;
                            }

                            function editarPost() {
                                window.location.href = "editarPost.jsp?idPost=" + idPost;
                            }

                            function login() {
                                window.location.href = "login.jsp";
                            }

                            function excluirComentario() {
                                var idComentario = document.getElementById('idC').value
                                var idPostagem = document.getElementById('idP').value
                                var url = "apagarComentario.jsp?idC=" + idComentario + "&idP=" + idPostagem
                                window.location.href = url
                            }

                            function verificaPerfil(){
                            var perfilUsuario = window.sessionStorage.getItem('perfil')
                            if (perfilUsuario != null && perfilUsuario == 'MODERADOR') {
                                const navbar = document.getElementById('itensNav');
                                navbar.innerHTML =
                                    '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>' +
                                    '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="adicionarPost.jsp">Adicionar post</a></li>' +
                                    '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="moderador.jsp">Moderador</a></li>'
                            }
                            if (perfilUsuario != null && perfilUsuario == 'USUARIO') {
                                const navbar = document.getElementById('itensNav');
                                navbar.innerHTML =
                                    '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>'
                            }
                        }
                        </script>
                    </body>

                    </html>