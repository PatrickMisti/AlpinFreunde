package at.alpin.alpinbackend.dto;

import at.alpin.alpinbackend.entities.User;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import java.util.logging.Logger;

public class UserDTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String eMail;
    private boolean e_PushNotification;
    private boolean pushNotification;

    public UserDTO(User user){
        this(user.getId(),
                user.getFirstName(),
                user.getLastName(),
                user.getUserName(),
                user.getPassword(),
                user.getEMail(),
                user.isE_PushNotification(),
                user.isPushNotification());
    }

    public UserDTO(Long id,String firstName, String lastName, String userName, String password, String EMail, boolean e_PushNotification, boolean pushNotification) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
        this.eMail = EMail;
        this.e_PushNotification = e_PushNotification;
        this.pushNotification = pushNotification;
    }



    public JsonObject toJson() {
        return Json.createObjectBuilder()
                .add("id", this.id)
                .add("firstname",this.firstName)
                .add("lastname",this.lastName)
                .add("username",this.userName)
                .build();
    }

}
