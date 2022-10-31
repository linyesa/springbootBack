package com.linyes.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.linyes.pojo.Line;
import com.linyes.mapper.LineMapper;
import com.linyes.pojo.ScenicSpot;
import com.linyes.service.LineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linyes.vo.PageVo;
import com.linyes.vo.SearchForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 景点线路表（初始化数据） 服务实现类
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Service
public class LineServiceImpl extends ServiceImpl<LineMapper, Line> implements LineService {
    @Autowired
    private LineMapper lineMapper;
    @Override
    public PageVo search(SearchForm searchForm) {
        IPage<Line> linePage;
        if(searchForm.getKey().equals("")){
            System.out.println("---------------------null--------------------------------"+searchForm);
            linePage=lineMapper.selectPage(new Page<>(searchForm.getPage(),searchForm.getSize()),null);        }
        else {
            System.out.println("--------------------------you-------------------"+searchForm);
            QueryWrapper<Line> queryWrapper=new QueryWrapper<>();
            queryWrapper.like(searchForm.getKey(),searchForm.getValue());
            linePage=lineMapper.selectPage(new Page<>(searchForm.getPage(),searchForm.getSize()),queryWrapper);
        }
        PageVo pageVO=new PageVo();
        pageVO.setData(linePage.getRecords());
        pageVO.setTotal(linePage.getTotal());
        return pageVO;
    }

    @Override
    public PageVo list(Integer page, Integer size) {
        IPage<Line> lineIPage=lineMapper.selectPage(new Page<>(page,size),null);
        PageVo pageVO=new PageVo();
        pageVO.setData(lineIPage.getRecords());
        pageVO.setTotal(lineIPage.getTotal());
        return pageVO;
    }
}
