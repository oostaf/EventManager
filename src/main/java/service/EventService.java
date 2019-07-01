package service;

import model.Event;

import java.util.List;

public interface EventService {

    public List<Event> getAllEvents();

    public Event getEventByID(int id);

    public void addEvent(Event event);

    public void updateEvent(Event event);

    public void deactivateEvent(int id);

}
