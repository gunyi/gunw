package cn.me.kpi.web.action;

import cn.me.kpi.domain.Department;
import cn.me.kpi.domain.TeacherKPI;
import cn.me.kpi.domain.User;
import cn.me.kpi.service.ITeacherKPIService;
import cn.me.kpi.util.KPIUtils;
import cn.me.kpi.util.ExcelParser;
import cn.me.kpi.web.action.base.BaseAction;
import net.sf.json.JSONObject;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
public class TeacherAction extends BaseAction<TeacherKPI> {

    @Autowired
    private ITeacherKPIService teacherKPIService;

    /**
     * 列出所有教师已提交的kpi表格记录
     * @return
     */
    public String list() {

        return NONE;
    }

    public String pageQuery() {
        teacherKPIService.pageQuery(pageBean);

//        List<TeacherKPI> list = teacherKPIService.findKPI();
        this.java2Json(pageBean, new String[]{"users","roles","username","roleNames",
                "password","salary","birthday","gender","station"
                ,"telephone","remark","department","parentDept"});
        return NONE;
    }

    /**
     * 教师上传kpi绩效表并保存到数据库
     * @return
     */
    public String saveKPIFile() {
        String dataTime = ServletActionContext.getRequest().getParameter("dataTime");
        String kpiFileName = ServletActionContext.getRequest().getParameter("kpiFileName");
        JSONObject json = new JSONObject();
        json.put("code","1");  //默认成功
        try{
            kpiFileName = kpiFileName.replaceAll("\\\\", "~");
            // 将本次提交的信息写入数据库
            User user = KPIUtils.getLoginUser();
            TeacherKPI kpi = new TeacherKPI();
            kpi.setTeacher(user);
            // 默认教师提交的kpi需要学务处的人批改
            Department department = new Department("1");
            kpi.setScoreDepartment(department);
            kpi.setKpiFilePath(kpiFileName);
            kpi.setDateTime(dataTime);
            teacherKPIService.save(kpi);
        } catch (Exception ex) {
            json.put("code", "0");
            // rollback
            File file = new File(kpiFileName);
            if (file.exists()) {
                file.delete();
            }
            ex.printStackTrace();
        }
        try {
            // 回传信息
            ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
            ServletActionContext.getResponse().getWriter().print(json.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 重新上传kpi绩效表
     * 教师修改自己的kpi绩效表
     * @return
     */
    public String updateKPIFile() {
        String id = ServletActionContext.getRequest().getParameter("id");
        String dataTime = ServletActionContext.getRequest().getParameter("dataTime");
        String kpiFileName = ServletActionContext.getRequest().getParameter("kpiFileName");
        JSONObject json = new JSONObject();
        json.put("code","1");  //默认成功
        try{
            // 将本次提交的信息写入数据库
            // 默认教师提交的kpi需要学务处的人批改
//            model.setId(id);
//            Department department = new Department("1");
//            model.setScoreDepartment(department);
//            model.setKpiFilePath(kpiFileName);
//            model.setDate(dataTime);
            teacherKPIService.updateKPIFileById(id, kpiFileName, dataTime);
        } catch (Exception ex) {
            json.put("code", "0");
            // rollback
            File file = new File(kpiFileName);
            if (file.exists()) {
                file.delete();
            }
            ex.printStackTrace();
        }
        try {
            // 回传信息
            ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
            ServletActionContext.getResponse().getWriter().print(json.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    /**
     * 处理教师的kpi文件并回显至页面
     */
    public String lookXls() {
        return "table";
    }


    /**
     * 回传解析后的kpi的信息
     * type: json
     */
    public String checkXls() {
        try {
            String kpiFileUrl = ServletActionContext.getRequest().getParameter("kpiFileUrl");
            String kpiFilePath = kpiFileUrl.replaceAll("~","\\\\");
            Map<String, String> teacherExcelContentMap = ExcelParser.getTeacherExcelContentMap(new File(kpiFilePath), ExcelParser.TYPE_TEACHER);
            this.java2Json(teacherExcelContentMap,null);
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        }catch (FileNotFoundException ffe) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("error", "filenotfound");
            ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
            try {
                ServletActionContext.getResponse().getWriter().print(jsonObject.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }


    /**
     * 根据id删除教师的一条kpi记录
     * 逻辑删除
     */
    public String delete() {
        String id = ServletActionContext.getRequest().getParameter("id");
        teacherKPIService.delete(id);
        return MANAGE;
    }
}
