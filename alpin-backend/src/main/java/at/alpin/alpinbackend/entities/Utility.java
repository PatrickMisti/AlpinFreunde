package at.alpin.alpinbackend.entities;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "Utility")
@NamedQueries({
        @NamedQuery(name = "findAllUtilities",query = "select u from Utility u")
})
public class Utility extends BaseEntity implements Serializable {
    private String Name;
    private boolean IsNeeded;

    public Utility(Timestamp timestamp, String name, boolean isNeeded) {
        super(timestamp);
        Name = name;
        IsNeeded = isNeeded;
    }

    public Utility(String name, boolean isNeeded) {
        Name = name;
        IsNeeded = isNeeded;
    }

    public Utility() {
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public boolean isNeeded() {
        return IsNeeded;
    }

    public void setNeeded(boolean needed) {
        IsNeeded = needed;
    }
}