package com.geminit.wetio.repository;

import com.geminit.wetio.entity.City;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface CityRepository extends CrudRepository<City, Integer> {

    public List<City> findAll();

    public City save(City city);

}
