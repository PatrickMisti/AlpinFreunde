package at.alpin.alpinbackend.controllers;

import at.alpin.alpinbackend.entities.TripSuggestion;
import at.alpin.alpinbackend.repository.TripSuggestionRepository;

import javax.inject.Inject;
import javax.json.JsonArray;
import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Path("v1/trip-suggestion")
public class TripSuggestionController {

    @Inject
    TripSuggestionRepository service;

    Logger logger = Logger.getLogger(this.toString());

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllTripSuggestion() {
//        Jsonb jsonb = JsonbBuilder.create();
//        logger.warning("beforeto json");
        //jsonb.toJson(service.findAllFromTripSuggestion());
        /*logger.warning("befor builder");
        StringBuilder builder = new StringBuilder();
        logger.warning("befor foreach");
        service.findAllFromTripSuggestion().forEach(item -> {
            builder.append(item);
            logger.warning("item "+item.toString());
        });
        logger.warning(builder.toString());*/
        logger.warning("befor builder");
        JsonArray array = service.findAllFromTripSuggestion();
        return Response.ok().entity(array).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createTripSuggestion(TripSuggestion tripSuggestion) {
        logger.info("Save TripSuggestion  " + tripSuggestion.getTitle());
        return Response.ok().status(service.saveTripSuggestion(tripSuggestion)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateTripSuggestion(TripSuggestion tripSuggestion) {
        logger.info("Update TripSuggestion " + tripSuggestion.getTitle());
        return Response.ok().status(service.updateTripSuggestion(tripSuggestion)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    public Response deleteTripSuggestion(TripSuggestion tripSuggestion) {
        logger.info("Delete TripSuggestion " + tripSuggestion.getTitle());
        return Response.ok().status(service.deleteTripSuggestion(tripSuggestion)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public Response deleteTripSuggestion(@PathParam("id") Long id) {
        logger.info("Delete TripSuggestion " + id);
        return Response.ok().status(service.deleteTripSuggestion(id)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }
}
