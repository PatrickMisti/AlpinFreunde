package at.alpin.alpinbackend;

import at.alpin.alpinbackend.entities.*;
import at.alpin.alpinbackend.repository.*;

import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.inject.Inject;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.logging.Logger;

@Startup
@Singleton
public class InitBean {

    Logger logger = Logger.getLogger(InitBean.class.toString());
    @Inject
    UtilityListRepository utilityListService;

    @Inject
    RoleRepository roleService;

    @Inject
    CategoryRepository categoryRepository;

    @Inject
    UserRepository userRepository;

    @Inject
    TripSuggestionRepository tripSuggestionRepository;

    @Inject
    TripAppointmentRepository tripAppointmentRepository;

    @PostConstruct
    private void Init(){
        Utility item = new Utility("Taschenlampe", false);
        utilityListService.saveUtilityItem(item);

        Role admin = new Role("admin", "", true);
        roleService.saveRole(admin);

        Category category = new Category("BergTour");
        categoryRepository.saveCategory(category);

        User user = new User("Patrick", "Mistlberger", "pati", "1234", "patrick@gmail.com", admin);
        userRepository.saveUser(user);

        TripSuggestion tripSuggestion = new TripSuggestion("http://link", "Almsee", "Wunderschöner Ausblick", true, user);
        tripSuggestionRepository.saveTripSuggestion(tripSuggestion);

        TripAppointment tripAppointment = new TripAppointment("Sonnstein", category, new Date(System.currentTimeMillis()), "Traunkirchen");
        tripAppointmentRepository.saveTripAppointment(tripAppointment);
        Utility u1 =new Utility("Schuhe",false);
        Utility u2 =new Utility("Lampe",false);
        utilityListService.saveUtilityItem(u1);
        utilityListService.saveUtilityItem(u2);
        tripAppointment.addUtility(u1);
        tripAppointment.addUtility(u2);

        tripAppointment.setCategory(category);
        tripAppointmentRepository.updateTripAppointment(tripAppointment);

        user.addTripAppointment(tripAppointment);
        logger.warning("user save trip " + user.getTripAppointment().toArray().length);
        logger.warning("trip save user " + tripAppointment.getUsers().toArray().length);

        userRepository.updateUser(user);
    }
}
