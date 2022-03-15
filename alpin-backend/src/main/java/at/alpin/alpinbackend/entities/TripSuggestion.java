package at.alpin.alpinbackend.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import java.sql.Timestamp;

@Entity
@Table(name = "TripSuggestion")
public class TripSuggestion extends BaseEntity{
    private String WebsiteLink;
    private String Title;
    private String Description;
    private boolean PublicShown;

    @ManyToOne(fetch = FetchType.LAZY)
    private User User;

    public TripSuggestion(Timestamp timestamp, String websiteLink, String title, String description, boolean publicShown, User user) {
        super(timestamp);
        WebsiteLink = websiteLink;
        Title = title;
        Description = description;
        PublicShown = publicShown;
        User = user;
    }

    public TripSuggestion(Timestamp timestamp,String title,User user) {
        super(timestamp);
        Title = title;
        User = user;
    }

    public TripSuggestion() {
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
}
