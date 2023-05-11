package ar.edu.unlam.tallerweb1.delivery;

import ar.edu.unlam.tallerweb1.domain.publicaciones.IServicioPublicacion;
import ar.edu.unlam.tallerweb1.domain.publicaciones.Publicacion;
import ar.edu.unlam.tallerweb1.domain.usuarios.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/home")
public class ControladorHome {

    private Usuario userAuth;
    private IServicioPublicacion servicioPublicacion;

    @Autowired
    public void ControladorHome(IServicioPublicacion servicioPublicacion){
        this.servicioPublicacion = servicioPublicacion;
    }

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public ModelAndView inicio() {
        return new ModelAndView("redirect:/home/feed");
    }

    @RequestMapping(path = "/feed",method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {

        userAuth = (Usuario) session.getAttribute("usuarioAutenticado");

        if(userAuth != null){
            ModelMap model = new ModelMap();
            //solicitar publicaciones
            List<Publicacion> publicaciones = servicioPublicacion.listarPublicaciones();


            model.addAttribute("usuario", userAuth);
            model.addAttribute("publicaciones", publicaciones);
            return new ModelAndView("index-feed",model);
        }

        return new ModelAndView("redirect:/login");

    }
}
