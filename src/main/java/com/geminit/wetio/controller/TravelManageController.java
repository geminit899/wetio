package com.geminit.wetio.controller;

import com.alibaba.fastjson.JSONObject;
import com.geminit.wetio.entity.Travel;
import com.geminit.wetio.service.TravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class TravelManageController {

    @Autowired
    TravelService travelService;

    @RequestMapping("/travel")
    public String travel(Map<String,Object> map, HttpServletRequest request){

        int toPage;

        if (request.getParameter("toPage") == null)
            toPage = 1;
        else
            toPage = Integer.parseInt(request.getParameter("toPage"));

        List<Travel> travelList = travelService.findAll();


        int travelNum = travelList.size();
        int pageNum = 1;

        if( travelNum%10 == 0 )
            pageNum = travelNum/10;
        else
            pageNum = travelNum/10 + 1;

        if( toPage<pageNum )
            travelList = travelList.subList((toPage-1)*10,toPage*10);
        else
            travelList = travelList.subList((toPage-1)*10,travelNum);


        map.put("currentPage", toPage);
        map.put("travelList", travelList);
        map.put("pageNum", pageNum);

        return "manage/travelManage";
    }

    //映射一个action
    @RequestMapping("/travel/search")
    public String search(Map<String,Object> map, HttpServletRequest request) {

        String search = request.getParameter("search");
        List<Travel> travelList = travelService.findTravelsByWayLikeOrCompanyLikeOrBeginTimeLike(search, search, search);

        int toPage = 1;
        int travelNum = travelList.size();
        int pageNum = 1;

        if( travelNum%10 == 0 )
            pageNum = travelNum/10;
        else
            pageNum = travelNum/10 + 1;

        if( toPage<pageNum )
            travelList = travelList.subList((toPage-1)*10,toPage*10);
        else
            travelList = travelList.subList((toPage-1)*10,travelNum);

        map.put("currentPage", toPage);
        map.put("travelList", travelList);
        map.put("pageNum", pageNum);

        return "manage/travelManage";
    }

    //映射一个action
    @RequestMapping("/travle/add")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response) {

        Travel travel = new Travel();

        if ( request.getParameter("company") == null )
            travel.setCompany("");
        else
            travel.setCompany(request.getParameter("company"));

        String way = request.getParameter("destination");
        travel.setStartCity(way.split("-")[0]);
        travel.setDestinations(way.split("-").length-1);
        travel.setWay(way);

        if ( request.getParameter("beginTime") == null )
            travel.setBeginTime("");
        travel.setBeginTime(request.getParameter("beginTime"));

        try {
            travelService.save(travel);
        } catch (Exception e){
            return "error";
        }

        return "success";
    }

    //映射一个action
    @RequestMapping("/travel/getTravel")
    @ResponseBody
    public JSONObject getTravel(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        Travel travel = travelService.findTravelById(id);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", travel.getId());
        jsonObject.put("company", travel.getCompany());
        jsonObject.put("way", travel.getWay());
        jsonObject.put("beginTime", travel.getBeginTime());

        return jsonObject;
    }

    //映射一个action
    @RequestMapping("/travel/edit")
    @ResponseBody
    public String edit(HttpServletRequest request, HttpServletResponse response) {

        Travel travel = new Travel();
        Travel backUpTravel = travelService.findTravelById(Integer.parseInt(request.getParameter("id")));

        if ( request.getParameter("company") == null )
            travel.setCompany("");
        else
            travel.setCompany(request.getParameter("company"));

        String way = request.getParameter("destination");
        travel.setStartCity(way.split("-")[0]);
        travel.setDestinations(way.split("-").length-1);
        travel.setWay(way);

        if ( request.getParameter("beginTime") == null )
            travel.setBeginTime("");
        travel.setBeginTime(request.getParameter("beginTime"));

        try {
            travelService.deleteTravelById(Integer.parseInt(request.getParameter("id")));
        } catch (Exception e){
            return "error";
        }

        try {
            travelService.save(travel);
        } catch (Exception e){
            try {
                travelService.save(backUpTravel);
            } catch (Exception e1){
                return "error";
            }
            return "error";
        }

        return "success";
    }
}
