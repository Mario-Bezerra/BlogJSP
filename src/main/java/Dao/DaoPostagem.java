package Dao;

import Entidades.Postagem;
import Utils.Conexao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoPostagem {

    public static boolean salvar(Postagem p){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "insert into postagem(titulo,conteudo,Usuario_id,tempoCriado)" +
                    "values(?, ? , ? , ?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, p.getTitulo());
                stm.setString(2, p.getConteudo());
                stm.setInt(3, p.getUsuarioId().getId());
                stm.setTimestamp(4, p.getTempoCriado());
                stm.execute();

            } catch (SQLException e) {
                System.out.println("Erro: " + e.getMessage());
                return false;
            }
            return true;
        }
        return false;
    }

    public  static List<Postagem> consultar(){
        List<Postagem> lista = new ArrayList<Postagem>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from postagem");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Postagem p = new Postagem();
                    p.setId(rs.getInt("idPostagem"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setConteudo(rs.getString("conteudo"));
                    p.setTempoCriado(rs.getTimestamp("tempoCriado"));
                    p.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                    lista.add(p);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static Postagem consultar(int idPostagem){
        Connection con = Conexao.conectar();
        Postagem p = new Postagem();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from postagem where idPostagem = ?");
                stm.setInt(1,idPostagem);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    p.setId(rs.getInt("idPostagem"));
                    p.setTitulo(rs.getString("titulo"));
                    p.setConteudo(rs.getString("conteudo"));
                    p.setTempoCriado(rs.getTimestamp("tempoCriado"));
                    p.setUsuarioId(DaoUsuario.consultar(rs.getInt("Usuario_id")));
                }
            } catch (SQLException e) {
                return p;
            }
        }
        return p;
    }

    public static boolean alterar(Postagem p){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "update postagem set "+
                    "titulo = ?, conteudo = ?, "+
                    "tempoCriado = ?, Usuario_id = ? " +
                    " where idPostagem = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, p.getTitulo());
                stm.setString(2, p.getConteudo());
                stm.setTimestamp(3, p.getTempoCriado());
                stm.setInt(4, p.getUsuarioId().getId());
                stm.setInt(5, p.getId());
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
            String sql = "delete from postagem where idPostagem = ?";
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
