<%@ page import="Dao.DaoPostagem" %>
<%@ page import="Entidades.Postagem" %>

<%

    Integer id = Integer.valueOf(request.getParameter("idPost"));
    DaoPostagem.excluir(id);
    response.sendRedirect("index.jsp");

%>