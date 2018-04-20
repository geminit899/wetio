package com.geminit.wetio.repository;

import com.geminit.wetio.entity.Music;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface MusicRepository extends CrudRepository<Music, Integer> {

    public List<Music> findAll(Sort sort);

    public Music findMusicByName(String name);

    public void deleteMusicByName(String name);

    public void deleteAll();

    public Music save(Music music);

}
