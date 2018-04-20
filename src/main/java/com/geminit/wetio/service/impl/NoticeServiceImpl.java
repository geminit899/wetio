package com.geminit.wetio.service.impl;

import com.geminit.wetio.entity.Notice;
import com.geminit.wetio.repository.NoticeRepository;
import com.geminit.wetio.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeRepository noticeRepository;

    public List<Notice> findAll(){
        return noticeRepository.findAll(new Sort(Sort.Direction.DESC, "time"));
    }

    public Notice findNoticeById(int id){
        return noticeRepository.findNoticeById(id);
    }

    public void deleteNoticeById(int id){
        noticeRepository.deleteNoticeById(id);
    }

    public void deleteAll(){
        noticeRepository.deleteAll();
    }

    public Notice save(Notice notice){
        return noticeRepository.save(notice);
    }

}
