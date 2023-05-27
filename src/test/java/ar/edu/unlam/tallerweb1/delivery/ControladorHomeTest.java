package ar.edu.unlam.tallerweb1.delivery;

import ar.edu.unlam.tallerweb1.model.Usuario;
import org.junit.Before;
import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;


import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class ControladorHomeTest {

    private ControladorHome controladorHome;

    private HttpSession session;

    private Usuario usuario;

    @Before
    public void init(){
        session = mock(HttpSession.class);
        controladorHome = new ControladorHome();
    }

//TODO ARREGLAR
//    @Test
//    public void alAccederAlHomeSinEstarAutenticadoDebeEnviarALogin(){
//        dadoQueNoHayUsuarioAutenticado();
//        ModelAndView vista = alAccederAlHome();
//        debeEnviarAlLogin(vista);
//    }
//
//TODO ARREGLAR
//    @Test
//    public void alAccederAlHomeEstandoAutenticadoDebeMostrarElHome(){
//        dadoQueHayUsuarioAutenticado();
//        ModelAndView vista = alAccederAlHome();
//        debeEnviarAlHome(vista);
//    }

    private void debeEnviarAlHome(ModelAndView vista) {
        assertThat(vista.getViewName()).isEqualTo("index-feed");
    }

    private void dadoQueHayUsuarioAutenticado() {
        usuario = new Usuario("Pedro Osnaghi", "osnaghi@gmail.com", "1234");
//        usuario.setId(100L);
//        usuario.setNombre("Pedro Osnaghi");
//        usuario.setEmail("osnaghi@gmail.com");
        when(session.getAttribute("usuarioAutenticado")).thenReturn(usuario);
    }

    private void debeEnviarAlLogin(ModelAndView vista) {
        assertThat(vista.getViewName()).isEqualTo("redirect:/login");
    }

    private ModelAndView alAccederAlHome() {
        return controladorHome.feed(null);
    }

    private void dadoQueNoHayUsuarioAutenticado() {
        when(session.getAttribute("usuarioAutenticado")).thenReturn(null);
    }


}
