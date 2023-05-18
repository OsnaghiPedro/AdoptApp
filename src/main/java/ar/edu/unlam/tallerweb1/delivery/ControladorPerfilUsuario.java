package ar.edu.unlam.tallerweb1.delivery;
import ar.edu.unlam.tallerweb1.domain.usuarios.IServicioUsuario;
import ar.edu.unlam.tallerweb1.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/perfil")
public class ControladorPerfilUsuario {


    private IServicioUsuario servicioUsuario;

    @Autowired
    public ControladorPerfilUsuario(IServicioUsuario servicioUsuario){
        this.servicioUsuario = servicioUsuario;
    }

    @RequestMapping("/actividad/posts")
    public ModelAndView misPublicaciones(){
        ModelMap model = new ModelMap();

        model.put("target", "actividad");

        model.put("seccion", "posts");

        //TODO Implementar sevicio de Calificaciones

        //TODO implementar Listado de publicaciones del usuario

        return new ModelAndView("user-profile-activity-posts", model);
    }

    @RequestMapping("/actividad/favoritos")
    public ModelAndView misFavoritos(){
        ModelMap model = new ModelMap();

        model.put("target", "actividad");

        model.put("seccion", "favoritos");

        //TODO Implementar sevicio de Calificaciones

        //TODO implementar Listado de favoritos de usuario

        return new ModelAndView("user-profile-activity-favorites", model);
    }

    @RequestMapping("/actividad/solicitudes")
    public ModelAndView misSolicitudes(){
        ModelMap model = new ModelMap();

        model.put("target", "actividad");

        model.put("seccion", "solicitudes");

        //TODO Implementar sevicio de Calificaciones

        //TODO implementar Listado de mis solicitudes de adopcion

        return new ModelAndView("user-profile-activity-solicitudes", model);
    }

    @RequestMapping("/actividad/mismascotas")
    public ModelAndView misMascotas(){
        ModelMap model = new ModelMap();

        model.put("target", "actividad");

        model.put("seccion", "mascotas");

        //TODO Implementar sevicio de Calificaciones

        //TODO implementar Listado de mis mascotas

        return new ModelAndView("user-profile-activity-mascot", model);
    }

    @RequestMapping("/info")
    public ModelAndView infoUsuario(HttpSession session){
        ModelMap model = new ModelMap();

        model.put("target", "info");

        Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

        model.put("user", usuario);


        //TODO enviar datos del usuario a la vista

        return new ModelAndView("user-profile-info", model);
    }

    @RequestMapping("/solicitud")
    public ModelAndView solicitudesUsuario(){
        ModelMap model = new ModelMap();

        model.put("target", "solicitud");

        //TODO mostrar solicitudes de adopcion

        return new ModelAndView("user-profile-request", model);
    }

    @RequestMapping("/mensajes")
    public ModelAndView verMensajes(){
        ModelMap model = new ModelMap();

        model.put("target", "mensajes");

        //TODO implementar Servicio de Mensajeria

        return new ModelAndView("user-profile-messages", model);
    }



    @RequestMapping("/info/editar")
    public ModelAndView irAEditarDatos(HttpSession session) {
        ModelMap model = new ModelMap();

        model.put("target", "info");

        Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");

        model.put("user", usuario);

        UsuarioDto usuarioDto = this.setearDatos(usuario);

        model.put("usuarioDto", usuarioDto);

        return new ModelAndView("user-profile-edit", model);
    }


    @RequestMapping(value = "/info/actualizar", method = RequestMethod.POST)
    public ModelAndView guardarDatos() {
        ModelMap modelo = new ModelMap();
      //  modelo.put("datos-usuario", new DatosLogin());

      //  this.usuarioServicio.guardarDatos();
        return new ModelAndView("editar-datos", modelo);
    }

    private UsuarioDto setearDatos(Usuario usuario) {
        UsuarioDto udto = new UsuarioDto();
        udto.setId(usuario.getId());
        udto.setNombre(usuario.getNombre());
        udto.setF_nac(usuario.getF_nac());
        udto.setImagen(usuario.getImagen());
        udto.setPresentacion("Holaaa");
        udto.setDomicilio(usuario.getDomicilio());
        udto.setCiudad(usuario.getCiudad());
        udto.setProvincia(usuario.getProvincia());
        udto.setLat(usuario.getLat());
        udto.setLng(usuario.getLng());

        return udto;

    }


}


