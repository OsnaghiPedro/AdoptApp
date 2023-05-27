package ar.edu.unlam.tallerweb1.infrastructure;

import ar.edu.unlam.tallerweb1.domain.mascota.IRepositorioMascota;
import ar.edu.unlam.tallerweb1.model.Mascota;
import ar.edu.unlam.tallerweb1.model.Publicacion;
import ar.edu.unlam.tallerweb1.model.Usuario;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;
import java.util.List;

@Repository
@Transactional
public class RepositorioMascota implements IRepositorioMascota {

    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioMascota(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void guardar(Mascota mascota){
        this.sessionFactory.getCurrentSession().save(mascota);
    }

    @Override
    public List<Mascota> listarMascotasaPublicar(Usuario usuario) {

        EntityManager entityManager = this.sessionFactory.createEntityManager();

        List<Mascota> mascota = entityManager.createQuery("select p from Mascota  p where p.id not IN ( select pc.mascota.id from Publicacion pc) AND p.usuario = :user order by p.id desc ", Mascota.class)
                .setParameter("user",usuario)
                .getResultList();

        return mascota;
    }
}
