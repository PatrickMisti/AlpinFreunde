package at.alpin.alpinbackend.dto;


import at.alpin.alpinbackend.entities.TripSuggestion;
import at.alpin.alpinbackend.entities.User;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.bind.JsonbBuilder;
import java.util.logging.Logger;

public class TripSuggestionDTO {
    Logger logger = Logger.getLogger(TripSuggestionDTO.class.toString());

    private Long id;
    private String websiteLink;
    private String title;
    private String description;
    private boolean publicShown;
    private User user;

    public TripSuggestionDTO(TripSuggestion tripSuggestion) {
        this.id = tripSuggestion.getId();
        this.websiteLink = tripSuggestion.getWebsiteLink();
        this.title = tripSuggestion.getTitle();
        this.description = tripSuggestion.getDescription();
        this.publicShown = tripSuggestion.isPublicShown();
        user = new User(tripSuggestion.getUser());
    }

    public TripSuggestionDTO(Long id, String websiteLink, String title, String description, boolean publicShown, User user) {
        this.id = id;
        this.websiteLink = websiteLink;
        this.title = title;
        this.description = description;
        this.publicShown = publicShown;
        this.user = user;
    }

    public JsonObject toJson() {
        return buildTrip().add("user", new UserDTO(user).toJson()).build();
    }
    private JsonObjectBuilder buildTrip() {
        JsonObjectBuilder obj = Json.createObjectBuilder()
                .add("id", this.id)
                .add("description", this.description)
                .add("title", this.title)
                .add("publicShown", this.publicShown)
                .add("websiteLink",this.websiteLink);
        return obj;
    }
}
