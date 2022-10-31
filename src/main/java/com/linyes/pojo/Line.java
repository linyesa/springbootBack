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
 * 景点线路表（初始化数据）
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_line")
public class Line implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键(雪花算法)
     */
    @TableId(value = "id", type = IdType.AUTO)
    private String id;

    /**
     * 线路名称
     */
    private String lineName;

    /**
     * 线路分类
     */
    private String lineCategory;

    /**
     * 线路分类排序
     */
    private Integer sort;

    /**
     * 线路价格
     */
    private BigDecimal lineAmount;

    /**
     * 线路图片
     */
    private String img;

    /**
     * 线路备注
     */
    private String remark;


}
