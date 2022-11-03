<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ page import="Entidades.Comentario" %>
        <%@ page import="Entidades.Postagem" %>
            <%@ page import="Entidades.Usuario" %>
                <%@ page import="Controller.Buscador" %>
                    <%@page import="java.util.List" %>

                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <meta charset="utf-8" />
                            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                            <meta name="description" content="" />
                            <meta name="author" content="" />
                            <title>Science Blog</title>
                            <!-- Font Awesome icons (free version)-->
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
                            <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
                                <div class="container px-4 px-lg-5">
                                    <a class="navbar-brand" href="index.html">Science Blog</a>
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

                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <header class="masthead"
                                style="background-image: url('https://www.astrocentro.com.br/blog/wp-content/uploads/2017/09/o-que-sao-astros.jpg')">
                                <div class="container position-relative px-4 px-lg-5">
                                    <div class="row gx-4 gx-lg-5 justify-content-center">
                                        <div class="col-md-10 col-lg-8 col-xl-7">
                                            <div class="site-heading">
                                                <h1>Comentarios em análise</h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </header>
                            <hr class="my-4" />
                            <% Comentario com=new Comentario(); List<Comentario> lista =
                                Buscador.comentariosAguardandoAprovacao();
                                System.out.println(lista);
                                %>
                                <% for(Comentario c : lista) {%>
                                    <div class="container px-4 px-lg-5">
                                        <div class="row gx-4 gx-lg-5 justify-content-center">
                                            <div class="col-md-10 col-lg-8 col-xl-7">
                                                <!-- Post preview-->
                                                <div class="post-preview">
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
                                                </div>
                                                <%out.write("<a class='btn btn-success' href=aprovar.jsp?idComent="+c.getId()+">");%> APROVAR</a>
                                                <%out.write("<a class='btn btn-danger' href=reprovar.jsp?idComent="+c.getId()+">");%> REPROVAR</a>
                                                <!-- Divider-->
                                                <hr class="my-4" />
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                        <!-- Bootstrap core JS-->
                                        <script
                                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
                                        </script>
                                        <script>
                                        var perfil = window.sessionStorage.getItem('perfil')
                                        if(perfil != 'MODERADOR'){
                                            document.getElementsByTagName[body][0] = '';
                                        }
                                        </script>

                        </body>

                        </html>