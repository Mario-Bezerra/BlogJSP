<%--
    Document   : homePost
    Created on : 02-11-2022
    Author     : Mario Bezerra
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Controller.Buscador" %>
<%@ page import="Entidades.Postagem" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Science Blog</title>
                <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <style type="text/css"> @import url("../css/index.css"); </style>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Science Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0" id="itensNav">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 utils" href="login.jsp">Entrar</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 " href="cadastro.jsp">Cadastrar</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('https://www.astrocentro.com.br/blog/wp-content/uploads/2017/09/o-que-sao-astros.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Descubra o universo</h1>
                            <span class="subheading">Um blog sobre astronomia</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <%
            Postagem postagem = new Postagem();
            List<Postagem> lista = Buscador.consultaInicial();
        %>
         <% for(Postagem p : lista) {%>
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <!-- Post preview-->
                    <div class="post-preview">
                        <%out.write("<a href=post.jsp?id="+p.getId()+">");%>
                            <h2 class="post-title"> <% out.write(""+p.getTitulo()); %> </h2>
                            <h3 class="post-subtitle"> <% out.write(""+p.getSubtitle()); %> </h3>
                        </a>
                        <p class="post-meta">
                            Postado por
                            <a href="#!"><% out.write(""+p.getUsuarioId().getNome()); %></a>
                            em <% out.write(""+p.getTempoCriado()); %>
                        </p>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                </div>
            </div>
        </div>
        <%}%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const urlParams = new URLSearchParams(window.location.search)
            const logado = urlParams.get('estaLogado')
            const idUsuario = urlParams.get('usuarioId')
            const perfil = urlParams.get('perfil')
            if(logado == 'true'){
                window.sessionStorage.setItem("logado", logado)
                window.sessionStorage.setItem("id", idUsuario)
                window.sessionStorage.setItem("perfil", perfil)
                window.location.href = "http://localhost:8080/index.jsp"
            }

            var perfilUsuario = window.sessionStorage.getItem('perfil')
            if(perfilUsuario != null && perfilUsuario == 'MODERADOR'){
                const navbar = document.getElementById('itensNav');
                navbar.innerHTML = 
                '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>' +
                '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="adicionarPost.jsp">Adicionar post</a></li>' +
                '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="moderador.jsp">Moderador</a></li>'
            }
            if(perfilUsuario != null && perfilUsuario == 'USUARIO'){
                const navbar = document.getElementById('itensNav');
                navbar.innerHTML =
                '<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>'
            }
        </script>
    </body>
</html>