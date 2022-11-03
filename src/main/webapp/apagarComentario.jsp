<%@ page import="Entidades.Comentario" %>
<%@ page import="Dao.DaoComentario" %>

<%
    Integer idC = Integer.valueOf(request.getParameter("idC"));
    Integer idP = Integer.valueOf(request.getParameter("idP"));
    DaoComentario.excluir(idC);
    String url = "post.jsp?id=" + idP;
    response.sendRedirect(url);
%>