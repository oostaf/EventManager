package dto;

import java.time.LocalDateTime;

public class SearchParamsDTO {

    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private String name;
    private String address;
    private Double lowerCost;
    private Double higherCost;
    private String description;
    private Integer eventsPerPage;
    private Integer pageCount;

    public Integer getEventsPerPage() {
        return eventsPerPage;
    }

    public void setEventsPerPage(Integer eventsPerPage) {
        this.eventsPerPage = eventsPerPage;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getLowerCost() {
        return lowerCost;
    }

    public void setLowerCost(Double lowerCost) {
        this.lowerCost = lowerCost;
    }

    public Double getHigherCost() {
        return higherCost;
    }

    public void setHigherCost(Double higherCost) {
        this.higherCost = higherCost;
    }

}
