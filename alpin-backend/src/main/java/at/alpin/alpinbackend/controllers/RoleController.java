package at.alpin.alpinbackend.controllers;

import at.alpin.alpinbackend.entities.Role;
import at.alpin.alpinbackend.repository.RoleRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.logging.Logger;

@Path("v1/role")
public class RoleController {

    @Inject
    RoleRepository service;

    Logger logger = Logger.getLogger(this.toString());

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllRoles() {
        return Response.ok().entity(service.findAllRole()).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createRole(Role role) {
        logger.info("Save Role " + role.getName());
        return Response.ok().status(service.saveRole(role) ? Response.Status.OK : Response.Status.NOT_FOUND).build();
    }

    @DELETE
    @Consumes(MediaType.APPLICATION_JSON)
    public Response deleteRole(Role role) {
        logger.info("Delete Role " + role.getName());
        return Response.ok().status(service.deleteRole(role) ? Response.Status.OK : Response.Status.NOT_FOUND).build();
    }
}
