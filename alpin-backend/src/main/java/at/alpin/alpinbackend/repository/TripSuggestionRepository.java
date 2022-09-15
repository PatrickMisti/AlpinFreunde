package at.alpin.alpinbackend.repository;

import at.alpin.alpinbackend.dto.TripSuggestionDTO;
import at.alpin.alpinbackend.entities.TripSuggestion;

import javax.ejb.Stateless;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.core.Response;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Stateless
public class TripSuggestionRepository {
    @PersistenceContext
    EntityManager manager;

    Logger logger = Logger.getLogger(TripSuggestion.class.toString());

    public JsonArray findAllFromTripSuggestion() {
        List<JsonObject> obj = manager.createNamedQuery("findAllTripSuggestion", TripSuggestion.class)
                .getResultList()
                .stream()
                .map(item -> {
                    TripSuggestionDTO s = new TripSuggestionDTO(item);
                    return s.toJson();
                }).collect(Collectors.toList());
        JsonArrayBuilder result = Json.createArrayBuilder();
        obj.forEach(item -> result.add(item));

        return result.build();
    }

    public boolean saveTripSuggestion(TripSuggestion trip) {
        try {
            trip.setTimestamp(new Timestamp(System.currentTimeMillis()));
            manager.persist(trip);
            logger.info("Add tripSuggestion to DB");
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Adding " + e);
            return false;
        }
    }

    public boolean updateTripSuggestion(TripSuggestion trip) {
        try {
            manager.merge(trip);
            logger.info("Update tripSuggestion to DB");
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Updating " + e);
            return false;
        }
    }

    public boolean deleteTripSuggestion(TripSuggestion tripSuggestion) {
        try {
            manager.remove(tripSuggestion);
            logger.info("Removed TripSuggestion " + tripSuggestion);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Removing " + e);
            return false;
        }
    }

    public boolean deleteTripSuggestion(Long id) {
        try {
            manager.createNamedQuery("deleteTripSuggestionById",TripSuggestion.class).setParameter("id", id);
            logger.info("Removed TripSuggestion by id " + id);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Removing " + e);
            return false;
        }
    }
}
