package com.jimmy.domain;

import com.jimmy.utils.DateUtils;

import java.util.Date;
import java.util.List;

public class UGoods {

    private Integer id;
    private String name;
    private Integer typeid;
    private Double discount;
    private Double price;
    private String desc;
    private String thumb_img;
    private String big_img;
    private String content_img;
    private String[] content_img_arr;
    private String content;
    private Integer commentid;
    private Integer inventory;
    private Long clicked;
    private String address;
    private Date date;
    private String dateStr;
    private Integer is_recommend;
    private Integer month_sellid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getThumb_img() {
        return thumb_img;
    }

    public void setThumb_img(String thumb_img) {
        this.thumb_img = thumb_img;
    }

    public String getBig_img() {
        return big_img;
    }

    public void setBig_img(String big_img) {
        this.big_img = big_img;
    }

    public String getContent_img() {
        return content_img;
    }

    public void setContent_img(String content_img) {
        this.content_img = content_img;
    }

    public String[] getContent_img_arr() {
        content_img_arr = content_img.split(",");
        return content_img_arr;
    }

    public void setContent_img_arr(String[] content_img_arr) {
        this.content_img_arr = content_img_arr;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Long getClicked() {
        return clicked;
    }

    public void setClicked(Long clicked) {
        this.clicked = clicked;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateStr() {
        dateStr = DateUtils.date2String(date, "yyyy-MM-dd HH:mm:ss");
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public Integer getIs_recommend() {
        return is_recommend;
    }

    public void setIs_recommend(Integer is_recommend) {
        this.is_recommend = is_recommend;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getMonth_sellid() {
        return month_sellid;
    }

    public void setMonth_sellid(Integer month_sellid) {
        this.month_sellid = month_sellid;
    }

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }
}
