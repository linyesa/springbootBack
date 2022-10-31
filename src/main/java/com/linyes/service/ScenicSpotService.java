package com.linyes.service;

import com.linyes.pojo.ScenicSpot;
import com.baomidou.mybatisplus.extension.service.IService;
import com.linyes.vo.PageVo;
import com.linyes.vo.SearchForm;

/**
 * <p>
 * 景点表（初始化数据） 服务类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
public interface ScenicSpotService extends IService<ScenicSpot> {
    public PageVo list(Integer page,Integer size);
    public PageVo search(SearchForm searchForm);
}
