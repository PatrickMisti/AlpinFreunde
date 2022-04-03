package at.alpin.alpinbackend.entities;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import java.sql.Timestamp;

@Entity
@Table(name = "Role")
@NamedQueries({
        @NamedQuery(name = "findAllRole", query = "select r from Role r"),
        @NamedQuery(name = "findRoleById", query = "select r from Role r where r.id = :id"),
        @NamedQuery(name = "deleteRoleById", query = "delete from Role r where r.id = :id and r.IsAdmin = false"),
        @NamedQuery(name = "updateRolePermissionById",query = "update Role r set r.Permission = :permission where r.id = :id")

})
public class Role extends BaseEntity{
    private String Name;
    private String Permission;

    private Boolean IsAdmin;

    public Role(Timestamp timestamp, String name, String permission, Boolean isAdmin) {
        super(timestamp);
        Permission = permission;
        Name = name;
        IsAdmin = isAdmin;
    }

    public Role(String name, String permission, Boolean isAdmin) {
        Name = name;
        Permission = permission;
        IsAdmin = isAdmin;
    }

    public Role() {
        super();
    }

    public String getPermission() {
        return Permission;
    }

    public void setPermission(String permission) {
        Permission = permission;
    }

    public Boolean getAdmin() {
        return IsAdmin;
    }

    public void setAdmin(Boolean admin) {
        IsAdmin = admin;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
}
