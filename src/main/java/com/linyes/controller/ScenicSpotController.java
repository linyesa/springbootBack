package com.linyes.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linyes.mapper.ScenicSpotMapper;
import com.linyes.pojo.ScenicSpot;
import com.linyes.service.ScenicSpotService;
import com.linyes.utils.ResultVOUtil;
import com.linyes.utils.ScenicUtil;
import com.linyes.vo.ResultVo;
import com.linyes.vo.Scenic;
import com.linyes.vo.SearchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Generated;
import java.util.List;

/**
 * <p>
 * 景点表（初始化数据） 前端控制器
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@RestController
@RequestMapping("/scenicspot")
public class ScenicSpotController {
    @Autowired
    private ScenicSpotService scenicSpotService;
    @Autowired
    private ScenicSpotMapper scenicSpotMapper;
    @PostMapping("save")
    public ResultVo save(@RequestBody Scenic scenic){
        ScenicSpot scenicSpot= ScenicUtil.transform(scenic);
        System.out.println(scenicSpot);
        boolean save=scenicSpotService.save(scenicSpot);
        if(!save){
            return ResultVOUtil.fail();
        }
        return ResultVOUtil.success(null);
    }
//    @GetMapping("list")
//    public ResultVo list(){
//        QueryWrapper<ScenicSpot> queryWrapper=new QueryWrapper<>();
//        List<ScenicSpot> scenicSpots=scenicSpotService.list(queryWrapper);
//        return ResultVOUtil.success(scenicSpots);
//    }
    @GetMapping("list/{page}/{size}")
    public ResultVo list(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        return ResultVOUtil.success(scenicSpotService.list(page,size));
    }
    @GetMapping("search")
    public ResultVo search(SearchForm searchForm){
        return ResultVOUtil.success(scenicSpotService.search(searchForm));
    }
    @GetMapping("getbyid/{id}")
    public ResultVo getById(@PathVariable("id")String id){
        System.out.println("-------------------daying id-----------------"+id);
        return ResultVOUtil.success(scenicSpotService.getById(id));
    }
    @PostMapping("update/{id}")
    public ResultVo updateById(@PathVariable("id") String id,@RequestBody Scenic scenic ){
        System.out.println("--------------------updatebyid----------------");
        System.out.println(id+scenic);
        boolean update=scenicSpotService.saveOrUpdate(ScenicUtil.transformAll(scenic,id));
        if(!update){
            return ResultVOUtil.fail();
        }
        return ResultVOUtil.success(null);
    }
    @DeleteMapping("deletebyid/{id}")
    public ResultVo deleteById(@PathVariable("id")String id){
        int flag =scenicSpotMapper.deleteById(id);
        if(flag==0){
            return ResultVOUtil.fail();
        }
        else if(flag==1){
            return ResultVOUtil.success(null);
        }
        return null;
    }
}

