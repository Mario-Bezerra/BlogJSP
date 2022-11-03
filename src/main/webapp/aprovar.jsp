<%@ page import="Entidades.Comentario" %>
<%@ page import="Dao.DaoComentario" %>

<%
    Integer id = Integer.valueOf(request.getParameter("idComent"));
    Comentario c = DaoComentario.consultar(id);
    c.aprovar();
    System.out.println(c);
    DaoComentario.alterar(c);
    response.sendRedirect("moderador.jsp");
%>