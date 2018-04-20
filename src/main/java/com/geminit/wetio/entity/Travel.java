package com.geminit.wetio.entity;

import javax.persistence.*;

/**
 * @author Geminit
 * @create 2018-1-23
 */

@Entity
@Table(name = "travle")
public class Travel {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    private String company;
    @Column(name = "startcity")
    private String startCity;
    private String way;
    private int destinations;
    @Column(name = "begintime")
    private String beginTime;

    public int getId() { return id; }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompany() { return company;  }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getStartCity() {
        return startCity;
    }

    public void setStartCity(String startCity) {
        this.startCity = startCity;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way;
    }

    public int getDestinations() { return destinations; }

    public void setDestinations(int destinations) {
        this.destinations = destinations;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }
}
