package com.linyes.service;

import com.linyes.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.linyes.vo.ResultVo;
import com.linyes.vo.RuleForm;

/**
 * <p>
 * 用户表（业务数据） 服务类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */

public interface UserService extends IService<User> {
    public ResultVo login(RuleForm ruleForm);
}
