package com.geminit.wetio.service.impl;

import com.geminit.wetio.entity.Travel;
import com.geminit.wetio.repository.TravelRepository;
import com.geminit.wetio.service.TravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TravelServiceImpl implements TravelService{

    @Autowired
    TravelRepository travelRepository;

    public List<Travel> findAll(){
        return travelRepository.findAll(new Sort(Sort.Direction.DESC, "beginTime"));
    }

    public List<Travel> findTravelsByStartCity(String startCity){
        return travelRepository.findTravelsByStartCity(startCity, new Sort(Sort.Direction.DESC, "beginTime"));
    }

    public Travel findTravelById(int id){
        return findTravelById(id);
    }

    public List<Travel> findTravelsByWayLikeOrCompanyLikeOrBeginTimeLike(String search1, String search2, String search3){
        return travelRepository.findTravelsByWayLikeOrCompanyLikeOrBeginTimeLike(search1, search2, search3,
                                                                                    new Sort(Sort.Direction.DESC, "beginTime"));
    }

    public void updateTravelById(int id, String way){
        travelRepository.updateTravelById(id, way);
    }

    public List<String> getStartCity(){
        return travelRepository.getStartCity();
    }

    public void deleteTravelById(int id){
        travelRepository.deleteTravelById(id);
    }

    public Travel save(Travel travel){
        return travelRepository.save(travel);
    }

}
