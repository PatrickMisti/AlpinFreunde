package at.alpin.alpinbackend.dto;

import at.alpin.alpinbackend.entities.Utility;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import java.util.logging.Logger;

public class UtilityDTO {
    private Logger logger = Logger.getLogger(UtilityDTO.class.toString());
    private Long id;
    private String Name;
    private boolean IsNeeded;

    public UtilityDTO(Utility utility) {
        this.id = utility.getId();
        Name = utility.getName();
        IsNeeded = utility.isNeeded();
    }

    public JsonObject toJson() {
        try {
            return Json.createObjectBuilder()
                    .add("id", this.id)
                    .add("name", this.Name)
                    .add("isNeeded", this.IsNeeded)
                    .build();
        } catch (RuntimeException e) {
            logger.severe("Json building error: " + e);
            return Json.createObjectBuilder().build();
        }
    }
}
