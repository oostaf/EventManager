package dao;

import dto.SearchParamsDTO;
import model.Event;
import model.Location;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class SearchParamsDaoImp implements SearchParamsDao {
    public static final String SEARCH_BY_NAME_QUERY = "Select event.id, name, description, cost, date, is_active, " +
            "address_id, address from event left join location on event.address_id = location.id Where LOWER(name) ~* ?";
    public static final String SEARCH_BY_NAME_AND_COST_QUERY = "Select event.id, name, description, cost, date, is_active," +
            "address_id, address from event left join location on event.address_id = location.id " +
            "Where LOWER(name) ~* ? and cost BETWEEN ? AND ?";

    @Override
    public List<Event> searchEventsByName(SearchParamsDTO searchParamsDTO) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(SEARCH_BY_NAME_QUERY);
            preparedStatement.setString(1, searchParamsDTO.getName());
            ResultSet resultSet = preparedStatement.executeQuery();

/*            List<Event> filteredEvents = new ArrayList<>();
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
            }*/
            return parseResultSet(resultSet);
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

    @Override
    public List<Event> searchEventsDynamically(SearchParamsDTO searchParamsDTO) {
        String queryToExecute = buildSearchQuery(searchParamsDTO);
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(queryToExecute);
            if (searchParamsDTO.getName() != null) {
                preparedStatement.setString(1, searchParamsDTO.getName());
            } else if (searchParamsDTO.getDescription() != null) {
                preparedStatement.setString(1, searchParamsDTO.getDescription());
            } else if (searchParamsDTO.getAddress() != null) {
                preparedStatement.setString(1, searchParamsDTO.getAddress());
            }else {
                preparedStatement.setString(1, "");
            }

            if (searchParamsDTO.getStartDate() != null) {
                preparedStatement.setTimestamp(2, Timestamp.valueOf(searchParamsDTO.getStartDate()));
                preparedStatement.setTimestamp(3, Timestamp.valueOf(searchParamsDTO.getEndDate()));
            }
            if (searchParamsDTO.getLowerCost() != null && searchParamsDTO.getStartDate() == null) {
                preparedStatement.setDouble(2, searchParamsDTO.getLowerCost());
                preparedStatement.setDouble(3, searchParamsDTO.getHigherCost());
            }else if(searchParamsDTO.getLowerCost() != null && searchParamsDTO.getStartDate() != null){
                preparedStatement.setDouble(4, searchParamsDTO.getLowerCost());
                preparedStatement.setDouble(5, searchParamsDTO.getHigherCost());
            }

            ResultSet resultSet = preparedStatement.executeQuery();
            return parseResultSet(resultSet);
        } catch (SQLException exc) {
            throw new RuntimeException(String.format("Fail to search events by query: %s", queryToExecute), exc);
        }
    }

    private String buildSearchQuery(SearchParamsDTO searchParamsDTO) {
        StringBuilder sb = new StringBuilder();
        sb.append("Select event.id, name, description, cost, date, is_active," +
                "address_id, address from event left join location on event.address_id = location.id Where ");
        if (searchParamsDTO.getName() != null) {
            sb.append("LOWER(name) ~* ? ");
        } else if (searchParamsDTO.getDescription() != null) {
            sb.append("LOWER(description) ~* ? ");
        } else if (searchParamsDTO.getAddress() != null) {
            sb.append("LOWER(address) ~* ? ");
        }else {
            sb.append("LOWER(name) ~* ? ");
        }

        if (searchParamsDTO.getStartDate() != null) {
            sb.append("and (date BETWEEN ? AND ?) ");
        }
        if (searchParamsDTO.getLowerCost() != null) {
            sb.append("and (cost BETWEEN ? AND ?) ");
        }

        return sb.toString();
    }

    private List<Event> parseResultSet(ResultSet resultSet) throws SQLException {
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
    }

}
