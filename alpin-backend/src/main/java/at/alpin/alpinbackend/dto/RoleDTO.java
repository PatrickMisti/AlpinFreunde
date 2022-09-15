package at.alpin.alpinbackend.dto;

import at.alpin.alpinbackend.entities.Role;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.util.logging.Logger;

public class RoleDTO {
    private Logger logger = Logger.getLogger(this.toString());

    private Long id;
    private String Name;
    private String Permission;

    private Boolean IsAdmin;

    public RoleDTO(Role role) {
        id = role.getId();
        Name = role.getName();
        Permission = role.getPermission();
        IsAdmin = role.getAdmin();
    }

    public JsonObjectBuilder toJson() {
        try {
            return Json.createObjectBuilder()
                    .add("id", this.id)
                    .add("name", this.Name)
                    .add("permission", this.Permission)
                    .add("isAdmin", this.IsAdmin);
        } catch (RuntimeException e) {
            logger.severe("Json building error: " + e);
            return Json.createObjectBuilder();
        }
    }
}
