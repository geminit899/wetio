package com.geminit.wetio.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Geminit
 * @create 2018-1-22
 */

@Entity
@Table(name = "city")
public class City {

    @Id
    private String name;

    private Double longitude;
    private Double latitude;

    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }
}
