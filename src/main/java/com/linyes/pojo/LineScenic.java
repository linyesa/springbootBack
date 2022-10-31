package com.linyes.pojo;

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
 * 线路景点关系表（初始化数据）
 * </p>
 *
 * @author linyes
 * @since 2022-10-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_line_scenic")
public class LineScenic implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键(雪花算法)
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 线路id
     */
    private Long lineId;

    /**
     * 景点id
     */
    private Long scenicId;

    /**
     * 景点次序
     */
    private Integer sort;

    /**
     * 前往时间
     */
    private String goTime;


}
