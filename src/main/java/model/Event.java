package model;


import javax.validation.constraints.*;
import java.time.LocalDateTime;

public class Event {

    public Event() {
    }

    public Event(String name, String description, Location location, Double cost, LocalDateTime date) {
        this.name = name;
        this.description = description;
        this.location = location;
        this.cost = cost;
        this.date = date;
    }

    private Integer id;

    @NotEmpty(message = "Name cannot be null")
    @NotBlank(message = "Name cannot be null")
    private String name;

    @NotNull(message = "Date cannot be null")
    private LocalDateTime date;

    private String description;

    @PositiveOrZero(message = "Cost should not be less than 0")
    @NotNull(message = "Cost cannot be null")
    private Double cost;

    @NotNull(message = "Location cannot be null")
    private Location location;

    private Boolean active;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
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

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
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
