package cn.kgc.mapper;

import cn.kgc.domain.Category;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

   //查询所有图书分类信息
    @Select("select * from category")
    List<Category> queryAllCategory();
}