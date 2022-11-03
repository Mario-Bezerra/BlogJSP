package Entidades;

import Entidades.Enums.Perfil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class Usuario {

    private Integer id;
    private String nome;
    private String email;
    private String senha;
    private Perfil perfil;
    private Date dataNascimento;

    public Usuario() {}

    public Usuario(String nome, String email, String senha, Date dataNascimento) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.perfil = Perfil.USUARIO;
        this.dataNascimento = dataNascimento;
    }

    public String getPerfilString(){
        return this.perfil.toString();
    }

    public Date getDataNascimentoDate(){
        return Date.valueOf(this.dataNascimento.toLocalDate());
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", email='" + email + '\'' +
                ", senha='" + senha + '\'' +
                ", perfil=" + perfil +
                ", dataNascimento=" + dataNascimento +
                '}';
    }
}
