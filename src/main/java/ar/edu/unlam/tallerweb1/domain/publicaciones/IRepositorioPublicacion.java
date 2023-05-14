package ar.edu.unlam.tallerweb1.domain.publicaciones;

import ar.edu.unlam.tallerweb1.model.Publicacion;

import java.util.List;

public interface IRepositorioPublicacion {
    Publicacion buscarPublicacionPorId(Long id);
    Publicacion guardarPublicacion(Publicacion publicacion);
    void modificarPublicacion(Publicacion publicacion);

    void eliminarPublicacion(Long IdPublicacion);

    List<Publicacion> listarPublicaciones();

    List<Publicacion> listarPublicacionesPorUsuarioId(Long idUsuario);
}
