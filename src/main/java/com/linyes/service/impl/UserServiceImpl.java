package com.linyes.service.impl;

import com.linyes.pojo.User;
import com.linyes.mapper.UserMapper;
import com.linyes.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linyes.vo.ResultVo;
import com.linyes.vo.RuleForm;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表（业务数据） 服务实现类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Override
    public ResultVo login(RuleForm ruleForm) {
        return null;
    }
}
