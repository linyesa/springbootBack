package com.example.demo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.linyes.DemoApplication;
import com.linyes.mapper.ScenicSpotMapper;
import com.linyes.pojo.*;
import com.linyes.service.AdminService;
import com.linyes.service.LineService;
import com.linyes.service.ScenicSpotService;
import com.linyes.service.UserService;
import com.linyes.vo.Scenic;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.math.BigDecimal;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = DemoApplication.class)
@MapperScan("com.linyes.mapper")
public class DbTest {
    @Resource
    private UserService userService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private ScenicSpotService scenicSpotService;
    @Autowired
    private ScenicSpotMapper scenicSpotMapper;
    @Autowired
    private LineService lineService;
    @Test
    public void test(){
        System.out.println("test");
        QueryWrapper<User> wrapper=new QueryWrapper<>();
        wrapper.eq("id","95441036616138752");
        User user =userService.getOne(wrapper);
        System.out.println(userService);
    }
    @Test
    public void test1(){
        System.out.println("test1");
        Admin admin=new Admin();
        admin.setAdminId(2);
        admin.setAdminUsername("lysaa");
        admin.setAdminPassword("123");
        adminService.save(admin);
    }
    @Test
    public void testQuery(){
        System.out.println("query");
        String username="lysa";
        QueryWrapper<Admin> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("admin_username","lys");
        Admin admin=adminService.getOne(queryWrapper);
        System.out.println(admin);
    }
    @Test
    public void testSave(){
        System.out.println("save");
        ScenicSpot scenic=new ScenicSpot();
        scenic.setScenicAddress("cq");
        scenic.setScenicDescribe("bz");
        scenic.setScenicImage("img");
        scenic.setScenicName("name");
        scenic.setLatitude(new BigDecimal("123"));
        scenic.setLongitude(new BigDecimal("456"));
        scenic.setProv("bn");
//        scenicSpotService.save(scenic);
        System.out.println(scenic);
    }
    @Test
    public void testFindAll(){
        QueryWrapper<ScenicSpot> queryWrapper=new QueryWrapper<>();
        System.out.println(scenicSpotService.list(queryWrapper));
    }
    @Test
    public void pagetest(){
        int page=1;
        int size=3;
        IPage<ScenicSpot> scenicSpotPage=scenicSpotMapper.selectPage(new Page<>(page,size),null);
        System.out.println("数据："+scenicSpotPage.getRecords());
        System.out.println("总数："+scenicSpotPage.getTotal()+"总页数:"+scenicSpotPage.getPages()+"当前页："+scenicSpotPage.getCurrent()+"每页多少个："+scenicSpotPage.getSize());

    }
    @Test
    public void findById(){
        System.out.println(scenicSpotService.getById("95839783787429888"));
    }
    @Test
    public void testchange(){

        ScenicSpot scenic=new ScenicSpot();
        scenic.setScenicAddress("cq");
        scenic.setScenicDescribe("bz");
        scenic.setScenicImage("img");
        scenic.setScenicName("name");
        scenic.setLatitude(new BigDecimal("123"));
        scenic.setLongitude(new BigDecimal("456"));
        scenic.setProv("bn");
        scenic.setId("95839783787429896");
//        scenicSpotService.saveOrUpdate(scenic);
        System.out.println(scenicSpotService.updateById(scenic));
    }
    @Test
    public void testRegister(){
        Admin admin=new Admin();
        admin.setAdminId(2);
        admin.setAdminUsername("tqn");
        admin.setAdminPassword("123456");
        adminService.save(admin);
    }
    @Test
    public void checkByName(){
        String name="lys";
        QueryWrapper<Admin> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("admin_username",name);
       if(adminService.getOne(queryWrapper)!=null){
           System.out.println("you");
       }else{
           System.out.println("null");
       }

    }
    @Test
    public void deleteById(){
        String id ="95839783787429895";
        //成功返回1.失败返回0，id为空返回0
        int flag=scenicSpotMapper.deleteById(id);
        if(flag==0){
            System.out.println("0");
        }
        else if(flag==1){
            System.out.println("1");
        }
        System.out.println(flag);

    }
@Test
    public void testLineSave(){
    Line line =new Line();
    line.setLineAmount(new BigDecimal(100));
    line.setLineName("test");
    line.setLineCategory("cato");
    line.setImg("img");
    line.setRemark("remark");
    line.setSort(2);
    lineService.save(line);
}
@Test
    public void testLinePage(){
    System.out.println(lineService.list(2, 3));
}
}
