package dao;

import model.Event;

import java.util.List;

public interface EventDao {

    void addEvent(Event event);

    void updateEvent(Event event);

    void deactivateEvent(Event event);

    List<Event> getAllEvents();

    Event getEventById(int id);

    double getMaxEventsCost();

}
