package Entidades;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Postagem {

    private Integer id;
    private String titulo;
    private String conteudo;
    private Usuario usuarioId;

    public Postagem() {}

    public Postagem(Integer id, String titulo, String conteudo, Usuario usuarioId) {
        this.id = id;
        this.titulo = titulo;
        this.conteudo = conteudo;
        this.usuarioId = usuarioId;
    }
}
