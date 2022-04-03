package at.alpin.alpinbackend.repository;

import at.alpin.alpinbackend.entities.Role;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class RoleRepository {
    @PersistenceContext
    EntityManager manager;

    Logger logger = Logger.getLogger(Role.class.toString());

    public List<Role> findAllRole() {
        return manager.createNamedQuery("findAllRole", Role.class).getResultList();
    }

    public boolean saveRole(Role role) {
        try {
            role.setTimestamp(new Timestamp(System.currentTimeMillis()));
            logger.info("Add Role to DB");
            manager.persist(role);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Saving: " + e);
            return false;
        }
    }

    public boolean deleteRole(Role role) {
        try {
            logger.info("Removing Role: " + role);
            manager.remove(role);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Role: " + e);
            return false;
        }
    }

    public boolean deleteRole(Long id) {
        try {
            logger.info("Removing Role: " + id);
            manager.createNamedQuery("deleteRoleById", Role.class).setParameter("id", id);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Role: " + e);
            return false;
        }
    }

    public boolean updateRolePermission(Role role) {
        try {
            logger.info("Update Role " + role.getName() + " value = " + role.getPermission());
            manager.createNamedQuery("updateRolePermissionById", Role.class)
                    .setParameter("id", role.getId())
                    .setParameter("permission", role.getPermission());
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error Update Role " + e);
            return false;
        }
    }
}
