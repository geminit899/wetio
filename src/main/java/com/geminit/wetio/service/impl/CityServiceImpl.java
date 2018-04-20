package com.geminit.wetio.service.impl;

import com.geminit.wetio.entity.City;
import com.geminit.wetio.repository.CityRepository;
import com.geminit.wetio.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService{

    @Autowired
    CityRepository cityRepository;

    public List<City> findAll(){
        return cityRepository.findAll();
    }

    public City save(City city){
        return cityRepository.save(city);
    }

}
