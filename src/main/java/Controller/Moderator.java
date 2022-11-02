package Controller;

import Dao.DaoComentario;
import Entidades.Comentario;
import Entidades.Enums.Status;

public class Moderator {

    public static boolean aprovarComentario(Integer comentarioId){
        Comentario consulta = DaoComentario.consultar(comentarioId);
        consulta.setStatus(Status.APROVADO);
        DaoComentario.alterar(consulta);
        return true;
    }

    public static boolean reprovarComentario(Integer comentarioId){
        Comentario consulta = DaoComentario.consultar(comentarioId);
        consulta.setStatus(Status.REPROVADO);
        DaoComentario.alterar(consulta);
        return true;
    }
}
