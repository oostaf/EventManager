package dao;

import model.Event;
import model.Location;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class EventDaoImp implements EventDao {

    private static final String INSERT_EVENT_QUERY = "INSERT INTO event(name, description, address_id, cost, date, is_active)" +
            "VALUES (?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_ALL_FIELD_QUERY = "UPDATE event SET name=?, description=?, address_id=?, cost=?, date=?, is_active=?" +
            "WHERE id=?;";
    private static final String DEACTIVATE_BY_ID_QUERY = "UPDATE event SET is_active=? WHERE id=?;";
    private static final String SELECT_ALL_QUERY = "SELECT * FROM public.event";
    private static final String GET_EVENT_BY_ID_QUERY = "SELECT * FROM event WHERE id=?";
    private static final String GET_MAX_COST_QUERY = "SELECT MAX(cost) as cost FROM public.event;";

    @Override
    public void addEvent(Event event) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(INSERT_EVENT_QUERY);

            preparedStatement.setString(1, event.getName());
            preparedStatement.setString(2, event.getDescription());
            preparedStatement.setInt(3, event.getLocation().getId());
            preparedStatement.setDouble(4, event.getCost());
            preparedStatement.setTimestamp(5, Timestamp.valueOf(event.getDate()));
            preparedStatement.setBoolean(6, true);
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Fail to set event params", e);
        }
    }

    @Override
    public void updateEvent(Event event) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(UPDATE_ALL_FIELD_QUERY);
            preparedStatement.setString(1, event.getName());
            preparedStatement.setString(2, event.getDescription());
            preparedStatement.setInt(3, event.getLocation().getId());
            preparedStatement.setDouble(4, event.getCost());
            preparedStatement.setTimestamp(5, Timestamp.valueOf(event.getDate()));
            preparedStatement.setBoolean(6, event.getActive());
            preparedStatement.setInt(7, event.getId());

            preparedStatement.execute();

        } catch (SQLException e) {
            throw new RuntimeException("Fail to set event params", e);
        }
    }

    @Override
    public void deactivateEvent(Event event) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(DEACTIVATE_BY_ID_QUERY);

            preparedStatement.setBoolean(1, false);
            preparedStatement.setInt(2, event.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Fail to set event params", e);
        }
    }

    @Override
    public List<Event> getAllEvents() {
        try {
            List<Event> eventsList = new ArrayList<>();
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(SELECT_ALL_QUERY, ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet eventsResultSet = preparedStatement.executeQuery();
            eventsResultSet.beforeFirst();
            while (eventsResultSet.next()) {
                eventsList.add(parseResultSet(eventsResultSet));
            }
            return eventsList;
        } catch (SQLException e) {
            throw new RuntimeException("Fail to set event params", e);
        }
    }

    @Override
    public Event getEventById(int id) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(GET_EVENT_BY_ID_QUERY);

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return parseResultSet(resultSet);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Fail to set event params", e);
        }
    }

    @Override
    public double getMaxEventsCost() {
        try{
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(GET_MAX_COST_QUERY);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return resultSet.getDouble("cost");
            }
            throw new RuntimeException("Fail to get max events cost. ResultSet is empty");
        }catch (SQLException e) {
            throw new RuntimeException("Fail to get max events cost", e);
        }
    }

    private Event parseResultSet(ResultSet resultSet) {
        Event event = new Event();
        try {
            event.setId(resultSet.getInt("id"));
            event.setName(resultSet.getString("name"));
            event.setActive(resultSet.getBoolean("is_active"));
            Location location = new Location();
            location.setId(resultSet.getInt("address_id"));
            event.setLocation(location);
            event.setCost(resultSet.getDouble("cost"));
            event.setDate(resultSet.getTimestamp("date").toLocalDateTime());
            event.setDescription(resultSet.getString("description"));
            return event;
        } catch (SQLException exc) {
            throw new RuntimeException("Fail to parse result set into Event object", exc);
        }
    }

}
