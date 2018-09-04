package cn.me.kpi.web.action;

import cn.me.kpi.domain.Role;
import cn.me.kpi.service.IRoleService;
import cn.me.kpi.web.action.base.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<Role> {
    @Autowired
    private IRoleService roleService;

    private String functionIds;  // 接收传来的权限参数
    public void setFunctionIds(String functionIds) {
        this.functionIds = functionIds;
    }

    public String add() {
        roleService.save(model, functionIds);
        return LIST;
    }

    /**
     * 查询所有角色
     * @return
     */
    public String listajax() {
        List<Role> list =  roleService.findAll();
        this.java2Json(list, new String[]{"functions","users"});
        return NONE;
    }

    // 分页查询
    public String pageQuery() {
        roleService.pageQuery(pageBean);
        this.java2Json(pageBean, new String[]{"functions","users"});
        return NONE;
    }
}
