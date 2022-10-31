package com.linyes.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.linyes.pojo.ScenicSpot;
import com.linyes.mapper.ScenicSpotMapper;
import com.linyes.service.ScenicSpotService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linyes.vo.PageVo;
import com.linyes.vo.SearchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 景点表（初始化数据） 服务实现类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Service
public class ScenicSpotServiceImpl extends ServiceImpl<ScenicSpotMapper, ScenicSpot> implements ScenicSpotService {
    @Autowired
    private ScenicSpotMapper scenicSpotMapper;
    @Override
    public PageVo list(Integer page, Integer size) {
        IPage<ScenicSpot> scenicSpotPage=scenicSpotMapper.selectPage(new Page<>(page,size),null);
        PageVo pageVO=new PageVo();
        pageVO.setData(scenicSpotPage.getRecords());
        pageVO.setTotal(scenicSpotPage.getTotal());
        return pageVO;
    }

    @Override
    public PageVo search(SearchForm searchForm) {
        IPage<ScenicSpot> scenicSpotPage;
        if(searchForm.getKey().equals("")){
            System.out.println("---------------------null--------------------------------"+searchForm);
             scenicSpotPage=scenicSpotMapper.selectPage(new Page<>(searchForm.getPage(),searchForm.getSize()),null);
        }
        else {
            System.out.println("--------------------------you-------------------"+searchForm);
            QueryWrapper<ScenicSpot> queryWrapper=new QueryWrapper<>();
            queryWrapper.like(searchForm.getKey(),searchForm.getValue());
            scenicSpotPage=scenicSpotMapper.selectPage(new Page<>(searchForm.getPage(),searchForm.getSize()),queryWrapper);
        }
        PageVo pageVO=new PageVo();
        pageVO.setData(scenicSpotPage.getRecords());
        pageVO.setTotal(scenicSpotPage.getTotal());
        return pageVO;
    }
}
