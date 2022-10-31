package com.linyes.service.impl;

import com.linyes.pojo.Payment;
import com.linyes.mapper.PaymentMapper;
import com.linyes.service.PaymentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 支付表（业务数据） 服务实现类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Service
public class PaymentServiceImpl extends ServiceImpl<PaymentMapper, Payment> implements PaymentService {

}
