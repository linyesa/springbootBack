package com.linyes.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class Scenic {
    private String scenicname;
    private String scenicaddress;
    private String scenicdescribe;
    private String scenicimage;
    private BigDecimal longitude;
    private BigDecimal latitude;
    private String prov;
}
