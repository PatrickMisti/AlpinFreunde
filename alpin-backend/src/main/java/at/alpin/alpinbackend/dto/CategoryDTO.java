package at.alpin.alpinbackend.dto;

import at.alpin.alpinbackend.entities.Category;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import java.util.logging.Logger;

public class CategoryDTO {

    private Logger logger = Logger.getLogger(this.toString());
    private Long id;
    private String Name;

    public CategoryDTO(Category category) {
        this.id = category.getId();
        this.Name = category.getName();
    }

    public JsonObjectBuilder toJson() {
        try {
            return Json.createObjectBuilder()
                    .add("id", this.id)
                    .add("name", this.Name);
        } catch (RuntimeException e) {
            logger.severe("Json building error: " + e);
            return Json.createObjectBuilder();
        }
    }
}
