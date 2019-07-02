package dao;

import model.Location;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LocationDaoImp implements LocationDao {

    private static final String SELECT_LOCATION_BY_ID_QUERY = "SELECT * FROM public.location WHERE id=?;";
    private static final String SELECT_LOCATION_BY_ADDRESS_QUERY = "SELECT * FROM public.location WHERE address=?;";
    private static final String INSERT_LOCATION_QUERY = "INSERT INTO public.location(address) VALUES (?) ON CONFLICT DO NOTHING;";
    private static final String UPDATE_LOCATION_QUERY = "UPDATE public.location SET address=? WHERE id=?;";
    private static final String DELETE_LOCATION_BY_ID_QUERY = "DELETE FROM public.location WHERE id=?;";

    @Override
    public Location getLocationById(int id) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(SELECT_LOCATION_BY_ID_QUERY);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet != null) {
                resultSet.next();
                return parseLocationResultSet(resultSet);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Fail to get location object by id", e);
        }
    }

    @Override
    public Location getLocationByAddress(String address) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(SELECT_LOCATION_BY_ADDRESS_QUERY);
            preparedStatement.setString(1, address);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet != null) {
                resultSet.next();
                return parseLocationResultSet(resultSet);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Fail to get location object by address", e);
        }
    }

    @Override
    public void addLocation(Location location) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(INSERT_LOCATION_QUERY);

            preparedStatement.setString(1, location.getAddress());
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Fail to add new location", e);
        }
    }

    @Override
    public void deleteLocationByID(int id) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(DELETE_LOCATION_BY_ID_QUERY);

            preparedStatement.setInt(1, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(String.format("Fail to delete location by id=%d", id), e);
        }
    }

    @Override
    public void updateLocation(Location location) {
        try {
            PreparedStatement preparedStatement = ConnectionUtils.getConnection().prepareStatement(UPDATE_LOCATION_QUERY);

            preparedStatement.setString(1, location.getAddress());
            preparedStatement.setInt(2, location.getId());
            preparedStatement.execute();
        } catch (SQLException exc) {
            throw new RuntimeException(String.format("Fail to update location address by id=%d", location.getId()), exc);
        }
    }

    private Location parseLocationResultSet(ResultSet resultSet) {
        Location location = new Location();
        try {
            location.setId(resultSet.getInt("id"));
            location.setAddress(resultSet.getString("address"));
            return location;
        } catch (SQLException exc) {
            throw new RuntimeException("Fail to parse result set into Location object", exc);
        }
    }

}
