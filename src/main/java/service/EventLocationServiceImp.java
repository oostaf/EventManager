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
    public List<Event> getAllEventsJoinLocation(int pageId) {
        int offsetValue = (pageId - 1) * 5;//5 is a limit for now
        return eventLocationDaoImp.getAllEventsJoinLocation(offsetValue);
    }

    @Override
    public List<Event> getAllEventsJoinLocation() {
        return eventLocationDaoImp.getAllEventsJoinLocation();
    }

    @Override
    public int getAllEventsJoinLocationCount() {
        return eventLocationDaoImp.getAllEventsJoinLocationCount();
    }

}
