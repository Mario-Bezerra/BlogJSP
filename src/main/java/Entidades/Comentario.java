package Entidades;

import Entidades.Enums.Status;
import javafx.geometry.Pos;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Comentario {

    private Integer id;
    private String conteudo;
    private Usuario usuarioId;
    private Postagem postagemId;
    private Status status;

    public Comentario() {}

    public Comentario(Integer id, String conteudo, Usuario usuarioId, Postagem postagemId, Status status) {
        this.id = id;
        this.conteudo = conteudo;
        this.usuarioId = usuarioId;
        this.postagemId = postagemId;
        this.status = status;
    }
}
