package cn.me.kpi.web.action;

import cn.me.kpi.util.KPIFileParser;
import cn.me.kpi.web.action.base.BaseAction;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
@Scope("prototype")
public class KPIAction extends ActionSupport {

    /**
     * 接收教师上传的kpi文件
     * @return
     */
    //属性值，单文件的情况，对应的是upload3.js中的name属性，name属性值为file，此时struts就可以获取到file的文件对象，不需要实例化，struts框架会自动注入对象值，打开调试窗口，
    public File file;
    public void setFile(File file) {
        this.file = file;
    }
    //单文件上传的文件名，spring上传特性，文件名格式为name属性+FileName
    public String fileFileName;
    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }
    //属性值，接收webupload自带的参数
    public String chunk; // 当前第几个分片
    public void setChunk(String chunk) {
        this.chunk = chunk;
    }
    public String chunks;// 总分片个数
    public void setChunks(String chunks) {
        this.chunks = chunks;
    }
    public String size;// 单个文件的总大小
    public void setSize(String size) {
        this.size = size;
    }

    /**
     * 保存kpi文件并给页面回传保存信息
     * @return
     */
    public String saveKPIFile() {
        String kpiType = ServletActionContext.getRequest().getParameter("kpiType");
        // 如果是教师KPI  保存在教师文件夹下
        Map<String, String> info = KPIFileParser.saveKPIFile(file, kpiType);  // info: 保存后回传的信息
        JsonConfig jsonConfig = new JsonConfig();
        //指定哪些属性不需要转json
        jsonConfig.setExcludes(null);
        String json = JSONObject.fromObject(info,jsonConfig).toString();
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        try {
            ServletActionContext.getResponse().getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }
}
