package at.alpin.alpinbackend.entities;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import java.sql.Timestamp;

@Entity
@Table(name = "Category")
@NamedQueries({
        @NamedQuery(name = "findAllCategory", query = "select c from Category c"),
        @NamedQuery(name = "deleteCategoryById", query = "delete from Category c where c.id = :id")
})
public class Category extends BaseEntity {
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
