package cn.kgc.service.impl;

import cn.kgc.domain.Category;
import cn.kgc.domain.Entry;
import cn.kgc.mapper.CategoryMapper;
import cn.kgc.mapper.EntryMapper;
import cn.kgc.service.DemoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Version 1.0
 * @Author:dama zhuo
 * @Date:2019/12/16 9:03
 * @Content:
 */
@Service
public class DemoServiceImpl implements DemoService {
    @Autowired
    private EntryMapper entryMapper;
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public PageInfo findEntryById(Integer searchCategoryId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Entry> entryList = entryMapper.queryEntryById(searchCategoryId);
        PageInfo pageInfo=new PageInfo(entryList);
        return pageInfo;
    }

    @Override
    public List<Category> findAllCategory() {
        return categoryMapper.queryAllCategory();
    }

    @Override
    public boolean addEntry(Entry entry) {
        return entryMapper.insert(entry)>0?true:false;
    }

    @Override
    public Entry findEntryById(Integer id) {
        return entryMapper.selectByPrimaryKey(id);
    }

    @Override
    public boolean modifyEntry(Entry entry) {
        return entryMapper.updateByPrimaryKey(entry)>0?true:false;
    }

    @Override
    public boolean removeEntry(Integer id) {
        return entryMapper.deleteByPrimaryKey(id)>0?true:false;
    }
}
