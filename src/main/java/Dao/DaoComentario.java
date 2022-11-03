package Dao;

import Entidades.Comentario;
import Entidades.Enums.Status;
import Utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoComentario {

    public static boolean salvar(Comentario c , Integer postagemId, Integer usuarioId){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "insert into comentario(status,Postagem_id,Usuario_id,conteudo,tempoCriado)" +
                    "values(?, ? , ? , ?, ?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, c.getStatusString());
                stm.setInt(2, postagemId);
                stm.setInt(3, usuarioId);
                stm.setString(4,c.getConteudo());
                stm.setTimestamp(5, c.getTempoCriado());
                stm.execute();

            } catch (SQLException e) {
                System.out.println("Erro: " + e.getMessage());
                return false;
            }
            return true;
        }
        return false;
    }

    public  static List<Comentario> consultar(){
        List<Comentario> lista = new ArrayList<Comentario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from comentario");
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

    public static Comentario consultar(int idPostagem){
        Connection con = Conexao.conectar();
        Comentario c = new Comentario();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from comentario where idComentario = ?");
                stm.setInt(1,idPostagem);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    c.setId(rs.getInt("idComentario"));
                    c.setStatus(Status.valueOf(rs.getString("status")));
                    c.setPostagemId(DaoPostagem.consultar(rs.getInt("Postagem_id")));
                    c.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                    c.setConteudo(rs.getString("conteudo"));
                    c.setTempoCriado(rs.getTimestamp("tempoCriado"));
                }
            } catch (SQLException e) {
                return c;
            }
        }
        return c;
    }

    public static boolean alterar(Comentario c){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "update comentario set " +
                    "status = ?, " +
                    "Postagem_id = ?, " +
                    "Usuario_id = ?, " +
                    "conteudo = ? " +
                    "where idComentario = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, c.getStatusString());
                stm.setInt(2, c.getPostagemId().getId());
                stm.setInt(3, c.getUsuarioId().getId());
                stm.setString(4, c.getConteudo());
                stm.setInt(5, c.getId());
                System.out.println(c);
                stm.execute();
                return true;
            } catch (SQLException e) {
                System.out.println("Não foi possivel alterar registro");
                return false;
            }
        }
        return false;
    }

    public static  boolean excluir(int id){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "delete from comentario where idComentario = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1,id);
                stm.executeUpdate();
                return true;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return false;
    }

}
