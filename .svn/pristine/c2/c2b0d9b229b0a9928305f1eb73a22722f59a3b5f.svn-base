package cn.me.kpi.web.action;

import cn.me.kpi.domain.Function;
import cn.me.kpi.service.IFunctionService;
import cn.me.kpi.web.action.base.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
public class FunctionAction extends BaseAction<Function> {

    @Autowired
    private IFunctionService functionService;
    // 根据权限给角色展示菜单列表
    public String findMenu() {
        List<Function> list = functionService.findMenu();
        this.java2Json(list, new String[]{"roles", "children", "parentFunction"});
        return NONE;
    }

    // 添加功能权限
    public String add() {
        functionService.save(model);
        return LIST;
    }

    // 查询所有功能点
    public String listajax() {
        List<Function> list = functionService.findMenu();
        this.java2Json(list, new String[]{"roles","children","parentFunction"});
        return NONE;
    }

    /**
     * 用户数据分页查询
     */
    public String pageQuery(){
        // 由于page重名导致被误封装到model中 导致pageBean中的CurrentPage为空
        String page = model.getPage();
        pageBean.setCurrentPage(Integer.parseInt(page));
        functionService.pageQuery(pageBean);
        this.java2Json(pageBean, new String[]{"roles","children","parentFunction"});
        return NONE;
    }
}
