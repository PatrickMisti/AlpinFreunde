package at.alpin.alpinbackend.entities;


import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "Role")
public class Role extends BaseEntity{
    private String Permission;
    private Boolean IsAdmin;

    public Role(Timestamp timestamp, String permission, Boolean isAdmin) {
        super(timestamp);
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
}
