package com.geminit.wetio.repository;

import com.geminit.wetio.entity.Image;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface ImageRepository extends CrudRepository<Image, Integer> {

    public List<Image> findAll();

}
