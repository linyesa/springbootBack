package com.linyes.service;

import com.linyes.pojo.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import com.linyes.vo.PageVo;
import com.linyes.vo.ResultVo;
import com.linyes.vo.SearchForm;

/**
 * <p>
 * 订单表（业务数据） 服务类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
public interface OrderService extends IService<Order> {
    public PageVo list(Integer page, Integer size);
    public PageVo search(SearchForm searchForm);
    public ResultVo amountSum(String status);
}
