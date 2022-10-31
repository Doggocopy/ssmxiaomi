package com.ryan.ssm.mapper;

import com.ryan.ssm.pojo.ProductInfo;
import com.ryan.ssm.pojo.ProductInfoExample;
import java.util.List;

import com.ryan.ssm.pojo.vo.ProductVo;
import org.apache.ibatis.annotations.Param;

public interface ProductInfoMapper {
    /**
     * 多条件组合查询
     * @param vo
     * @return
     */
    List<ProductInfo> selectConditionSplitPage(ProductVo vo);

    int countByExample(ProductInfoExample example);

    int deleteByExample(ProductInfoExample example);

    int deleteByPrimaryKey(Integer pId);

    int insert(ProductInfo record);

    int insertSelective(ProductInfo record);

    List<ProductInfo> selectByExample(ProductInfoExample example);

    ProductInfo selectByPrimaryKey(Integer pId);

    int updateByExampleSelective(@Param("record") ProductInfo record, @Param("example") ProductInfoExample example);

    int updateByExample(@Param("record") ProductInfo record, @Param("example") ProductInfoExample example);

    int updateByPrimaryKeySelective(ProductInfo record);

    int updateByPrimaryKey(ProductInfo record);


}