package cn.kgc.mapper;

import cn.kgc.domain.Entry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EntryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Entry record);

    int insertSelective(Entry record);

    Entry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Entry record);

    int updateByPrimaryKey(Entry record);

    //根据id查询图书分类信息

    List<Entry> queryEntryById( @Param("searchCategoryId") Integer searchCategoryId);


}