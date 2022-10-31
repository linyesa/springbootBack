package com.linyes.utils;

import com.linyes.vo.ResultVo;

public class ResultVOUtil {
    public static ResultVo success(Object object){
        ResultVo resultVo=new ResultVo();
        resultVo.setCode(0);
        resultVo.setData(object);
        return resultVo;
    }
    public static ResultVo fail(){
        ResultVo resultVo=new ResultVo();
        resultVo.setCode(-1);
        return resultVo;
    }
}
