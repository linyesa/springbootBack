package com.linyes.controller;


import com.linyes.mapper.LineMapper;
import com.linyes.pojo.Line;
import com.linyes.service.LineService;
import com.linyes.utils.ResultVOUtil;
import com.linyes.utils.ScenicUtil;
import com.linyes.vo.ResultVo;
import com.linyes.vo.Scenic;
import com.linyes.vo.SearchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 景点线路表（初始化数据） 前端控制器
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@RestController
@RequestMapping("/line")
public class LineController {
    @Autowired
    private LineService lineService;
    @Autowired
    private LineMapper lineMapper;
    @PostMapping("/save")
    public ResultVo save(@RequestBody Line line){
        boolean save=lineService.save(line);
        if(!save){
            return ResultVOUtil.fail();
        }
        return ResultVOUtil.success(null);
    }
    @GetMapping("list/{page}/{size}")
    public ResultVo list(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        return ResultVOUtil.success(lineService.list(page,size));
    }
    @GetMapping("search")
    public ResultVo search(SearchForm searchForm){
        return ResultVOUtil.success(lineService.search(searchForm));
    }
    @GetMapping("getbyid/{id}")
    public ResultVo getById(@PathVariable("id")String id){
        System.out.println("-------------------daying id-----------------"+id);
        return ResultVOUtil.success(lineService.getById(id));
    }
    @PostMapping("update")
    public ResultVo updateById(@RequestBody Line line ){
        System.out.println("--------------------updatebyid----------------");
        boolean update=lineService.saveOrUpdate(line);
        if(!update){
            return ResultVOUtil.fail();
        }
        return ResultVOUtil.success(null);
    }

    @DeleteMapping("deletebyid/{id}")
    public ResultVo deleteById(@PathVariable("id")String id){
        int flag =lineMapper.deleteById(id);
        if(flag==0){
            return ResultVOUtil.fail();
        }
        else if(flag==1){
            return ResultVOUtil.success(null);
        }
        return null;
    }
}


