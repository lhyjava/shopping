package com.test.shopping.entity;

public class Goods {
    private Integer id;

    private String name;

    private String img;

    private Integer number;

    private Integer stock;

    private Integer opice;

    private Integer pice;

    private Integer brandid;

    private Integer typeid;

    private Integer goodsspecid;

    private Integer goodsclassid;

    private Boolean recommend;

    private Boolean grounding;

    private String details;

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
        this.name = name == null ? null : name.trim();
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getOpice() {
        return opice;
    }

    public void setOpice(Integer opice) {
        this.opice = opice;
    }

    public Integer getPice() {
        return pice;
    }

    public void setPice(Integer pice) {
        this.pice = pice;
    }

    public Integer getBrandid() {
        return brandid;
    }

    public void setBrandid(Integer brandid) {
        this.brandid = brandid;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getGoodsspecid() {
        return goodsspecid;
    }

    public void setGoodsspecid(Integer goodsspecid) {
        this.goodsspecid = goodsspecid;
    }

    public Integer getGoodsclassid() {
        return goodsclassid;
    }

    public void setGoodsclassid(Integer goodsclassid) {
        this.goodsclassid = goodsclassid;
    }

    public Boolean getRecommend() {
        return recommend;
    }

    public void setRecommend(Boolean recommend) {
        this.recommend = recommend;
    }

    public Boolean getGrounding() {
        return grounding;
    }

    public void setGrounding(Boolean grounding) {
        this.grounding = grounding;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details == null ? null : details.trim();
    }
}