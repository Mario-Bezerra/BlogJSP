package Controller;

import Dao.DaoPostagem;
import Dao.DaoUsuario;
import Entidades.Comentario;
import Entidades.Enums.Status;
import Entidades.Postagem;
import Utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Buscador {

    public static List<Comentario> comentariosDaPostagem(Integer postagemId){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            String sql = "select * from comentario c left join postagem" +
            "on c.Postagem_id = ?";
            try{
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, postagemId);
                ResultSet rs = stm.executeQuery();
                Comentario c = new Comentario();
                c.setId(rs.getInt("idComentario"));
                c.setStatus(Status.valueOf(rs.getString("status")));
                c.setPostagemId(DaoPostagem.consultar(rs.getInt("Postagem_id")));
                c.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                c.setConteudo(rs.getString("conteudo"));
                c.setTempoCriado(rs.getTimestamp("tempoCriado"));
                lista.add(c);
            } catch (Exception e) {
                return lista;
            }
        }
        return lista;
    }

    public  static List<Postagem> consultaInicial(){
        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from postagem p order by p.tempoCriado desc limit 10");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Postagem p = new Postagem();
                    p.setId(rs.getInt("idPostagem"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setConteudo(rs.getString("conteudo"));
                    p.setTempoCriado(rs.getTimestamp("tempoCriado"));
                    p.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                    p.setSubtitle(p.getFirstFifteen());
                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static List<Comentario> comentariosAguardandoAprovacao(){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from comentario c where c.status = 'AGUARDANDO_APROVACAO'");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Comentario c = new Comentario();
                    c.setId(rs.getInt("idComentario"));
                    c.setStatus(Status.valueOf(rs.getString("status")));
                    c.setPostagemId(DaoPostagem.consultar(rs.getInt("Postagem_id")));
                    c.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                    c.setConteudo(rs.getString("conteudo"));
                    c.setTempoCriado(rs.getTimestamp("tempoCriado"));
                    lista.add(c);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static List<Comentario> comentariosAprovados(Integer postagemId){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from comentario c where c.status = 'APROVADO' " +
                                "and c.Postagem_id = " + postagemId);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Comentario c = new Comentario();
                    c.setId(rs.getInt("idComentario"));
                    c.setStatus(Status.valueOf(rs.getString("status")));
                    c.setPostagemId(DaoPostagem.consultar(rs.getInt("Postagem_id")));
                    c.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                    c.setConteudo(rs.getString("conteudo"));
                    c.setTempoCriado(rs.getTimestamp("tempoCriado"));
                    lista.add(c);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static List<Comentario> comentariosReprovados(){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            String sql = "select * from comentario c where c.status = 'REPROVADO'";
            try{
                PreparedStatement stm = con.prepareStatement(sql);
                ResultSet rs = stm.executeQuery();
                Comentario c = new Comentario();
                c.setId(rs.getInt("idComentario"));
                c.setStatus(Status.valueOf(rs.getString("status")));
                c.setPostagemId(DaoPostagem.consultar(rs.getInt("Postagem_id")));
                c.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                c.setConteudo(rs.getString("conteudo"));
                c.setTempoCriado(rs.getTimestamp("tempoCriado"));
                lista.add(c);
            } catch (Exception e) {
                return lista;
            }
        }
        return lista;
    }
}
