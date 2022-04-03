package at.alpin.alpinbackend.entities;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "TripSuggestion")// left join User u on t.User_id = u.id
@NamedQueries({
        @NamedQuery(name = "findAllTripSuggestion", query = "select t from TripSuggestion t"),
        @NamedQuery(name = "findTripSuggestionById", query = "select t from TripSuggestion t where t.id = :id"),
        @NamedQuery(name = "deleteTripSuggestionById", query = "delete from TripSuggestion t where t.id = :id")
})
public class TripSuggestion extends BaseEntity{
    private String WebsiteLink;
    private String Title;
    private String Description;
    private boolean PublicShown;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "User_id")
    private User User;

    public TripSuggestion(Timestamp timestamp, String websiteLink, String title, String description, boolean publicShown, User user) {
        super(timestamp);
        WebsiteLink = websiteLink;
        Title = title;
        Description = description;
        PublicShown = publicShown;
        User = user;
    }

    public TripSuggestion(String websiteLink, String title, String description, boolean publicShown, User user) {
        WebsiteLink = websiteLink;
        Title = title;
        Description = description;
        PublicShown = publicShown;
        User = user;
    }

    public TripSuggestion(Timestamp timestamp, String title, User user) {
        super(timestamp);
        Title = title;
        User = user;
    }

    public TripSuggestion(){}

    public TripSuggestion(TripSuggestion trip) {
        WebsiteLink = trip.getWebsiteLink();
        Title = trip.getTitle();
        Description = trip.getDescription();
        PublicShown = trip.isPublicShown();
    }

    public String getWebsiteLink() {
        return WebsiteLink;
    }

    public void setWebsiteLink(String websiteLink) {
        WebsiteLink = websiteLink;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public boolean isPublicShown() {
        return PublicShown;
    }

    public void setPublicShown(boolean publicShown) {
        PublicShown = publicShown;
    }

    public at.alpin.alpinbackend.entities.User getUser() {
        return User;
    }

    public void setUser(at.alpin.alpinbackend.entities.User user) {
        User = user;
    }

    @Override
    public String toString() {
        JsonObject builder = Json.createObjectBuilder()
                .add("id", this.getId())
                .add("description", this.getDescription())
                .add("publicShown", this.isPublicShown())
                .add("title", this.getTitle())
                .add("websiteLink", this.getWebsiteLink())
                .add("user_id", this.getUser().getId()).build();
        return builder.toString();
    }
}
