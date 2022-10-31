package com.linyes.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linyes.pojo.Admin;
import com.linyes.mapper.AdminMapper;
import com.linyes.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linyes.vo.ResultVo;
import com.linyes.vo.RuleForm;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {
    @Override
    public ResultVo login(RuleForm ruleForm) {
        ResultVo resultVo=new ResultVo();
        QueryWrapper<Admin> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("admin_username",ruleForm.getUsername());
        Admin admin=(Admin) this.getOne(queryWrapper);
        if(admin==null){
            resultVo.setCode(-1);
            return resultVo;
        }
        if(!admin.getAdminPassword().equals(ruleForm.getPassword())){
            resultVo.setCode(-2);
            return resultVo;
        }
        resultVo.setData(ruleForm);
        resultVo.setCode(0);
        return resultVo;
    }
}
