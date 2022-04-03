package at.alpin.alpinbackend.controllers;

import at.alpin.alpinbackend.entities.Utility;
import at.alpin.alpinbackend.repository.UtilityListRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.logging.Logger;

@Path("v1/utility-list")
public class UtilityListController {

    @Inject
    UtilityListRepository service;

    Logger logger = Logger.getLogger(this.toString());

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllUtilities() {
        return Response.ok().entity(service.findAllUtilities()).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response saveUtility(Utility utility) {
        logger.info("Save Utility " + utility.getName());
        return Response.ok()
                .status(service.saveUtilityItem(utility)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @DELETE
    public Response deleteUtility(Utility utility) {
        logger.info("Delete Utility " + utility.getName());
        return Response.ok()
                .status(service.deleteItemInUtilityList(utility)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteUtility(@PathParam("id") Long id) {
        logger.info("Delete Utility By Id " + id);
        return Response.ok()
                .status(service.deleteItemInUtilityList(id)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }
}
