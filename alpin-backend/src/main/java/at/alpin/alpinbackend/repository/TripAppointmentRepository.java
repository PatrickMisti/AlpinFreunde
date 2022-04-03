package at.alpin.alpinbackend.repository;

import at.alpin.alpinbackend.entities.TripAppointment;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class TripAppointmentRepository {
    @PersistenceContext
    EntityManager manager;

    Logger logger = Logger.getLogger(TripAppointment.class.toString());

    public List<TripAppointment> findAllFromTripAppointment() {
        return manager.createNamedQuery("findAllTripAppointment", TripAppointment.class).getResultList();
    }

    public boolean saveTripAppointment(TripAppointment trip) {
        try {
            trip.setTimestamp(new Timestamp(System.currentTimeMillis()));
            manager.persist(trip);
            logger.info("Add tripAppointment to DB");
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Adding " + e);
            return false;
        }
    }

    public boolean updateTripAppointment(TripAppointment trip) {
        try {
            manager.merge(trip);
            logger.info("Update tripAppointment to DB");
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Updating " + e);
            return false;
        }
    }

    public boolean deleteTripAppointment(TripAppointment tripAppointment) {
        try {
            manager.remove(tripAppointment);
            logger.info("Removed TripAppointment " + tripAppointment);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Removing " + e);
            return false;
        }
    }

    public boolean deleteTripAppointment(Long id) {
        try {
            manager.createNamedQuery("deleteTripAppointmentById", TripAppointment.class).setParameter("id", id);
            logger.info("Removed TripAppointment by id " + id);
            return true;
        } catch (RuntimeException e) {
            logger.severe("Error by Removing " + e);
            return false;
        }
    }
}
