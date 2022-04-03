package at.alpin.alpinbackend.dto;


import at.alpin.alpinbackend.entities.TripSuggestion;
import at.alpin.alpinbackend.entities.User;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.bind.JsonbBuilder;
import java.util.logging.Logger;

public class TripSuggestionDTO {
    TripSuggestion trip;
    private User user;

    public TripSuggestionDTO(TripSuggestion tripSuggestion) {
        trip = new TripSuggestion(tripSuggestion);
        user = new User(tripSuggestion.getUser());
    }

    public JsonObject toJson() {
        return buildTrip().add("user", UserDTO.makeUser(user)).build();
    }
// todo
    private JsonObjectBuilder buildTrip() {
        Logger logger = Logger.getLogger(this.getClass().toString());
        logger.info("before buildTrip");
        JsonObjectBuilder obj = Json.createObjectBuilder()
//                .add("id", trip.getId().toString())
                .add("description", trip.getDescription())
                .add("title", trip.getTitle());
        logger.warning("buildTRip");
        return obj;
    }

}
