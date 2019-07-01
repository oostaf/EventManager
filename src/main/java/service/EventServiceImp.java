package service;

import dao.EventDaoImp;
import model.Event;

import java.sql.Date;
import java.util.List;

public class EventServiceImp implements EventService{

    public List<Event> getAllEvents(){
        EventDaoImp eventDaoImp = new EventDaoImp();
        return  eventDaoImp.getAllEvents();
    }

    public Event getEventByID(int id){
        EventDaoImp eventDaoImp = new EventDaoImp();
        return  eventDaoImp.getEventById(id);
    }

    public void addEvent(Event event){
        EventDaoImp eventDaoImp = new EventDaoImp();
        eventDaoImp.addEvent(event);
    }

    public void updateEvent(Event event){
        EventDaoImp eventDaoImp = new EventDaoImp();
        eventDaoImp.updateEvent(event);
    }

    public void deactivateEvent(int id){
        EventDaoImp eventDaoImp = new EventDaoImp();
        Event event = new Event();
        event.setId(id);
        eventDaoImp.deactivateEvent(event);
    }

}
