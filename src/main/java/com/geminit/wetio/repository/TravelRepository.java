package com.geminit.wetio.repository;

import com.geminit.wetio.entity.Travel;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface TravelRepository extends CrudRepository<Travel, Integer> {

    public List<Travel> findAll(Sort sort);

    public List<Travel> findTravelsByStartCity(String startCity, Sort sort);

    public Travel findTravelById(int id);

    public List<Travel> findTravelsByWayLikeOrCompanyLikeOrBeginTimeLike(String search1, String search2, String search3, Sort sort);

    @Modifying
    @Query(value = "update Travel t set t.way=:way where t.id=:id")
    public void updateTravelById(@Param("id")Integer id, @Param("way")String way);

    @Query(value = "select startCity from Travel group by startCity")
    public List<String> getStartCity();

    public void deleteTravelById(int id);

    public Travel save(Travel travel);

}
