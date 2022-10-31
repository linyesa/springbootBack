package com.linyes.mapper;

import com.linyes.pojo.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Component;

/**
 * <p>
 * 订单表（业务数据） Mapper 接口
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Component
public interface OrderMapper extends BaseMapper<Order> {
    Integer getAmountSum(String status);
    Integer getAmountSumByWeek(String status,Integer week);

}
