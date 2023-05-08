package ar.edu.unlam.tallerweb1.infrastructure;

import ar.edu.unlam.tallerweb1.domain.usuarios.RepositorioUsuarioDeprec;
import ar.edu.unlam.tallerweb1.domain.usuarios.UsuarioDeprec;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// implelemtacion del repositorio de usuarios, la anotacion @Repository indica a Spring que esta clase es un componente que debe
// ser manejado por el framework, debe indicarse en applicationContext que busque en el paquete ar.edu.unlam.tallerweb1.dao
// para encontrar esta clase.
@Repository("repositorioUsuarioDeprec")
public class RepositorioUsuarioDeprecImpl implements RepositorioUsuarioDeprec {

	// Maneja acciones de persistencia, normalmente estara inyectado el session factory de hibernate
	// el mismo esta difinido en el archivo hibernateContext.xml
	private SessionFactory sessionFactory;

    @Autowired
	public RepositorioUsuarioDeprecImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}

	@Override
	public UsuarioDeprec buscarUsuario(String email, String password) {

		// Se obtiene la sesion asociada a la transaccion iniciada en el servicio que invoca a este metodo y se crea un criterio
		// de busqueda de Usuario donde el email y password sean iguales a los del objeto recibido como parametro
		// uniqueResult da error si se encuentran mas de un resultado en la busqueda.
		final Session session = sessionFactory.getCurrentSession();
		return (UsuarioDeprec) session.createCriteria(UsuarioDeprec.class)
				.add(Restrictions.eq("email", email))
				.add(Restrictions.eq("password", password))
				.uniqueResult();
	}

	@Override
	public void guardar(UsuarioDeprec usuarioDeprec) {
		sessionFactory.getCurrentSession().save(usuarioDeprec);
	}

	@Override
	public UsuarioDeprec buscar(String email) {
		return (UsuarioDeprec) sessionFactory.getCurrentSession().createCriteria(UsuarioDeprec.class)
				.add(Restrictions.eq("email", email))
				.uniqueResult();
	}

	@Override
	public void modificar(UsuarioDeprec usuarioDeprec) {
		sessionFactory.getCurrentSession().update(usuarioDeprec);
	}

}
