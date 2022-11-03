<%@ page import="Entidades.Postagem" %>
<%@ page import="Dao.DaoPostagem" %>

<%
    String idPost = request.getParameter("postId");
    String titulo = request.getParameter("titulo");
    String texto = request.getParameter("texto");
    if(texto.length() < 30){
        throw new RuntimeException();
    }
    Postagem p = DaoPostagem.consultar(Integer.valueOf(idPost));
    p.setTitulo(titulo);
    if(!texto.isEmpty() && texto != null){
        p.setConteudo(texto);
    }
    DaoPostagem.alterar(p);
    String url = "post.jsp?id=" + p.getId();
    response.sendRedirect(url);


%>