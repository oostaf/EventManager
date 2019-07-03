package dao;

import model.Location;

import java.util.List;

public interface LocationDao {

    Location getLocationById(int id);

    Location getLocationByAddress(String address);

    void addLocation(Location location);

    void deleteLocationByID(int id);

    void updateLocation(Location location);

    List<Location> getAllLocations();
}
