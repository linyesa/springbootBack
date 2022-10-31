package com.linyes.controller;

import com.linyes.service.UserService;
import com.linyes.vo.ResultVo;
import com.linyes.vo.RuleForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class LoginController {
    @Autowired
    private UserService userService;
    @GetMapping("/login")
    public ResultVo login(RuleForm ruleForm){
        return userService.login(ruleForm);
    }
}
