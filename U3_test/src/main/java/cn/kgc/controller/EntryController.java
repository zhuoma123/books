package cn.kgc.controller;

import cn.kgc.domain.Category;
import cn.kgc.domain.Entry;
import cn.kgc.service.DemoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Version 1.0
 * @Author:dama zhuo
 * @Date:2019/12/16 9:02
 * @Content:
 */
@Controller
public class EntryController {
    @Autowired
    private DemoService demoService;
    @RequestMapping("/list")
    public ModelAndView list(ModelAndView mv,Integer searchCategoryId,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             HttpSession session
                             ){
        PageInfo pageInfo = demoService.findEntryById(searchCategoryId, pageNum, 3);
        List<Category> categoryList = demoService.findAllCategory();
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("searchCategoryId",searchCategoryId);
        session.setAttribute("categoryList",categoryList);
        mv.setViewName("main");
        return mv;
    }
    //显示添加图书信息的页面
    @RequestMapping("/addEntryUI")
    public String addEntryUI(){
        return "addEntry";
    }
    //添加图书信息
     @RequestMapping("/addEntry")
    public ModelAndView addEntry(ModelAndView mv, Entry entry){

         boolean b = demoService.addEntry(entry);
         if(b){
             mv.addObject("insert","success");
         }else{
             mv.addObject("insert","fail");
         }
         mv.setViewName("forward:list");
         return mv;
     }
     /*修改图书信息*/
    @RequestMapping("/updateEntryUI")
    public String updateEntryUI(Model model,Integer id){
        Entry entryById = demoService.findEntryById(id);
        model.addAttribute("entry",entryById);
        return "updateEntry";
    }
    @RequestMapping("/updateEntry")
    public ModelAndView updateEntry(ModelAndView mv,Entry entry){
        boolean b = demoService.modifyEntry(entry);
        if(b){
            mv.addObject("update","success");
        }else{
            mv.addObject("update","fail");
        }
        mv.setViewName("forward:list");
        return mv;
    }
    //删除图书信息
    @RequestMapping("/deleteEntry")
    public ModelAndView deleteEntry(ModelAndView mv,Integer id){
        boolean b = demoService.removeEntry(id);
        if(b){
            mv.addObject("delete","success");
        }else{
            mv.addObject("delete","fail");
        }
        mv.setViewName("forward:list");
        return mv;
    }

}
