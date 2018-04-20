package com.geminit.wetio.service.impl;

import com.geminit.wetio.entity.Novel;
import com.geminit.wetio.repository.NovelRepository;
import com.geminit.wetio.service.NovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NovelServiceImpl implements NovelService {

    @Autowired
    NovelRepository novelRepository;

    public List<Novel> findAll(){
        return novelRepository.findAll(new Sort(Sort.Direction.DESC, "beginTime"));
    }

    public List<Novel> getUnfinishedNovel(){
        return novelRepository.findNovelsByIsFinished(0, new Sort(Sort.Direction.DESC, "beginTime"));
    }

    public Novel findNovelByName(String name){
        return novelRepository.findNovelByName(name);
    }

    public void updateLatestChapterByName(String name, String latestChapter){
        novelRepository.updateLatestChapterByName(name, latestChapter);
    }

    public void deleteNovelByName(String name){
        novelRepository.deleteNovelByName(name);
    }

    public void deleteAll(){
        novelRepository.deleteAll();
    }

    public Novel save(Novel novel){
        return novelRepository.save(novel);
    }

}
