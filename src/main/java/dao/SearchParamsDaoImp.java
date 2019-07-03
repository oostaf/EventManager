package dao;

import dto.SearchParamsDTO;
import model.Event;
import model.Location;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchParamsDaoImp implements SearchParamsDao {
    public static final String SEARCH_BY_NAME_QUERY = "Select event.id, name, description, cost, date, is_active, " +
            "address_id, address from event left join location on event.address_id = location.id Where LOWER(name) ~* ?";

    @Override
    public List<Event> searchEventsByName(SearchParamsDTO searchParamsDTO) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(SEARCH_BY_NAME_QUERY);
            preparedStatement.setString(1, searchParamsDTO.getName());
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Event> filteredEvents = new ArrayList<>();
            while (resultSet.next()) {
                Location location = new Location();
                location.setId(resultSet.getInt("address_id"));
                location.setAddress(resultSet.getString("address"));

                Event event = new Event();
                event.setId(resultSet.getInt("id"));
                event.setName(resultSet.getString("name"));
                event.setDescription(resultSet.getString("description"));
                event.setCost(resultSet.getDouble("cost"));
                event.setActive(resultSet.getBoolean("is_active"));
                event.setDate(resultSet.getTimestamp("date").toLocalDateTime());
                event.setLocation(location);
                filteredEvents.add(event);
            }
            return filteredEvents;
        } catch (SQLException exc) {
            throw new RuntimeException("Fail to search events by name", exc);
        }
    }

    @Override
    public List<Event> searchEventsByAddress(SearchParamsDTO searchParamsDTO) {
        return null;
    }

    @Override
    public List<Event> filterEventsByCost(SearchParamsDTO searchParamsDTO) {
        return null;
    }

    @Override
    public List<Event> filterEventsByDate(SearchParamsDTO searchParamsDTO) {
        return null;
    }

}
