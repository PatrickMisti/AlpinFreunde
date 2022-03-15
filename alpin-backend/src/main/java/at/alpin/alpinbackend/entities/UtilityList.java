package at.alpin.alpinbackend.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.sql.Timestamp;

@Entity
@Table(name = "UtilityList")
public class UtilityList extends BaseEntity{
    private String Name;
    private boolean IsNeeded;

    public UtilityList(Timestamp timestamp, String name, boolean isNeeded) {
        super(timestamp);
        Name = name;
        IsNeeded = isNeeded;
    }

    public UtilityList() {
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