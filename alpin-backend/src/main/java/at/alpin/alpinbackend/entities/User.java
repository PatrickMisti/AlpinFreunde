package at.alpin.alpinbackend.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "User")
@NamedQueries({
        @NamedQuery(name = "findAllUser",query = "select u from User u"),
        @NamedQuery(name = "findUserById", query = "select u from User u where u.id = :id"),
        @NamedQuery(name = "deleteUserById", query = "delete from User u where u.id = :id")
})
public class User extends BaseEntity{
    private String FirstName;
    private String LastName;
    private String UserName;
    private String Password;
    private String EMail;
    private boolean E_PushNotification;
    private boolean PushNotification;
    @ManyToMany(mappedBy = "Users")
    private Set<TripAppointment> TripAppointments;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Role.class)
    @JoinColumn(name = "Role_id")
    private Role role;

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

    public User(User user) {
        super(user.getId());
        FirstName = user.getFirstName();
        LastName = user.getLastName();
        UserName = user.getUserName();
        Password = user.getPassword();
        this.EMail = user.getEMail();
        E_PushNotification = user.isE_PushNotification();
        PushNotification = user.isPushNotification();
        TripAppointments = user.TripAppointments;
        this.role = user.role;
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
        this.TripAppointments = new HashSet<>();
    }

    public User(String firstName, String lastName, String userName, String password, String EMail, Role role) {
        FirstName = firstName;
        LastName = lastName;
        UserName = userName;
        Password = password;
        this.role = role;
        this.EMail = EMail;
        this.TripAppointments = new HashSet<>();
    }

    public User(String firstName, String lastName, String userName, String password, String EMail, boolean e_PushNotification, boolean pushNotification, Set<TripAppointment> tripAppointments, Role role) {
        FirstName = firstName;
        LastName = lastName;
        UserName = userName;
        Password = password;
        this.EMail = EMail;
        E_PushNotification = e_PushNotification;
        PushNotification = pushNotification;
        TripAppointments = tripAppointments;
        this.role = role;
    }

    public User(String firstName, String lastName, String userName, String password, Role role) {
        FirstName = firstName;
        LastName = lastName;
        UserName = userName;
        Password = password;
        this.role = role;
        this.TripAppointments = new HashSet<>();
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
        /*if(!TripAppointments.contains(tripAppointment)){
            TripAppointments.add(tripAppointment);
            tripAppointment.addUser(this);
        }*/
        TripAppointments.add(tripAppointment);
        tripAppointment.addUser(this);
    }

    public void removeTripAppointment(TripAppointment tripAppointment) {
        if (TripAppointments.contains(tripAppointment)) {
            TripAppointments.remove(tripAppointment);
            tripAppointment.removeUser(this);
        }
    }
}
