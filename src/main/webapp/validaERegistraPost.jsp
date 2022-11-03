<%@ page import="Entidades.Postagem" %>
<%@ page import="Dao.DaoPostagem" %>
<%@ page import="Entidades.Usuario" %>
<%@ page import="Dao.DaoUsuario" %>


<%
    String titulo = request.getParameter("titulo");
    String texto = request.getParameter("texto");
    if(texto.length() < 30){
        throw new RuntimeException();
    }
    String usuarioId = request.getParameter("idUsuario");

    Usuario u = DaoUsuario.consultar(Integer.valueOf(usuarioId));
    Postagem p = new Postagem(titulo, texto , u);
    DaoPostagem.salvar(p);
    response.sendRedirect("index.jsp");


%>