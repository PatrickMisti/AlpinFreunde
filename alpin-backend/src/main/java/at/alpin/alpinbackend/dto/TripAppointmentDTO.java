package at.alpin.alpinbackend.dto;

import at.alpin.alpinbackend.entities.Category;
import at.alpin.alpinbackend.entities.TripAppointment;
import at.alpin.alpinbackend.entities.User;
import at.alpin.alpinbackend.entities.Utility;

import javax.json.*;
import java.util.Set;
import java.util.logging.Logger;

public class TripAppointmentDTO {
    private Logger logger = Logger.getLogger(TripAppointmentDTO.class.toString());

    private Long id;
    private String Title;
    private Category Category;
    private java.util.Date Date;
    private String Location;
    private int Phone;
    private String Source;
    private String Junk;
    private double HeightDifference;
    private String GPS;
    private String Description;
    private double Distance;
    private String WarningDescription;
    private double AccessiblePlace;
    private boolean IsAccessiblePlace;
    private boolean IsTicketNeeded;
    private Set<User> Users;
    private Set<Utility> Utility;

    public TripAppointmentDTO(TripAppointment appointment) {
        this.id = appointment.getId();
        Title = appointment.getTitle();
        Category = appointment.getCategory();
        Date = appointment.getDate();
        Location = appointment.getLocation();
        Phone = appointment.getPhone();
        Source = appointment.getSource();
        Junk = appointment.getJunk();
        HeightDifference = appointment.getHeightDifference();
        this.GPS = appointment.getGPS();
        Description = appointment.getDescription();
        Distance = appointment.getDistance();
        WarningDescription = appointment.getWarningDescription();
        AccessiblePlace = appointment.getAccessiblePlace();
        IsAccessiblePlace = appointment.isAccessiblePlace();
        IsTicketNeeded = appointment.isTicketNeeded();
        Users = appointment.getUsers();
        Utility = appointment.getUtility();
    }

    private JsonObjectBuilder buildAppointment() {
        try {
            JsonArrayBuilder user = Json.createArrayBuilder();
            JsonArrayBuilder utility = Json.createArrayBuilder();
            this.Users.forEach(item -> user.add(new UserDTO(item).toJson()));
            this.Utility.forEach(item -> utility.add(new UtilityDTO(item).toJson()));

            return Json.createObjectBuilder()
                    .add("id", this.id)
                    .add("title", this.Title)
                    .add("category", (JsonValue) this.Category)//todo
                    .add("date", (JsonValue) this.Date)//todo
                    .add("location", this.Location)
                    .add("phone", this.Phone)
                    .add("source", this.Source)
                    .add("junk", this.Junk)
                    .add("heightDifference", this.HeightDifference)
                    .add("gps", this.GPS)
                    .add("description", this.Description)
                    .add("distance", this.Distance)
                    .add("warningDescription", this.WarningDescription)
                    .add("accessiblePlace", this.AccessiblePlace)
                    .add("isAccessiblePlace", this.IsAccessiblePlace)
                    .add("isTicketNeeded", this.IsTicketNeeded)
                    .add("users", user.build())
                    .add("utilities", utility);
        } catch (RuntimeException e) {
            logger.severe("Json building error: " + e);
            return Json.createObjectBuilder();
        }
    }
}
