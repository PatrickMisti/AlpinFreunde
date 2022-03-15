package at.alpin.alpinbackend.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "TripAppointment")
public class TripAppointment extends BaseEntity{
    private String Title;
    @ManyToOne
    private Category Category;
    private Date Date;
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
    @ManyToMany
    @JoinTable(name = "Trip",
            joinColumns = @JoinColumn(name = "TripAppointment_Id"),
            inverseJoinColumns = @JoinColumn(name = "User_Id"))
    private Set<User> Users;

    @OneToMany(cascade = CascadeType.ALL,orphanRemoval = true)
    private Set<UtilityList> Utility;

    public TripAppointment(Timestamp timestamp, String title, Category category, Date date, String location) {
        super(timestamp);
        Title = title;
        Category = category;
        Date = date;
        Location = location;
    }

    public TripAppointment(Timestamp timestamp, String title, at.alpin.alpinbackend.entities.Category category, java.util.Date date, String location, int phone, String source, String junk, double heightDifference, String GPS, String description, double distance, String warningDescription, double accessiblePlace, boolean isAccessiblePlace, boolean isTicketNeeded, Set<User> users, Set<UtilityList> utility) {
        super(timestamp);
        Title = title;
        Category = category;
        Date = date;
        Location = location;
        Phone = phone;
        Source = source;
        Junk = junk;
        HeightDifference = heightDifference;
        this.GPS = GPS;
        Description = description;
        Distance = distance;
        WarningDescription = warningDescription;
        AccessiblePlace = accessiblePlace;
        IsAccessiblePlace = isAccessiblePlace;
        IsTicketNeeded = isTicketNeeded;
        Users = users;
        Utility = utility;
    }

    public TripAppointment() {
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public at.alpin.alpinbackend.entities.Category getCategory() {
        return Category;
    }

    public void setCategory(at.alpin.alpinbackend.entities.Category category) {
        Category = category;
    }

    public java.util.Date getDate() {
        return Date;
    }

    public void setDate(java.util.Date date) {
        Date = date;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        Location = location;
    }

    public int getPhone() {
        return Phone;
    }

    public void setPhone(int phone) {
        Phone = phone;
    }

    public String getSource() {
        return Source;
    }

    public void setSource(String source) {
        Source = source;
    }

    public String getJunk() {
        return Junk;
    }

    public void setJunk(String junk) {
        Junk = junk;
    }

    public double getHeightDifference() {
        return HeightDifference;
    }

    public void setHeightDifference(double heightDifference) {
        HeightDifference = heightDifference;
    }

    public String getGPS() {
        return GPS;
    }

    public void setGPS(String GPS) {
        this.GPS = GPS;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public double getDistance() {
        return Distance;
    }

    public void setDistance(double distance) {
        Distance = distance;
    }

    public String getWarningDescription() {
        return WarningDescription;
    }

    public void setWarningDescription(String warningDescription) {
        WarningDescription = warningDescription;
    }

    public double getAccessiblePlace() {
        return AccessiblePlace;
    }

    public void setAccessiblePlace(double accessiblePlace) {
        AccessiblePlace = accessiblePlace;
    }

    public boolean isAccessiblePlace() {
        return IsAccessiblePlace;
    }

    public void setAccessiblePlace(boolean accessiblePlace) {
        IsAccessiblePlace = accessiblePlace;
    }

    public boolean isTicketNeeded() {
        return IsTicketNeeded;
    }

    public void setTicketNeeded(boolean ticketNeeded) {
        IsTicketNeeded = ticketNeeded;
    }

    public Set<User> getUsers() {
        return Users;
    }

    public void setUsers(Set<User> users) {
        Users = users;
    }

    public Set<UtilityList> getUtility() {
        return Utility;
    }

    public void setUtility(Set<UtilityList> utility) {
        Utility = utility;
    }

    public void addUser(User user) {
        if(!Users.contains(user)){
            Users.add(user);
            user.addTripAppointment(this);
        }
    }

    public void removeUser(User user) {
        if (Users.contains(user)) {
            Users.remove(user);
            user.removeTripAppointment(this);
        }
    }

    public void addUtility(UtilityList item) {
        Utility.add(item);
    }
}
