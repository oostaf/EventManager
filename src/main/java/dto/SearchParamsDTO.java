package dto;

import java.sql.Date;

public class SearchParamsDTO {

    private Date startDate;
    private Date endDate;
    private String name;
    private String address;
    private double lowerCost;
    private double highterCost;

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
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

    public double getLowerCost() {
        return lowerCost;
    }

    public void setLowerCost(double lowerCost) {
        this.lowerCost = lowerCost;
    }

    public double getHighterCost() {
        return highterCost;
    }

    public void setHighterCost(double highterCost) {
        this.highterCost = highterCost;
    }

}
