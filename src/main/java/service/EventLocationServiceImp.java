package service;

import dao.EventLocationDao;
import dao.EventLocationDaoImp;
import model.Event;

import java.util.List;

public class EventLocationServiceImp implements EventLocationService {
    EventLocationDao eventLocationDaoImp;

    public EventLocationServiceImp() {
        eventLocationDaoImp = new EventLocationDaoImp();
    }

    @Override
    public List<Event> getAllEventsJoinLocation() {
        return eventLocationDaoImp.getAllEventsJoinLocation();
    }

}
