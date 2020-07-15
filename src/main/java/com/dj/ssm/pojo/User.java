package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author 杨承雨
 */
@Data
@TableName("user")
public class User {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String userName;

    private String userPwd;

    private String userAge;

    private String userSex;

    private String userPhone;

    private String userHobby;

    @TableField(exist = false)
    private String hobbyShow;

    public String getHobbyShow() {
        String hobby = userHobby;
        String[] hb = hobby.split(",");
        String hobbys = "";
        for (int i = 0; i < hb.length; i++) {
            if (hb[i].equals("1")){
                hobbys += "羽毛球,";
            }
            if (hb[i].equals("2")){
                hobbys += "乒乓球,";
            }
            if (hb[i].equals("3")){
                hobbys += "钢丝球,";
            }
            if (hb[i].equals("23")){
                hobbys += "玻璃球,";
            }
        }
        return hobbys.substring(0,hobbys.length()-1);
    }

    public void setHobbyShow(String hobbyShow) {
        this.hobbyShow = hobbyShow;
    }

    private Integer isDel;

    @TableField(exist = false)
    private Integer pageSize = 2;
}
