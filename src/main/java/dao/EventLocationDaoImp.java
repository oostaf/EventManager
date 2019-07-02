package dao;

import model.Event;
import model.Location;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventLocationDaoImp implements EventLocationDao {

    public static final String GET_ALL_EVENTS_JOIN_LOCATION = "SELECT event.id, event.name, event.description," +
            " event.cost,event.is_active,location.address,event.address_id,event.date FROM event " +
            "LEFT JOIN location ON event.address_id = location.id;";

    @Override
    public List<Event> getAllEventsJoinLocation() {
        try {
            List<Event> eventsList = new ArrayList<>();
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(GET_ALL_EVENTS_JOIN_LOCATION, ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.beforeFirst();
            while (resultSet.next()) {
                Event event = new Event();
                event.setId(resultSet.getInt("id"));
                event.setName(resultSet.getString("name"));
                event.setActive(resultSet.getBoolean("is_active"));
                Location location = new Location();
                location.setId(resultSet.getInt("address_id"));
                location.setAddress(resultSet.getString("address"));
                event.setLocation(location);
                event.setCost(resultSet.getDouble("cost"));
                event.setDate(resultSet.getTimestamp("date").toLocalDateTime());
                event.setDescription(resultSet.getString("description"));

                eventsList.add(event);
            }
            return eventsList;
        } catch (SQLException e) {
            throw new RuntimeException("Fail to set event params", e);
        }
    }

}
