package service;

import dao.LocationDao;
import dao.LocationDaoImp;
import model.Location;

import java.util.List;

public class LocationServiceImp implements LocationService {
    private LocationDao locationDaoImp;

    public LocationServiceImp() {
        locationDaoImp = new LocationDaoImp();
    }

    @Override
    public Location getLocationByAddress(String address) {
        return locationDaoImp.getLocationByAddress(address);
    }

    @Override
    public Location getLocationById(int id) {
        return locationDaoImp.getLocationById(id);
    }

    @Override
    public void addLocation(Location location) {
        locationDaoImp.addLocation(location);
    }

    @Override
    public void deleteLocationByID(int id) {
        locationDaoImp.deleteLocationByID(id);
    }

    @Override
    public void updateLocation(Location location) {
        LocationDaoImp locationDaoImp = new LocationDaoImp();
        locationDaoImp.updateLocation(location);
    }

    @Override
    public List<Location> getAllLocations() {
        return locationDaoImp.getAllLocations();
    }
}
