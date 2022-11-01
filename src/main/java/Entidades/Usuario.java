package Entidades;

import Entidades.Enums.Perfil;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Usuario {

    private Integer id;
    private String email;
    private String senha;
    private Perfil perfil;

    public Usuario() {}

    public Usuario(Integer id, String email, String senha, Perfil perfil) {
        this.id = id;
        this.email = email;
        this.senha = senha;
        this.perfil = perfil;
    }
}
