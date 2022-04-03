package at.alpin.alpinbackend.controllers;

import at.alpin.alpinbackend.entities.Category;
import at.alpin.alpinbackend.repository.CategoryRepository;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;
import java.util.logging.Logger;

@Path("v1/category")
public class CategoryController {

    @Inject
    CategoryRepository service;

    Logger logger = Logger.getLogger(this.toString());

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllCategories() {
        return Response.ok().entity(service.findAllCategory()).build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createCategory(Category category) {
        logger.info("Save Category " + category.getName());
        return Response.ok().status(service.saveCategory(category)
                        ? Response.Status.OK
                        : Response.Status.NOT_FOUND)
                .build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteCategoryById(@PathParam("id") Long id) {
        logger.info("Delete Category " + id);
        return Response.ok().status(service.deleteCategory(id) ? Response.Status.OK : Response.Status.NOT_FOUND).build();
    }
}
