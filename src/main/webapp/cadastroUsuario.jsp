<%@ page import="Entidades.Usuario" %>
<%@ page import="Dao.DaoUsuario" %>
<%@ page import="java.sql.Date" %>

<%
    String nome = request.getParameter("nome");
    String sobrenome = request.getParameter("sobrenome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String nomeCompleto = nome + " " + sobrenome;
    Date data = Date.valueOf(request.getParameter("dataNascimento"));
    Usuario u = new Usuario(nomeCompleto, email , senha, data);
    DaoUsuario.salvar(u);
    response.sendRedirect("login.jsp");

%>