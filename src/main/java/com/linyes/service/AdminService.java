package com.linyes.service;

import com.linyes.pojo.Admin;
import com.baomidou.mybatisplus.extension.service.IService;
import com.linyes.vo.ResultVo;
import com.linyes.vo.RuleForm;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
public interface AdminService extends IService<Admin> {
public ResultVo login(RuleForm ruleForm);
}
