package at.alpin.alpinbackend.repository;

import at.alpin.alpinbackend.entities.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class UserRepository {
    @PersistenceContext
    EntityManager manager;

    Logger logger = Logger.getLogger(User.class.toString());

    public List<User> findAllUser() {
        return manager.createNamedQuery("findAllUser",User.class).getResultList();
    }

    public boolean saveUser(User user) {
        try {
            user.setTimestamp(new Timestamp(System.currentTimeMillis()));
            manager.persist(user);
            logger.info("Add User to db");
            return true;
        } catch (RuntimeException exception) {
            logger.severe("Error User: "+ exception);
            return false;
        }
    }

    public boolean updateUser(User user) {
        try {
            manager.merge(user);
            logger.info("Update User to db");
            return true;
        } catch (RuntimeException exception) {
            logger.severe("Error User: "+ exception);
            return false;
        }
    }

    public boolean deleteUser(User user) {
        try {
            manager.remove(user);
            logger.info("Removed User " + user);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Deleting User " + user);
            return false;
        }
    }

    public boolean deleteUser(Long id){
        try {
            manager.createNamedQuery("deleteUserById", User.class).setParameter("id", id);
            logger.info("Removed User by id " + id);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Deleting User " + e);
            return false;
        }
    }
}
