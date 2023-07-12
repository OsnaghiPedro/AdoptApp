package ar.edu.unlam.tallerweb1.delivery;

import ar.edu.unlam.tallerweb1.annotations.RequireAuth;
import ar.edu.unlam.tallerweb1.delivery.dto.CalificacionDto;
import ar.edu.unlam.tallerweb1.delivery.dto.SolicitudDto;
import ar.edu.unlam.tallerweb1.domain.Calificacion.IServicioCalificacion;
import ar.edu.unlam.tallerweb1.domain.Solicitud.IServicioSolicitud;
import ar.edu.unlam.tallerweb1.domain.auth.IServicioAuth;
import ar.edu.unlam.tallerweb1.domain.chat.IServicioChat;
import ar.edu.unlam.tallerweb1.domain.exceptions.DataValidationException;
import ar.edu.unlam.tallerweb1.domain.exceptions.SolicitudException;
import ar.edu.unlam.tallerweb1.domain.notificacion.IServicioNotificacion;
import ar.edu.unlam.tallerweb1.domain.publicaciones.IServicioPublicacion;
import ar.edu.unlam.tallerweb1.model.Notificacion;
import ar.edu.unlam.tallerweb1.model.Publicacion;
import ar.edu.unlam.tallerweb1.model.Solicitud;
import ar.edu.unlam.tallerweb1.model.Usuario;
import ar.edu.unlam.tallerweb1.model.enumerated.TipoNotificacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(path = "/solicitud")
public class ControladorSolicitud {


    private final IServicioSolicitud servicioSolicitud;
    private final IServicioAuth servicioAuth;
    private final IServicioCalificacion serviciocalificacion;
    private final IServicioChat servicioChat;
    private final IServicioNotificacion servicioNotificacion;
    private final IServicioPublicacion servicioPublicacion;

    @Autowired
    public ControladorSolicitud(IServicioSolicitud servicioSolicitud, IServicioAuth servicioAuth, IServicioCalificacion servicioCalificacion, IServicioChat servicioChat, IServicioNotificacion servicioNotificacion, IServicioPublicacion servicioPublicacion){
        this.servicioSolicitud = servicioSolicitud;
        this.servicioAuth = servicioAuth;
        this.serviciocalificacion = servicioCalificacion;
        this.servicioChat = servicioChat;
        this.servicioNotificacion = servicioNotificacion;
        this.servicioPublicacion = servicioPublicacion;
    }

    @RequireAuth
    @RequestMapping(path = "/enviar", method = RequestMethod.POST)
    public ModelAndView enviarSolicitud(@ModelAttribute("publicacionDto") SolicitudDto solicitudDto, HttpServletRequest request) {

        try{

            this.servicioSolicitud.enviarSolicitud(solicitudDto);

            Publicacion publicacion = this.servicioPublicacion.getPublicacion(solicitudDto.getPublicacion().getId());

            // notificacion
            this.servicioNotificacion.crearNotificacion(TipoNotificacion.NUEVA_SOLICITUD, publicacion);

        }catch (DataValidationException error){
            return new ModelAndView("redirect: " + request.getContextPath() + "/publicacion/ver?pid=" + solicitudDto.getPublicacionSol().getId() + "&sol_response=error");
        }

        return new ModelAndView("redirect: " + request.getContextPath() + "/publicacion/ver?pid=" + solicitudDto.getPublicacionSol().getId() + "&sol_response=success");

    }

    @RequireAuth
    @RequestMapping(path = "/cancelar")
    public ModelAndView cancelarSolicitud(@RequestParam String code, @RequestParam(required = false) String target, HttpServletRequest request) {

        Solicitud solicitud = this.servicioSolicitud.getSolicitud(code);
        this.servicioSolicitud.cancelarSolicitud(solicitud);


        switch (target){
            case "publicacion":
                return new ModelAndView("redirect: " + request.getContextPath() + "/publicacion/ver?pid=" + solicitud.getPublicacion().getId());
            case "perfil":
                return new ModelAndView("redirect: " + request.getContextPath() + "/perfil/actividad/solicitudes");
            case "perfil-solicitud":
                return new ModelAndView("redirect: " + request.getContextPath() + "/perfil/solicitud?pid=" + solicitud.getPublicacion().getId());

            default:
                return new ModelAndView("redirect: " + request.getContextPath() + "/home");
        }


    }

    @RequireAuth
    @RequestMapping(path = "/aceptar")
    public ModelAndView aceptarSolicitud(@RequestParam String code, @RequestParam(required = false) String target, HttpServletRequest request) {

        Solicitud solicitud = this.servicioSolicitud.getSolicitud(code);
        try {
            this.servicioSolicitud.aceptarSolicitud(solicitud, this.servicioAuth.getUsuarioAutenticado());
        }catch (SolicitudException err){
            return new ModelAndView("redirect: " + request.getContextPath() + "/home?response=error#1001");
        }

        //notificacion
        this.servicioNotificacion.crearNotificacion(TipoNotificacion.ACEPT_SOLICITUD,solicitud);

        switch (target){

            case "solicitud":
                return new ModelAndView("redirect: " + request.getContextPath() + "/solicitud/publicador?code=" + solicitud.getCodigo() + "&target=perfil-solicitud");
            case "perfil-solicitud":
                return new ModelAndView("redirect: " + request.getContextPath() + "/perfil/solicitud?pid=" + solicitud.getPublicacion().getId());

            default:
                return new ModelAndView("redirect: " + request.getContextPath() + "/home");
        }
    }

