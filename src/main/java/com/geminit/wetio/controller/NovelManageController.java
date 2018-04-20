package com.geminit.wetio.controller;

import com.geminit.wetio.entity.Novel;
import com.geminit.wetio.service.NovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author Geminit
 * @create 2018-2-9
 */

@Controller
@RequestMapping("/manage")
public class NovelManageController {

    @Autowired
    NovelService novelService;

    //映射一个action
    @RequestMapping("/novel")
    public String novelManage(Map<String,Object> map, HttpServletRequest request) {

        List<Novel> novelList = novelService.findAll();

        int novelNum = novelList.size();
        int pageNum = 1;

        if( novelNum%10 == 0 )
            pageNum = novelNum/10;
        else
            pageNum = novelNum/10 + 1;

        map.put("novelList", novelList);
        map.put("novelNum", novelNum);
        map.put("pageNum", pageNum);

        return "manage/novelManage";
    }

}
