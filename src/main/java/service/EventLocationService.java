package service;

import model.Event;

import java.util.List;

public interface EventLocationService {

    List<Event> getAllEventsJoinLocation(int pageId);

    List<Event> getAllEventsJoinLocation();

    int getAllEventsJoinLocationCount();
}
