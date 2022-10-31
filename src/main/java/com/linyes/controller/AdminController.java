package com.linyes.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linyes.pojo.Admin;
import com.linyes.pojo.ScenicSpot;
import com.linyes.pojo.User;
import com.linyes.service.AdminService;
import com.linyes.service.ScenicSpotService;
import com.linyes.service.UserService;
import com.linyes.utils.ResultVOUtil;
import com.linyes.utils.ScenicUtil;
import com.linyes.vo.ResultVo;
import com.linyes.vo.RuleForm;
import com.linyes.vo.Scenic;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.tomcat.util.net.jsse.JSSEUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public ResultVo login(RuleForm ruleForm){
        return adminService.login(ruleForm);
    }
    @PostMapping("/register")
    public ResultVo register(@RequestBody RuleForm ruleForm){
        System.out.println(ruleForm);
        Admin admin=new Admin();
        admin.setAdminUsername(ruleForm.getUsername());
        admin.setAdminPassword(ruleForm.getPassword());
        boolean save=adminService.save(admin);
        if(!save){
            return ResultVOUtil.fail();
        }
        return ResultVOUtil.success(null);
    }
    @GetMapping("checkbyname/{username}")
    public ResultVo checkByName(@PathVariable String username){
        System.out.println("------------------------"+username);
        QueryWrapper<Admin> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("admin_username",username);
        if(adminService.getOne(queryWrapper)!=null){
            System.out.println("ture");
            return ResultVOUtil.success(null);
        }
        else {
            System.out.println("false");
            return ResultVOUtil.fail();
        }

    }

}

