package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dj.ssm.mapper.UserMapper;
import com.dj.ssm.pojo.ResultModel;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserList;
import com.dj.ssm.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 杨承雨
 */
@RestController
@RequestMapping("/user/")
@CrossOrigin
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    /**
     * 展示列表以及分页
     * @param user
     * @param pageNo
     * @return
     */
    @RequestMapping("show")
    public ResultModel<Object> list (User user, Integer pageNo){
        Map<String, Object> map = new HashMap<String, Object>();
        IPage<User> page = new Page<>(pageNo, user.getPageSize());
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_del",0);
        //性别的条件查询
        if (user.getUserSex() != null){
            queryWrapper.eq("user_sex", user.getUserSex());
        }
        if (user.getUserPhone() != null){
            queryWrapper.like("user_phone", user.getUserPhone());
        }
        if (user.getUserHobby() != null && user.getUserHobby() != ""){
            queryWrapper.eq("user_hobby",user.getUserHobby());
        }
        IPage<User> pageInfo = userService.page(page, queryWrapper);
        map.put("userList",pageInfo.getRecords());
        map.put("pages",pageInfo.getPages());
        return new ResultModel<>().success(map);
    }

    /**
     * 伪删除
     * @param id
     * @param isDel
     * @return
     */
    @RequestMapping("updateDel")
    public ResultModel<Object> updateDel(Integer id, Integer isDel){
        User user = userService.getById(id);
        user.setIsDel(isDel);
        userService.updateById(user);
        return new ResultModel<>().success("删除成功");
    }

    /**
     * 修改
     * @param user
     * @return
     */
    @RequestMapping("update")
    public ResultModel<Object> update(User user){
        userService.updateById(user);
        return new ResultModel<>().success("成功");
    }

    /**
     * 新增
     * @param user
     * @return
     */
    @RequestMapping("add")
    public ResultModel<Object> add(User user){
        user.setIsDel(0);
        userService.save(user);
        return new ResultModel<>().success("ok");
    }

    @RequestMapping("adds")
    public ResultModel<Object> adds(UserList userList){
        List<User> uList = userList.getUserList();
        List<User> list = new ArrayList<>();
        for (User user : uList) {
            list.add(user);
        }
        userService.saveBatch(list);
        return new ResultModel<>().success("ok");
    }

    @RequestMapping("get")
    public ResultModel<Object> get(Integer id){
        User user1 = userService.getById(id);
        return new ResultModel<>().success(user1);
    }
   
}
