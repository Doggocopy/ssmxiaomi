package com.ryan.ssm.pojo.vo;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.pojo.vo
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-19 11:08
 * @Description: TODO
 * @Version: 1.0
 */
public class ProductVo {
    private String pname; //商品名
    private Integer typeid;//商品类型
    private Integer lprice;//低价格
    private Integer hprice;//高价格
    private Integer page=1;//页的索引

    public ProductVo() {
    }

    public ProductVo(String pname, Integer typeid, Integer lprice, Integer hprice, Integer page) {
        this.pname = pname;
        this.typeid = typeid;
        this.lprice = lprice;
        this.hprice = hprice;
        this.page = page;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getLprice() {
        return lprice;
    }

    public void setLprice(Integer lprice) {
        this.lprice = lprice;
    }

    public Integer getHprice() {
        return hprice;
    }

    public void setHprice(Integer hprice) {
        this.hprice = hprice;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    @Override
    public String toString() {
        return "ProductVo{" +
                "pname='" + pname + '\'' +
                ", typeid=" + typeid +
                ", lprice=" + lprice +
                ", hprice=" + hprice +
                ", page=" + page +
                '}';
    }
}
