package com.geminit.wetio.service;

import com.geminit.wetio.entity.Notice;

import java.util.List;

public interface NoticeService {

    public List<Notice> findAll();

    public Notice findNoticeById(int id);

    public void deleteNoticeById(int id);

    public void deleteAll();

    public Notice save(Notice notice);

}
