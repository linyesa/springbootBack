package com.linyes.vo;

import lombok.Data;

@Data
public class ResultVo<T>{
    private Integer code;
    private T data;
}
