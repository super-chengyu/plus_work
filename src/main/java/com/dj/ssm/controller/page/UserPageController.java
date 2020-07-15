package com.dj.ssm.controller.page;

import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 杨承雨
 */
@Controller
@RequestMapping("user")
public class UserPageController {

    @Autowired
    private UserService userService;

    @RequestMapping("toShow")
    private String toShow(){
        return "user/show";
    }

    @RequestMapping("toUpdate")
    private String toUpdate(Integer id, Model model){
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "user/update";
    }

    @RequestMapping("toAdd")
    private String toAdd(){
        return "user/add";
    }

    @RequestMapping("toAdds")
    private String toAdds(){
        return "user/adds";
    }
}
