package ar.edu.unlam.tallerweb1.domain.publicaciones;

import ar.edu.unlam.tallerweb1.delivery.PublicacionDto;
import ar.edu.unlam.tallerweb1.domain.archivos.IServicioArchivo;
import ar.edu.unlam.tallerweb1.infrastructure.RepositorioPublicacion;
import ar.edu.unlam.tallerweb1.model.Publicacion;
import ar.edu.unlam.tallerweb1.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("servicioPublicacion")
@Transactional
public class ServicioPublicacion implements IServicioPublicacion{

    private String errorMessage;
    private final IServicioArchivo servicioArchivo;
    private RepositorioPublicacion repositorioPublicacion;

    @Autowired
    public ServicioPublicacion(RepositorioPublicacion repositorioPublicacion, IServicioArchivo servicioArchivo){
        this.repositorioPublicacion = repositorioPublicacion;
        this.servicioArchivo = servicioArchivo;
    }

    @Override
    public Publicacion findPublicacion (Long id) {
        return repositorioPublicacion.buscarPublicacionPorId(id);
    }

    @Override
    public Long  guardarPublicacion(PublicacionDto publicacionDto, Usuario usuario) {

        if (!this.validarDatos(publicacionDto))
            return null;
        return this.publicar(publicacionDto,usuario);
    }

    private boolean validarDatos(PublicacionDto pd) {
        if(pd.getMascota_id() == null){
            this.errorMessage = "Debe seleccionar una mascota";
            return false;
        }
        if(pd.getDireccion() == null){
            this.errorMessage = "Debe especificar una direcci�n de entrega";
            return false;
        }

        return true;
    }

    private Long publicar(PublicacionDto publicacionDto, Usuario usuario) {
        Publicacion pub = this.setearPublicacion(publicacionDto, usuario);

        repositorioPublicacion.guardarPublicacion(pub);

        this.servicioArchivo.subirImagenesPost(publicacionDto.getFiles(), pub);

        return pub.getId();

    }

    private Publicacion setearPublicacion(PublicacionDto publicacionDto, Usuario user) {
        Publicacion p = new Publicacion();
        p.setBio(publicacionDto.getBio());
        p.setMascota_id(publicacionDto.getMascota_id());
        p.setDireccion(publicacionDto.getDireccion());
        p.setDisponibilidad(publicacionDto.getDisponibilidad());
        p.setLatitud(publicacionDto.getLatitud());
        p.setLongitud(publicacionDto.getLongitud());
        p.setDireccion(publicacionDto.getDireccion());
        p.setEstado("disponible");
        p.setUsuario(user);

        return p;
    }

    @Override
    public void modificarPublicacion(Publicacion publicacion) {

    }

    @Override
    public void eliminarPublicacion(Long IdPublicacion) {

    }

    @Override
    public List<Publicacion> listarPublicacionesPorUsuarioId(Long idUsuario) {
        return repositorioPublicacion.listarPublicacionesPorUsuarioId(idUsuario);
    }

    @Override
    public List<Publicacion> listarPublicaciones() {
        return repositorioPublicacion.listarPublicaciones();
    }

    @Override
    public String getErrorMessage(){
        return this.errorMessage;
    }
}
