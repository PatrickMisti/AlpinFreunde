package at.alpin.alpinbackend.repository;

import at.alpin.alpinbackend.entities.Category;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class CategoryRepository {
    @PersistenceContext
    EntityManager manager;

    Logger logger = Logger.getLogger(Category.class.toString());

    public List<Category> findAllCategory() {
        return manager.createNamedQuery("findAllCategory", Category.class).getResultList();
    }

    public boolean saveCategory(Category category) {
        try {
            category.setTimestamp(new Timestamp(System.currentTimeMillis()));
            logger.info("Add Category to DB");
            manager.persist(category);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Save Category " + e);
            return false;
        }
    }

    public boolean deleteCategory(Category category) {
        try {
            logger.info("Removing Category " + category);
            manager.remove(category);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Removing Category " + e);
            return false;
        }
    }

    public boolean deleteCategory(Long id) {
        try {
            logger.info("Removing Category " + id);
            manager.createNamedQuery("deleteCategoryById").setParameter("id", id);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Removing Category " + e);
            return false;
        }
    }
}
