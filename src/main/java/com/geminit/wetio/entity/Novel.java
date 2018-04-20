package com.geminit.wetio.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * @author Geminit
 * @create 2018-1-22
 */

@Entity
@Table(name = "novel")
public class Novel implements java.io.Serializable{

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private String name;

    private String author;
    @Column(name = "latestchapter")
    private String latestChapter;
    private String url;
    @Column(name = "begintime")
    private Date beginTime;
    @Column(name = "isfinished")
    private int isFinished;

    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getLatestChapter() {
        return latestChapter;
    }

    public void setLatestChapter(String latestChapter) {
        this.latestChapter = latestChapter;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public int getIsFinished() {
        return isFinished;
    }

    public void setIsFinished(int isFinished) {
        this.isFinished = isFinished;
    }
}
