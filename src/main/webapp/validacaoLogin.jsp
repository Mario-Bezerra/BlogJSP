<%@ page import="Entidades.Usuario" %>
<%@ page import="Dao.DaoUsuario" %>

<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    Usuario u = DaoUsuario.consultar(email);
    System.out.println(u);
    if(!(u == null)){
    String url = "index.jsp?estaLogado=true&usuarioId=" +u.getId()+ "&perfil=" +u.getPerfilString();
    if(u.getSenha().equals(senha)){
        response.sendRedirect(url);
        }
    }

%>