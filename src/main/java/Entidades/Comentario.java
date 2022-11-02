package Entidades;

import Entidades.Enums.Status;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class Comentario {

    private Integer id = 0;
    private String conteudo;
    private Usuario usuarioId;
    private Postagem postagemId;
    private Status status;
    private Timestamp tempoCriado;

    public Comentario() {}

    public Comentario(String conteudo, Usuario usuarioId, Postagem postagemId) {
        this.id = id;
        this.conteudo = conteudo;
        this.usuarioId = usuarioId;
        this.postagemId = postagemId;
        this.status = Status.AGUARDANDO_APROVACAO;
        this.tempoCriado = Timestamp.valueOf(LocalDateTime.now());
    }

    public String getStatusString(){
        return this.status.toString();
    }
    
}
