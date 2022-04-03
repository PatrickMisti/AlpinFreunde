package at.alpin.alpinbackend.repository;

import at.alpin.alpinbackend.entities.Utility;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class UtilityListRepository {
    @PersistenceContext
    EntityManager manager;

    Logger logger = Logger.getLogger(this.toString());

    public List<Utility> findAllUtilities() {
        return manager.createNamedQuery("findAllUtilities", Utility.class).getResultList();
    }

    public boolean saveUtilityItem(Utility item) {
        try {
            item.setTimestamp(new Timestamp(System.currentTimeMillis()));
            logger.info("Add Item to DB " + item.getName());
            manager.persist(item);
            return true;
        }catch (RuntimeException e) {

            logger.severe("Error in UtilityRepo: " + e);
            return false;
        }
    }

    public boolean deleteItemInUtilityList(Utility item) {
        try {
            logger.info("Removed Item from DB");
            manager.remove(item);
            return true;
        }catch (RuntimeException e) {
            logger.severe("Error: " + e);
            return false;
        }
    }

    public boolean deleteItemInUtilityList(Long id) {
        try {
            manager.remove(manager.createQuery("Select m from Utility m where m.id = :id", Utility.class).setParameter("id",id));
            logger.info("Removed Item from DB");
            return true;
        }catch (RuntimeException e) {
            logger.severe("Error Utility: " + e);
            return false;
        }
    }
}
