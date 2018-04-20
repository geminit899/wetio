package com.geminit.wetio.service;

import com.geminit.wetio.entity.Novel;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface NovelService {

    public List<Novel> findAll();

    public List<Novel> getUnfinishedNovel();

    public Novel findNovelByName(String name);

    public void updateLatestChapterByName(String name, String latestChapter);

    public void deleteNovelByName(String name);

    public void deleteAll();

    public Novel save(Novel novel);

}
