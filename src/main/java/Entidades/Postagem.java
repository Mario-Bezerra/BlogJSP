package Entidades;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class Postagem {

    private Integer id;
    private String titulo;
    private String conteudo;
    private Usuario usuarioId;
    private Timestamp tempoCriado;
    private String subtitle;

    public Postagem() {}

    public Postagem(String titulo, String conteudo, Usuario usuarioId) {
        this.titulo = titulo;
        this.conteudo = conteudo;
        this.usuarioId = usuarioId;
        this.tempoCriado = Timestamp.valueOf(LocalDateTime.now());
    }

    public String getFirstFifteen(){
        String txt = "";
        String[] s = this.conteudo.split(" ");
        for (int i=0 ; i<15 ; i++){
            txt += " " + s[i];
        }
        return txt;
    }
}
