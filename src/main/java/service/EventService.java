package service;

import dao.EventDaoImp;
import model.Event;

import java.sql.Date;
import java.util.List;

public class EventService {

    public List<Event> getAllEvents(){
        EventDaoImp eventDaoImp = new EventDaoImp();
        return  eventDaoImp.getAllEvents();
    }

    public Event getEventByID(int id){
        EventDaoImp eventDaoImp = new EventDaoImp();
        return  eventDaoImp.getEventById(id);
    }

    public void addEvent(String name, String description, String address, double cost, Date date){
        Event event = new Event(name, description, address, cost, date);
        EventDaoImp eventDaoImp = new EventDaoImp();
        eventDaoImp.addEvent(event);
    }

    public void deactivateEvent(int id){
        EventDaoImp eventDaoImp = new EventDaoImp();
        Event event = new Event();
        event.setId(id);
        eventDaoImp.deactivateEvent(event);
    }

}
