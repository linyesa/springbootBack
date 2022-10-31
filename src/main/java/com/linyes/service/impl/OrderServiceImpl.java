package com.linyes.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.linyes.pojo.Line;
import com.linyes.pojo.Order;
import com.linyes.mapper.OrderMapper;
import com.linyes.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linyes.utils.ResultVOUtil;
import com.linyes.vo.PageVo;
import com.linyes.vo.ResultVo;
import com.linyes.vo.SearchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 订单表（业务数据） 服务实现类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public ResultVo amountSum(String status) {
        QueryWrapper<Order> queryWrapper=new QueryWrapper<Order>();
        queryWrapper.eq("status",status);
        List<Order> lists=orderMapper.selectList(queryWrapper);
        return ResultVOUtil.success(lists);
    }

    @Override
    public PageVo search(SearchForm searchForm) {
        IPage<Order> orderPage;
        if(searchForm.getKey().equals("")){
            System.out.println("---------------------null--------------------------------"+searchForm);
            orderPage=orderMapper.selectPage(new Page<>(searchForm.getPage(),searchForm.getSize()),null);        }
        else {
            System.out.println("--------------------------you-------------------"+searchForm);
            QueryWrapper<Order> queryWrapper=new QueryWrapper<>();
            queryWrapper.like(searchForm.getKey(),searchForm.getValue());
            orderPage=orderMapper.selectPage(new Page<>(searchForm.getPage(),searchForm.getSize()),queryWrapper);

        }
        PageVo pageVO=new PageVo();
        pageVO.setData(orderPage.getRecords());
        pageVO.setTotal(orderPage.getTotal());
        return pageVO;
    }

    @Override
    public PageVo list(Integer page, Integer size) {
        IPage<Order> orderIPage=orderMapper.selectPage(new Page<>(page,size),null);
        PageVo pageVO=new PageVo();
        pageVO.setData(orderIPage.getRecords());
        pageVO.setTotal(orderIPage.getTotal());
        return pageVO;
    }
}
