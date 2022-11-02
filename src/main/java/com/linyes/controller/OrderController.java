package com.linyes.controller;


import com.linyes.mapper.OrderMapper;
import com.linyes.pojo.Line;
import com.linyes.pojo.Order;
import com.linyes.service.OrderService;
import com.linyes.utils.ResultVOUtil;
import com.linyes.vo.ResultVo;
import com.linyes.vo.SearchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 订单表（业务数据） 前端控制器
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderMapper orderMapper;
    @PostMapping("save")
    public ResultVo save(@RequestBody Order order){
        boolean save=orderService.save(order);
        if(!save){
            return ResultVOUtil.fail();
        }
        return ResultVOUtil.success(null);
    }
    @GetMapping("list/{page}/{size}")
    public ResultVo list(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        return ResultVOUtil.success(orderService.list(page,size));
    }
    @GetMapping("search")
    public ResultVo search(SearchForm searchForm){
        return ResultVOUtil.success(orderService.search(searchForm));
    }
    @GetMapping("getbyid/{id}")
    public ResultVo getById(@PathVariable("id")String id){
        System.out.println("-------------------daying id-----------------"+id);
        return ResultVOUtil.success(orderService.getById(id));
    }
    @PostMapping("update")
    public ResultVo updateById(@RequestBody Order order ){
        System.out.println("--------------------updatebyid----------------");
        boolean update=orderService.saveOrUpdate(order);
        if(!update){
            return ResultVOUtil.fail();
        }
        return ResultVOUtil.success(null);
    }

    @DeleteMapping("deletebyid/{id}")
    public ResultVo deleteById(@PathVariable("id")String id){
        int flag =orderMapper.deleteById(id);
        if(flag==0){
            return ResultVOUtil.fail();
        }
        else if(flag==1){
            return ResultVOUtil.success(null);
        }
        return null;
    }
//    @GetMapping("/getamountsum")
//    public Integer getAmountSum(String status){
//        return orderMapper.getAmountSum(status);
//    }
    @GetMapping("getamountsum/{status}")
    public Integer getAmountSum(@PathVariable("status") String status){
        return orderMapper.getAmountSum(status);
    }
    @GetMapping("getamountsumbyweek/{status}")
    public List<Integer> getAmountSumByWeek(@PathVariable("status")String status){
        List<Integer> list =new ArrayList<>();
        for(int i=1;i<8;i++){
            list.add(orderMapper.getAmountSumByWeek(status, i));
        }
        return list;
    }
}

