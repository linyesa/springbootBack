package com.linyes.pojo;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 景点表（初始化数据）
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_scenic_spot")
public class ScenicSpot implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键(雪花算法)
     */
    @TableId(value = "id", type = IdType.AUTO)
    private String id;

    /**
     * 景点名称
     */
    private String scenicName;

    /**
     * 景点详细地址
     */
    private String scenicAddress;

    /**
     * 景点描述
     */
    private String scenicDescribe;

    /**
     * 景点图片名称
     */
    private String scenicImage;

    /**
     * 地理经度
     */
    private BigDecimal longitude;

    /**
     * 地理纬度
     */
    private BigDecimal latitude;

    /**
     * 所属省份
     */
    private String prov;


}
