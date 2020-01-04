package cn.kgc.service;

import cn.kgc.domain.Category;
import cn.kgc.domain.Entry;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @Version 1.0
 * @Author:dama zhuo
 * @Date:2019/12/16 9:01
 * @Content:
 */
public interface DemoService {
    PageInfo findEntryById(Integer searchCategoryId, Integer pageNum, Integer pageSize);

    //查询所有图书信息
    List<Category> findAllCategory();

    //添加图书信息
    boolean addEntry(Entry entry);

    /*修改图书信息*/
    //先显示需要修改的图书信息
    Entry findEntryById(Integer id);
    //在修改图书信息
    boolean modifyEntry(Entry entry);

    //删除图书信息
    boolean removeEntry(Integer id);
}
