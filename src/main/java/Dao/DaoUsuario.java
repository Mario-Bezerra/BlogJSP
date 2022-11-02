package Dao;

import Entidades.Enums.Perfil;
import Entidades.Usuario;
import Utils.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUsuario {

    public static boolean salvar(Usuario usuario){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "insert into usuario(email,senha,perfil,nome,dataNascimento)" +
                    "values(?, ? , ? , ?, ?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, usuario.getEmail());
                stm.setString(2, usuario.getSenha());
                stm.setString(3,usuario.getPerfilString());
                stm.setString(4,usuario.getNome());
                stm.setDate(5,usuario.getDataNascimentoDate());

                stm.execute();

            } catch (SQLException e) {
                System.out.println("Erro: " + e.getMessage());
                return false;
            }
            return true;
        }
        return false;
    }

    public  static List<Usuario> consultar(){
        List<Usuario> lista = new ArrayList<Usuario>();
        Connection con = Conexao.conectar();
        if(con != null) {
            try {
                PreparedStatement stm =
                        con.prepareStatement(
                                "select * from usuario");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Usuario u = new Usuario();
                    u.setId(rs.getInt("idUsuario"));
                    u.setNome(rs.getString("nome"));
                    u.setPerfil(Perfil.valueOf(rs.getString("perfil")));
                    u.setEmail(rs.getString("email"));
                    u.setDataNascimento(rs.getDate("dataNascimento"));
                    lista.add(u);
                }
            } catch (SQLException e) {
                return lista;
            }
        }
        return lista;
    }

    public static Usuario consultar(int idUsuario){
        Connection con = Conexao.conectar();
        Usuario u = new Usuario();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuario where idUsuario = ?");
                stm.setInt(1,idUsuario);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    u.setId(rs.getInt("idUsuario"));
                    u.setNome(rs.getString("nome"));
                    u.setPerfil(Perfil.valueOf(rs.getString("perfil")));
                    u.setEmail(rs.getString("email"));
                    u.setDataNascimento(rs.getDate("dataNascimento"));
                    u.setSenha(rs.getString("senha"));
                }
            } catch (SQLException e) {
                return u;
            }
        }
        return u;
    }

    public static Usuario consultar(String email){
        Connection con = Conexao.conectar();
        Usuario u = new Usuario();
        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuario where email = ?");
                stm.setString(1,email);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    u.setId(rs.getInt("idUsuario"));
                    u.setNome(rs.getString("nome"));
                    u.setPerfil(Perfil.valueOf(rs.getString("perfil")));
                    u.setEmail(rs.getString("email"));
                    u.setDataNascimento(rs.getDate("dataNascimento"));
                    u.setSenha(rs.getString("senha"));
                }
            } catch (SQLException e) {
                return u;
            }
        }
        return u;
    }

    public static boolean alterar(Usuario u){
        Connection con = Conexao.conectar();
        if(con != null){
            String sql = "update usuario set "+
                    "email = ?, senha = ?, "+
                    "nome = ?, dataNascimento = ? " +
                    " where idUsuario = ?";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, u.getEmail());
                stm.setString(2, u.getSenha());
                stm.setString(3, u.getNome());
                stm.setDate(4, u.getDataNascimentoDate());
                stm.setInt(5, u.getId());
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
            String sql = "delete from usuario where idUsuario = ?";
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
