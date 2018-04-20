package com.geminit.wetio.service.impl;

import com.geminit.wetio.entity.Music;
import com.geminit.wetio.repository.MusicRepository;
import com.geminit.wetio.service.MusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MusicServiceImpl implements MusicService {

    @Autowired
    MusicRepository musicRepository;

    public List<Music> findAll(){
        return musicRepository.findAll(new Sort(Sort.Direction.ASC, "top"));
    }

    public Music findMusicByName(String name){
        return musicRepository.findMusicByName(name);
    }

    public void deleteMusicByName(String name){
        musicRepository.deleteMusicByName(name);
    }

    public void deleteAll(){
        musicRepository.deleteAll();
    }

    public Music save(Music music){
        return musicRepository.save(music);
    }

}
