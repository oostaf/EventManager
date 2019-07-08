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
    public static final String GET_JOIN_ROWS_COUNT_QUERY = "SELECT count(*) FROM event" +
            " LEFT JOIN location ON event.address_id = location.id;";

    @Override
    public List<Event> getAllEventsJoinLocation() {
        try {
            List<Event> eventsList = new ArrayList<>();
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(GET_ALL_EVENTS_JOIN_LOCATION, ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.beforeFirst();
            while (resultSet.next()) {
                Location location = new Location();
                location.setId(resultSet.getInt("address_id"));
                location.setAddress(resultSet.getString("address"));

                Event event = new Event();
                event.setId(resultSet.getInt("id"));
                event.setName(resultSet.getString("name"));
                event.setActive(resultSet.getBoolean("is_active"));
                event.setCost(resultSet.getDouble("cost"));
                event.setDate(resultSet.getTimestamp("date").toLocalDateTime());
                event.setDescription(resultSet.getString("description"));
                event.setLocation(location);

                eventsList.add(event);
            }
            return eventsList;
        } catch (SQLException e) {
            throw new RuntimeException("Fail to set join query params", e);
        }
    }

    @Override
    public int getAllEventsJoinLocationCount() {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtils.getConnection().prepareStatement(GET_JOIN_ROWS_COUNT_QUERY);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("count");
            }
            throw new RuntimeException("Fail to get rows count. ResultSet is empty");
        } catch (SQLException e) {
            throw new RuntimeException("Fail to get rows count", e);
        }
    }

}
