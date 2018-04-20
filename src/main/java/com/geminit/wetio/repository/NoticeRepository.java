package com.geminit.wetio.repository;

import com.geminit.wetio.entity.Notice;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface NoticeRepository extends CrudRepository<Notice, Integer> {

    public List<Notice> findAll(Sort sort);

    public Notice findNoticeById(int id);

    public void deleteNoticeById(int id);

    public void deleteAll();

    public Notice save(Notice notice);

}
