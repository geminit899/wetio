package com.geminit.wetio.service;

import com.geminit.wetio.entity.City;

import java.util.List;

public interface CityService {

    public List<City> findAll();

    public City save(City city);

}
