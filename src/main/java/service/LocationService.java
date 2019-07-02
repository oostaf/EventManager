package service;

import model.Location;

public interface LocationService {

    Location getLocationByAddress(String address);

    Location getLocationById(int id);

    void addLocation(Location location);

    void deleteLocationByID(int id);

    void updateLocation(Location location);
}
