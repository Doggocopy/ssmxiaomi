package com.ryan.ssm.mapper;

import com.ryan.ssm.pojo.Carshop;
import com.ryan.ssm.pojo.CarshopExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CarshopMapper {

    Carshop selectUidPid(Carshop carshop);

    List<Carshop> selectProductInfoCarShop(Integer uid);

    int countByExample(CarshopExample example);

    int deleteByExample(CarshopExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Carshop record);

    int insertSelective(Carshop record);

    List<Carshop> selectByExample(CarshopExample example);

    Carshop selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Carshop record, @Param("example") CarshopExample example);

    int updateByExample(@Param("record") Carshop record, @Param("example") CarshopExample example);

    int updateByPrimaryKeySelective(Carshop record);

    int updateByPrimaryKey(Carshop record);


}