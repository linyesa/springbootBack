package com.example.demo;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linyes.DemoApplication;
import com.linyes.mapper.OrderMapper;
import com.linyes.pojo.Order;
import com.linyes.service.OrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.internal.matchers.Or;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = DemoApplication.class)
@MapperScan("com.linyes.mapper")
public class OrderTest {
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderMapper orderMapper;
    @Test
    public void testSave(){
        Order order =new Order();
        order.setAmount(new BigDecimal(199));
        order.setStatus("未支付");
        order.setCreateUser("1");
        order.setTogetherNumber(10);
        order.setCreateUser("lysa");
        for(int i =1;i<10;i++){
            order.setReservationTime(new Date());
            orderService.save(order);
        }
    }
    @Test
    public void testUpdata(){
        Order order =new Order();
        order.setId(2l);
        order.setAmount(new BigDecimal(10099));
        order.setStatus("未支付");
        order.setCreateUser("1");
        order.setTogetherNumber(20);
        order.setReservationTime(new Date());
        System.out.println(orderService.updateById(order));
    }
    @Test
    public void testPage(){
        orderService.list(2,3);
    }
    @Test
    public void testCount(){
//        QueryWrapper<Order> queryWrapper=new QueryWrapper<Order>();
//        queryWrapper.eq("status","未支付");
//        List<Order> lists=orderMapper.selectList(queryWrapper);
//        for (Order list:lists) {
//            System.out.println(list.getAmount());
//        }
        System.out.println(orderService.amountSum("已支付").getData().toString());
    }
    @Test
    public void testMapper(){
        System.out.println(orderMapper.getAmountSum("已支付"));
    }
    @Test
    public void testWeek(){
        int[] array=new int[7];
        //周对应值加一，星期天为1，星期一为2
        for(int i=1;i<8;i++){
            array[i-1]=orderMapper.getAmountSumByWeek("已支付", i);
        }
        System.out.println("array==========");
        for (int item:array) {
            System.out.println(item);
        }
    }
}
