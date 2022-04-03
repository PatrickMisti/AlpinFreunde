package at.alpin.alpinbackend.controllers;

import at.alpin.alpinbackend.entities.User;
import at.alpin.alpinbackend.repository.UserRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.logging.Logger;

@Path("v1/user")
public class UserController {

    @Inject
    UserRepository service;

    Logger logger = Logger.getLogger(this.toString());

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllUser() {
        return Response.ok().entity(service.findAllUser()).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createUser(User user) {
        logger.info("Save User " + user.getUserName());
        return Response.ok().status(service.saveUser(user) ? Response.Status.OK : Response.Status.NOT_FOUND).build();
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateUser(User user) {
        logger.info("Update User " + user.getUserName());
        return Response.ok().status(service.updateUser(user) ? Response.Status.OK : Response.Status.NOT_FOUND).build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    public Response deleteUser(User user) {
        logger.info("Delete User " + user.getUserName());
        return Response.ok().status(service.deleteUser(user) ? Response.Status.OK : Response.Status.NOT_FOUND).build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/{id}")
    public Response deleteUser(@PathParam("id") Long id) {
        logger.info("Delete User " + id);
        return Response.ok().status(service.deleteUser(id) ? Response.Status.OK : Response.Status.NOT_FOUND).build();
    }
}
