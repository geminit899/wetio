package com.geminit.wetio.repository;

import com.geminit.wetio.entity.Novel;
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
public interface NovelRepository extends CrudRepository<Novel, Integer> {

    public List<Novel> findAll(Sort sort);

    public List<Novel> findNovelsByIsFinished(int isFinished, Sort sort);

    public Novel findNovelByName(String name);

    @Modifying
    @Query(value = "update Novel n set n.latestChapter = :latestChapter where n.name = :name")
    public void updateLatestChapterByName(@Param("name")String name,@Param("latestChapter")String latestChapter);

    public void deleteNovelByName(String name);

    public void deleteAll();

    public Novel save(Novel novel);

}
