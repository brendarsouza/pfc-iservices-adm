/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Logs;
import Util.JPAUtil;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author brenda
 */
public class LogsDAO {

    public LogsDAO() {

    }

    Logs logs = new Logs();

    private static LogsDAO instance;
    EntityManager manager = new JPAUtil().getEntityManager();

    public static LogsDAO getInstance() {
        if (instance == null) {
            instance = new LogsDAO();
        }

        return instance;
    }

    public Logs consultarPorId(int id) {

        Logs logs = null;
        try {
            //Consulta um profissional pelo seu ID.
            logs = manager.find(Logs.class, id);
        } finally {
            manager.close();
        }
        return logs;
    }

    public Logs getById(final int id) {
        return manager.find(Logs.class, id);
    }

    @SuppressWarnings("unchecked")
    public List<Logs> buscarTodos() {
        return manager.createQuery("FROM " + Logs.class.getName()).getResultList();
    }

    public void cadastrar(Logs logs) {

        try {
            manager.getTransaction().begin();
            manager.persist(logs);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        }
    }

    public void atualizar(Logs logs) {

        try {
            manager.getTransaction().begin();
            manager.merge(logs);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        }
    }

    public void remover(Logs logs) {

        try {
            manager.getTransaction().begin();
            logs = manager.find(Logs.class, logs.getId());
            manager.remove(logs);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        }
    }

    public void removerPorId(final int id) {

        try {
            Logs logs = getById(id);
            remover(logs);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public List<Logs> consultarUsuarios(String emailUsuario) {
        //passar o parametro para a query
        Query query = manager
                .createQuery("select l from Logs l where l.usuario.email like :emailUsuario order by l.usuario.email asc");

        query.setParameter("emailUsuario", "%" + emailUsuario + "%");

        return query.getResultList();
    }

    public List<Logs> consultarLogs(int id) {
        Query query = manager
                .createQuery("select l from Logs l where l.usuario.id =:id order by l.data desc");

        query.setParameter("id", id);
        return query.getResultList();
    }

}
