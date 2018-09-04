package cn.me.kpi.web.action;

import cn.me.kpi.domain.Task;
import cn.me.kpi.model.KPIModel;
import cn.me.kpi.model.LevelOne;
import cn.me.kpi.model.LevelTwo;
import cn.me.kpi.service.ITaskService;
import cn.me.kpi.util.KPIUtils;
import cn.me.kpi.web.action.base.BaseAction;
import com.alibaba.fastjson.JSON;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class TaskAction extends BaseAction<Task> {

    @Autowired
    ITaskService iTaskService;

    @Autowired
    KPIModel kpiModel;

    public String addTask() {
        try {
            iTaskService.addTask(model);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                ServletActionContext.getResponse().getWriter().print(KPIUtils.getJSONString(1, "添加考核任务异常！"));
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        try {
            ServletActionContext.getResponse().getWriter().print(KPIUtils.getJSONString(1, "添加考核任务异常！"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 获取以二级指标为主的kpi内容
     * @return
     */
    public String teacherkpitemp() {
        List<LevelTwo> list = kpiModel.getModel();
        String temp = JSON.toJSONString(list);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/json");
        try {
            response.getWriter().print(temp);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }


    public String delete() {
        try {

        } catch (Exception e) {
            e.printStackTrace();

        }


        return NONE;
    }

    public String deleteBatch() {
        try {
            String ids = ServletActionContext.getRequest().getParameter("ids");
            iTaskService.deleteBatch(ids.split(","));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return LIST;
    }

    /**
     * 用户数据分页查询
     */
    public String pageQuery(){
        iTaskService.pageQuery(pageBean);
        this.java2Json(pageBean, new String[]{});
        return NONE;
    }
}
