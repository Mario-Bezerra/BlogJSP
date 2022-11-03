<%@ page import="Entidades.Comentario" %>
<%@ page import="Dao.DaoComentario" %>

<%
    Integer id = Integer.valueOf(request.getParameter("idComent"));
    Comentario c = DaoComentario.consultar(id);
    c.reprovar();
    DaoComentario.alterar(c);
    response.sendRedirect("moderador.jsp");
%>