package at.alpin.alpinbackend.controllers;

import at.alpin.alpinbackend.entities.TripAppointment;
import at.alpin.alpinbackend.entities.TripSuggestion;
import at.alpin.alpinbackend.repository.TripAppointmentRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.logging.Logger;

@Path("v1/trip-appointment")
public class TripAppointmentController {

    @Inject
    TripAppointmentRepository service;

    Logger logger = Logger.getLogger(this.toString());

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllTripAppointment() {
        return Response.ok().entity(service.findAllFromTripAppointment()).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createTripAppointment(TripAppointment tripAppointment) {
        logger.info("Save TripAppointment " + tripAppointment.getTitle());
        return Response.ok().status(service.saveTripAppointment(tripAppointment)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateTripAppointment(TripAppointment tripAppointment) {
        logger.info("Update TripAppointment " + tripAppointment.getTitle());
        return Response.ok().status(service.updateTripAppointment(tripAppointment)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    public Response deleteTripAppointment(TripAppointment tripAppointment) {
        logger.info("Delete TripAppointment " + tripAppointment.getTitle());
        return Response.ok().status(service.deleteTripAppointment(tripAppointment)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public Response deleteTripAppointment(@PathParam("id") Long id) {
        logger.info("Delete TripAppointment " + id);
        return Response.ok().status(service.deleteTripAppointment(id)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }
}
