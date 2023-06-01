package ar.edu.unlam.tallerweb1.domain.Mensajes;

import ar.edu.unlam.tallerweb1.delivery.dto.MensajeDto;
import ar.edu.unlam.tallerweb1.model.Mensaje;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

@Service
public class ServicioMensajes implements IServicioMensajes{


    private final IRepositorioMensajes repositorioMensajes;

    @Autowired
    public ServicioMensajes(IRepositorioMensajes repositorioMensajes){
        this.repositorioMensajes = repositorioMensajes;
    }

    @Override
    public Long enviarMensaje(MensajeDto msjDto) {

        Mensaje msj = new Mensaje(msjDto.getPublicacion(), msjDto.getEmisor(), msjDto.getPregunta());

        return this.repositorioMensajes.guardarMensaje(msj);

    }

    @Override
    public Mensaje responderMensaje(MensajeDto msjDto) {
        Mensaje msj = this.repositorioMensajes.obtenerMensaje(msjDto.getId());

        msj.setRespuesta(msjDto.getRespuesta());
        msj.setFechaRespuesta(Timestamp.from(Instant.now()));

        return this.repositorioMensajes.actualizarMensaje(msj);


    }

    @Override
    public Mensaje eliminarRespuesta(Long idMensaje) {
        Mensaje msj = this.repositorioMensajes.obtenerMensaje(idMensaje);

        msj.setRespuesta(null);
        msj.setFechaRespuesta(null);

        msj = this.repositorioMensajes.actualizarMensaje(msj);

        return msj;
    }

    @Override
    public List<Mensaje> listarMensajesPublicacion(Long idPublicacion) {
        return this.repositorioMensajes.listarMensajesPublicacion(idPublicacion);
    }

    @Override
    public List<Mensaje> listarMensajesSinResponder(Long idPublicacion) {

        return idPublicacion == null ? null : this.repositorioMensajes.listarMensajesSinResponder(idPublicacion);
    }

    @Override
    public List<Mensaje> listarMensajesRespondidos(Long idPublicacion) {

        return idPublicacion == null ? null : this.repositorioMensajes.listarMensajesRespondidos(idPublicacion);
    }
}
