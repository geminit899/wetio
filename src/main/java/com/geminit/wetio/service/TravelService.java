package com.geminit.wetio.service;

import com.geminit.wetio.entity.Travel;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface TravelService {

    public List<Travel> findAll();

    public List<Travel> findTravelsByStartCity(String startCity);

    public Travel findTravelById(int id);

    public List<Travel> findTravelsByWayLikeOrCompanyLikeOrBeginTimeLike(String search1, String search2, String search3);

    public void updateTravelById(int id, String way);

    public List<String> getStartCity();

    public void deleteTravelById(int id);

    public Travel save(Travel travel);

}
