/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Administrador;
import Model.Usuario;
import Util.JPAUtil;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author brenda
 */
public class AdministradorDAO {
      public AdministradorDAO() {
    }

    private static AdministradorDAO instance;
    EntityManager manager = new JPAUtil().getEntityManager();

    public static AdministradorDAO getInstance() {
        if (instance == null) {
            instance = new AdministradorDAO();
        }

        return instance;
    }

    public Administrador getById(final int id) {
        return manager.find(Administrador.class, id);
    }
    public Administrador consultarPorId(int id) {

        Administrador administrador = null;
        try {
            //Consulta um endereco pelo seu ID.
            administrador = manager.find(Administrador.class, id);
        } finally {
            manager.close();
        }
        return administrador;
    }
    
    public Administrador consultarUsuarioId(Usuario u){
        Query query = manager
                .createQuery("select a from Administrador a where a.usuario =:pId");

        query.setParameter("pId", u);

        Administrador a = (Administrador) query.getSingleResult();
        return a;
    }
    
    @SuppressWarnings("unchecked")
    public List<Administrador> buscarTodos() {
        return manager.createQuery("FROM " + Administrador.class.getName()).getResultList();
    }
    
    
    public void cadastrar(Administrador administrador) {

        try {
            manager.getTransaction().begin();
            manager.persist(administrador);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        }
    }

    public void atualizar(Administrador administrador) {

        try {
            manager.getTransaction().begin();
            manager.merge(administrador);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        }
    }

    public void remover(Administrador administrador) {

        try {
            manager.getTransaction().begin();
            administrador = manager.find(Administrador.class, administrador.getId());
            manager.remove(administrador);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        }
    }

    public void removerPorId(final int id) {

        try {
            Administrador administrador = getById(id);
            remover(administrador);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
     public List<Administrador> verificarUnique(String email, String cpf, String rg) throws Exception {
        //passar o parametro para a query
        Query query = manager
                .createQuery("select a from Administrador a where a.usuario.email =:email or a.cpf =:cpf or a.rg =:rg ");

        //retorno da lista de profissionais
        query.setParameter("email", email);
        query.setParameter("cpf", cpf);
        query.setParameter("rg", rg);
        
        return query.getResultList();

    }
}
