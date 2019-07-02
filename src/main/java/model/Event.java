package model;


import java.time.LocalDateTime;

public class Event {

    public Event() {
    }

    public Event(String name, String description, Location location, double cost, LocalDateTime date) {
        this.name = name;
        this.description = description;
        this.location = location;
        this.cost = cost;
        this.date = date;
    }

    private Integer id;
    private String name;
    private LocalDateTime date;
    private String description;
    private double cost;
    private Location location;
    private boolean active;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
