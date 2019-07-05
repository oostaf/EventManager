package service;

import model.Event;

import java.util.List;

public interface EventService {

    List<Event> getAllEvents();

    Event getEventByID(int id);

    void addEvent(Event event);

    void updateEvent(Event event);

    void deactivateEvent(int id);

    double getMaxEventsCost();

}