    @RequireAuth
    @RequestMapping(path = "/entregar")
    public ModelAndView entregar(@RequestParam String code, @RequestParam(required = false) String target, HttpServletRequest request) {

        Solicitud solicitud = this.servicioSolicitud.getSolicitud(code);

        try {
            this.servicioSolicitud.confirmarEntrega(solicitud, this.servicioAuth.getUsuarioAutenticado());
        }catch (SolicitudException err){
            return new ModelAndView("redirect: " + request.getContextPath() + "/home?response=error#1001");
        }

        return new ModelAndView("redirect: " + request.getContextPath() + "/solicitud/publicador?code=" + solicitud.getCodigo()+"&target=" + target);

    }

    @RequireAuth
    @RequestMapping(path = "/cerrar")
    public ModelAndView cerrar(@RequestParam String code, @RequestParam(required = false) String target, HttpServletRequest request) {

        Solicitud solicitud = this.servicioSolicitud.getSolicitud(code);

        try {
            this.servicioSolicitud.confirmarCierre(solicitud, this.servicioAuth.getUsuarioAutenticado());
        }catch (SolicitudException err){
            return new ModelAndView("redirect: " + request.getContextPath() + "/home?response=error#1001");
        }

        return new ModelAndView("redirect: " + request.getContextPath() + "/solicitud/publicador?code=" + solicitud.getCodigo()+"&target=" + target);

    }

    @RequireAuth
    @RequestMapping(path = "/adoptante")
    public ModelAndView adoptante(@RequestParam String code, @RequestParam(required = false) String target, @RequestParam(required = false)String error, HttpServletRequest request) {
        ModelMap model = new ModelMap();

        model.put("usuario", this.servicioAuth.getUsuarioAutenticado());
        model.put("solicitud", this.servicioSolicitud.getSolicitud(code));
        model.put("solicitudDto", new SolicitudDto());
        model.put("target", target);
        model.put("error",error);
        model.put("calificacion", new CalificacionDto());

        model.put("mensajes_chat", this.servicioChat.listarMensajesDeSolicitud(code));

        return new ModelAndView("post-solicitud-adoptante", model);

    }

    @RequireAuth
    @RequestMapping(path = "/publicador")
    public ModelAndView publicador(@RequestParam String code, @RequestParam(required = false) String target, @RequestParam(required = false)String error, HttpServletRequest request) {
        ModelMap model = new ModelMap();

        model.put("usuario", this.servicioAuth.getUsuarioAutenticado());
        model.put("solicitud", this.servicioSolicitud.getSolicitud(code));
        model.put("target", target);
        model.put("error",error);
        model.put("calificacion", new CalificacionDto());

        model.put("mensajes_chat", this.servicioChat.listarMensajesDeSolicitud(code));


        return new ModelAndView("post-solicitud-publicador", model);

    }

    @RequireAuth
    @RequestMapping(path = "/cancelacion-adoptante", method = RequestMethod.POST)
    public ModelAndView cancelacionAdoptante(@ModelAttribute("solicitudDto") SolicitudDto solicitudDto,@RequestParam(required = false) String target, HttpServletRequest request) {

        this.servicioSolicitud.cancelarProcesoDeAdopcion(solicitudDto);

        //notificacion
        this.servicioNotificacion.crearNotificacion(TipoNotificacion.CANCEL_SOLICITUD,this.servicioSolicitud.getSolicitud(solicitudDto.getCodigo()));

        return new ModelAndView("redirect: "  + request.getContextPath() + "/solicitud/adoptante?code=" + solicitudDto.getCodigo() + "&target=" + target);

    }

    @RequireAuth
    @RequestMapping(path = "/calificarAdoptante", method = RequestMethod.POST)
    public ModelAndView calificarAdoptante(@ModelAttribute("calificacion") CalificacionDto calificacion,  @RequestParam Long id, @RequestParam String code, @RequestParam(required = false) String target,HttpServletRequest request) {
        Usuario usuarioCalificado = new Usuario();
        usuarioCalificado.setId(id);
        calificacion.setUsuarioCalificado(usuarioCalificado);

        try{
            this.serviciocalificacion.calificarAdoptante(calificacion);
        }catch (DataValidationException err){
            return new ModelAndView("redirect: " + request.getContextPath() + "/solicitud/publicador?code=" + code+"&target=" + target +"&error=" + err.getMessage());

        }

        //si esta ok actualizo el flag de calificaci�n en solicitud
        Solicitud solicitud = this.servicioSolicitud.getSolicitud(code);
        solicitud.setCalP(true);
        this.servicioSolicitud.actualizarSolicitud(solicitud);

        return new ModelAndView("redirect: " + request.getContextPath() + "/solicitud/publicador?code=" + code + "&target=" + target);

    }

    @RequireAuth
    @RequestMapping(path = "/calificarPublicador", method = RequestMethod.POST)
    public ModelAndView calificarPublicador(@ModelAttribute("calificacion") CalificacionDto calificacion,  @RequestParam Long id, @RequestParam String code, @RequestParam(required = false) String target, HttpServletRequest request) {
        Usuario usuarioCalificado = new Usuario();
        usuarioCalificado.setId(id);
        calificacion.setUsuarioCalificado(usuarioCalificado);

        try{
            this.serviciocalificacion.calificarPublicador(calificacion);
        }catch (DataValidationException err){
            return new ModelAndView("redirect: " + request.getContextPath() + "/solicitud/adoptante?code=" + code+ "&target=" + target + "&error=" + err.getMessage());

        }

        //si esta ok actualizo el flag de calificaci�n en solicitud
        Solicitud solicitud = this.servicioSolicitud.getSolicitud(code);
        solicitud.setCalA(true);
        this.servicioSolicitud.actualizarSolicitud(solicitud);

        return new ModelAndView("redirect: " + request.getContextPath() + "/solicitud/adoptante?code=" + code + "&target=" + target);

    }
}
