package com.linyes.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linyes.pojo.User;
import com.linyes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户表（业务数据） 前端控制器
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
@GetMapping("test")
    public void test(){
    System.out.println(userService);
    QueryWrapper<User> wrapper=new QueryWrapper<>();
    wrapper.eq("id","95441036616138752");

    User user =userService.getOne(wrapper);
    System.out.println(userService);

}
}

