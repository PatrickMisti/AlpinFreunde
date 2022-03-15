package at.alpin.alpinbackend.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name = "User")
public class User extends BaseEntity{
    private String FirstName;
    private String LastName;
    private String UserName;
    private String Password;
    private String EMail;
    private boolean E_PushNotification;
    private boolean PushNotification;
    @ManyToMany
    @JoinTable(name = "Trip",
            joinColumns = @JoinColumn(name = "User_Id"),
            inverseJoinColumns = @JoinColumn(name = "TripAppointment_Id"))
    private Set<TripAppointment> TripAppointments;

    public User(Timestamp timestamp, String firstName, String lastName, String userName, String password, String EMail, boolean e_PushNotification, boolean pushNotification, Set<TripAppointment> tripAppointment) {
        super(timestamp);
        FirstName = firstName;
        LastName = lastName;
        UserName = userName;
        Password = password;
        this.EMail = EMail;
        E_PushNotification = e_PushNotification;
        PushNotification = pushNotification;
        TripAppointments = tripAppointment;
    }

    public User(Timestamp timestamp, String firstName, String lastName, String userName, String password, String EMail, boolean e_PushNotification, boolean pushNotification) {
        super(timestamp);
        FirstName = firstName;
        LastName = lastName;
        UserName = userName;
        Password = password;
        this.EMail = EMail;
        E_PushNotification = e_PushNotification;
        PushNotification = pushNotification;
    }

    public User() {
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) {
        FirstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getEMail() {
        return EMail;
    }

    public void setEMail(String EMail) {
        this.EMail = EMail;
    }

    public boolean isE_PushNotification() {
        return E_PushNotification;
    }

    public void setE_PushNotification(boolean e_PushNotification) {
        E_PushNotification = e_PushNotification;
    }

    public boolean isPushNotification() {
        return PushNotification;
    }

    public void setPushNotification(boolean pushNotification) {
        PushNotification = pushNotification;
    }

    public Set<TripAppointment> getTripAppointment() {
        return TripAppointments;
    }

    public void setTripAppointment(Set<TripAppointment> tripAppointment) {
        TripAppointments = tripAppointment;
    }

    public void addTripAppointment(TripAppointment tripAppointment){
        if(!TripAppointments.contains(tripAppointment)){
            TripAppointments.add(tripAppointment);
            tripAppointment.addUser(this);
        }
    }

    public void removeTripAppointment(TripAppointment tripAppointment) {
        if (TripAppointments.contains(tripAppointment)) {
            TripAppointments.remove(tripAppointment);
            tripAppointment.removeUser(this);
        }
    }
}
