package com.ryan.ssm.mapper;

import com.ryan.ssm.pojo.Xmorder;
import com.ryan.ssm.pojo.XmorderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface XmorderMapper {
    int countByExample(XmorderExample example);

    int deleteByExample(XmorderExample example);

    int deleteByPrimaryKey(String oid);

    int insert(Xmorder record);

    int insertSelective(Xmorder record);

    List<Xmorder> selectByExample(XmorderExample example);

    Xmorder selectByPrimaryKey(String oid);

    int updateByExampleSelective(@Param("record") Xmorder record, @Param("example") XmorderExample example);

    int updateByExample(@Param("record") Xmorder record, @Param("example") XmorderExample example);

    int updateByPrimaryKeySelective(Xmorder record);

    int updateByPrimaryKey(Xmorder record);
}