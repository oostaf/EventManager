package dao;

import model.Event;

import java.util.List;

public interface EventLocationDao {

    List<Event> getAllEventsJoinLocation(int pageId);

    List<Event> getAllEventsJoinLocation();

    int getAllEventsJoinLocationCount();
}
