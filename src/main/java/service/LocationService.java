package service;

import model.Location;

import java.util.List;

public interface LocationService {

    Location getLocationByAddress(String address);

    Location getLocationById(int id);

    void addLocation(Location location);

    void deleteLocationByID(int id);

    void updateLocation(Location location);

    List<String> getAllAddresses();
}
