package com.ryan.ssm.pojo;

public class Carshop {
    private Integer cid;

    private Integer uid;

    private Integer pid;

    private Integer numbers;

    //添加对象
    private ProductInfo prod;

    public ProductInfo getProd() {
        return prod;
    }

    public void setProd(ProductInfo prod) {
        this.prod = prod;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }
}