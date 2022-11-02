<%--
    Document   : homePost
    Created on : 02-11-2022
    Author     : Mario Bezerra
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entidades.Postagem" %>
<%@ page import="Dao.DaoPostagem" %>

    <%
        int id = Integer.valueOf(request.getParameter("id"));
        Postagem p = DaoPostagem.consultar(id);
    %>

<!DOCTYPE html>
<html lang="en">
    <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Science Blog</title>
            <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
            <!-- Font Awesome icons (free version)-->
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
                        <a class="navbar-brand" href="index.html">Science Blog</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            Menu
                            <i class="fas fa-bars"></i>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            <ul class="navbar-nav ms-auto py-4 py-lg-0">
                                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>
                                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 utils" href="login.jsp">Entrar</a></li>
                                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4 " href="cadastro.jsp">Cadastrar</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('https://static9.depositphotos.com/1000401/1168/i/600/depositphotos_11686120-stock-photo-starry-background-of-deep-outer.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="post-heading">
                            <h1> <% out.write(""+p.getTitulo()); %></h1>
                            <span class="meta">
                                Postado por
                                <a href="#!"><% out.write(""+p.getUsuarioId().getNome()); %></a>
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
                        <p><% out.write(""+p.getConteudo()); %></p>
                    </div>
                    <div class="col-md-10 col-lg-8 col-xl-7">
                    <hr class="my-4" />
                    <h4> Comentarios <h4>
                    <% if(p.getUsuarioId().getIsLogged()){
                        out.write("<a href=comentario.jsp?idPost="+p.getId()+"&idUsuario="+p.getUsuarioId().getId()+ ">" +
                        "Enviar comentario </a>");
                        } %>
                    <div>
                </div>
            </div>
        </article>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
