package model;


import java.sql.Date;

public class Event {

    public Event() {
    }

    public Event(String name, String description, String address, double cost, Date date) {
        this.name = name;
        this.description = description;
        this.address = address;
        this.cost = cost;
        this.date = date;
    }

    private int id;
    private String name;
    private Date date;
    private String description;
    private double cost;
    private String address;
    private boolean active;

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
