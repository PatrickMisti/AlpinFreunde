package at.alpin.alpinbackend.entities;

import jakarta.persistence.Entity;

import java.sql.Timestamp;

@Entity
public class Category extends BaseEntity{
    private String Name;

    public Category(Timestamp timestamp, String name) {
        super(timestamp);
        Name = name;
    }

    public Category(String name) {
        Name = name;
    }
    public Category() {

    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
}
