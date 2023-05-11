package ar.edu.unlam.tallerweb1.infrastructure;

import ar.edu.unlam.tallerweb1.domain.publicaciones.Publicacion;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("repositorioPublicacion")
public class RepositorioPublicacion implements IRepositorioPublicacion {
    private SessionFactory sessionFactory;
    @Autowired
    public RepositorioPublicacion(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Publicacion buscarPublicacionPorId(Long id) {
        return null;
    }

    @Override
    public void guardarPublicacion(Publicacion publicacion) {
        sessionFactory.getCurrentSession().save(publicacion);
    }

    @Override
    public void modificarPublicacion(Publicacion publicacion) {
    }

    @Override
    public void eliminarPublicacion(Long IdPublicacion) {

    }

    @Override
    public List<Publicacion> listarPublicaciones() {
        return null;
    }

    @Override
    public List<Publicacion> listarPublicacionesPorUsuarioId(Long idUsuario) {
        return null;
    }
}
