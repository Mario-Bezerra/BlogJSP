<%@ page import="Entidades.Comentario" %>
    <%@ page import="Entidades.Usuario" %>
    <%@ page import="Entidades.Postagem" %>
    <%@ page import="Dao.DaoComentario" %>
    <%@ page import="Dao.DaoUsuario" %>
    <%@ page import="Dao.DaoPostagem" %>
<%
        String usuarioId = request.getParameter("idUsuario");
        String postId = request.getParameter("idPost");
        String comentario = request.getParameter("comentario");

        Usuario u = DaoUsuario.consultar(Integer.valueOf(usuarioId));
        Postagem p = DaoPostagem.consultar(Integer.valueOf(postId));
        Comentario c = new Comentario(comentario, u, p);
        DaoComentario.salvar(c , Integer.valueOf(postId) , Integer.valueOf(usuarioId));
        String url = "index.jsp";
        response.sendRedirect(url);
%>