package service;

import dao.EventDao;
import dao.EventDaoImp;
import model.Event;

import java.util.List;

public class EventServiceImp implements EventService {
    private EventDao eventDaoImp;

    public EventServiceImp() {
        eventDaoImp = new EventDaoImp();
    }

    public List<Event> getAllEvents() {
        return eventDaoImp.getAllEvents();
    }

    public Event getEventByID(int id) {
        return eventDaoImp.getEventById(id);
    }

    public void addEvent(Event event) {
        eventDaoImp.addEvent(event);
    }

    public void updateEvent(Event event) {
        eventDaoImp.updateEvent(event);
    }

    public void deactivateEvent(int id) {
        Event event = new Event();
        event.setId(id);
        eventDaoImp.deactivateEvent(event);
    }

}
