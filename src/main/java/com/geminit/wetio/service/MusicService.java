package com.geminit.wetio.service;

import com.geminit.wetio.entity.Music;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface MusicService {

    public List<Music> findAll();

    public Music findMusicByName(String name);

    public void deleteMusicByName(String name);

    public void deleteAll();

    public Music save(Music music);

}
