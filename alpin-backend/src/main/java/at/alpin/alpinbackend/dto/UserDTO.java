package at.alpin.alpinbackend.dto;

import at.alpin.alpinbackend.entities.User;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import java.util.logging.Logger;

public class UserDTO {
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String eMail;
    private boolean e_PushNotification;
    private boolean pushNotification;

    public UserDTO(String firstName, String lastName, String userName, String password, String EMail, boolean e_PushNotification, boolean pushNotification) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
        this.eMail = EMail;
        this.e_PushNotification = e_PushNotification;
        this.pushNotification = pushNotification;
    }

    public static JsonObject makeUser(User user) {
        Logger logger = Logger.getLogger("testing it");
//        logger.warning("tessting" + user.getId().toString());

        return Json.createObjectBuilder()
//                .add("id",user.getId())
                .add("firstname",user.getFirstName())
                .add("lastname",user.getLastName())
                .add("username",user.getUserName())
                .build();
    }

}
