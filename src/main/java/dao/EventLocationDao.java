package dao;

import model.Event;

import java.util.List;

public interface EventLocationDao {

    List<Event> getAllEventsJoinLocation();
}
