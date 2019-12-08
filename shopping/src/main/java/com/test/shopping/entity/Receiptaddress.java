package com.test.shopping.entity;

public class Receiptaddress {
    private Integer id;

    private String receiptname;

    private String receiptnregionsheng;

    private String receiptnregionshi;

    private String receiptnregionqu;

    private String receiptnstreet;

    private String receiptnumber;

    private Integer receiptphone;

    private Integer receiptyoubian;

    private Integer userid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReceiptname() {
        return receiptname;
    }

    public void setReceiptname(String receiptname) {
        this.receiptname = receiptname == null ? null : receiptname.trim();
    }

    public String getReceiptnregionsheng() {
        return receiptnregionsheng;
    }

    public void setReceiptnregionsheng(String receiptnregionsheng) {
        this.receiptnregionsheng = receiptnregionsheng == null ? null : receiptnregionsheng.trim();
    }

    public String getReceiptnregionshi() {
        return receiptnregionshi;
    }

    public void setReceiptnregionshi(String receiptnregionshi) {
        this.receiptnregionshi = receiptnregionshi == null ? null : receiptnregionshi.trim();
    }

    public String getReceiptnregionqu() {
        return receiptnregionqu;
    }

    public void setReceiptnregionqu(String receiptnregionqu) {
        this.receiptnregionqu = receiptnregionqu == null ? null : receiptnregionqu.trim();
    }

    public String getReceiptnstreet() {
        return receiptnstreet;
    }

    public void setReceiptnstreet(String receiptnstreet) {
        this.receiptnstreet = receiptnstreet == null ? null : receiptnstreet.trim();
    }

    public String getReceiptnumber() {
        return receiptnumber;
    }

    public void setReceiptnumber(String receiptnumber) {
        this.receiptnumber = receiptnumber == null ? null : receiptnumber.trim();
    }

    public Integer getReceiptphone() {
        return receiptphone;
    }

    public void setReceiptphone(Integer receiptphone) {
        this.receiptphone = receiptphone;
    }

    public Integer getReceiptyoubian() {
        return receiptyoubian;
    }

    public void setReceiptyoubian(Integer receiptyoubian) {
        this.receiptyoubian = receiptyoubian;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}