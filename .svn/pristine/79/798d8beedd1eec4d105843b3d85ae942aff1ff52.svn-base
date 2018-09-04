package cn.me.kpi.util;

import org.apache.struts2.ServletActionContext;
import org.springframework.util.FileCopyUtils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class KPIFileParser {

    public static  Map<String, String> saveKPIFile(File file, String kpiType) {
        Map<String, String> info = new HashMap<>();
        String result = "";
        String code = "1"; // 默认成功
        String kpiFileName = "";
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
        String dateString = sdf.format(date);  // kpi文件传上来的时间
        File dir = null;
        // 根据不同的kpi类型选择保存在不同的文件夹下
        if("teacher".equals(kpiType)) {
            dir = new File("H:"+File.separator+"kpifile"+File.separator+"teacherkpi");
        }else if("savety".equals(kpiType)) {

        }
        if(dir != null && !dir.exists()) {
            dir.mkdirs();
        }
        try{
            String type = ServletActionContext.getRequest().getParameter("type");
            // 兼容新版excel和2007年版的excel
            if (!type.contains("excel") && !type.contains("vnd.openxmlformats-officedocument")) {
                // 不是Excel类型   不接受
                result = "传输的文件不是Excel类型";
                throw new IOException("传输的文件不是Excel类型");
            }
            if(dir != null) {
                kpiFileName = dir.getCanonicalPath() + File.separator + dateString + ".xls";  // 拼接文件名  用‘$’代替‘\\’
                FileCopyUtils.copy(file, new File(kpiFileName));
                kpiFileName = kpiFileName.replaceAll("\\\\", "~");
            }
            info.put("kpiFileName", kpiFileName);
            info.put("dataTime", dateString);
            info.put("code", code);
            info.put("result", result);
        }catch (Exception e) {
            e.printStackTrace();
            code = "0";
            info.put("code", code);
            info.put("dataTime", dateString);
            info.put("result", result);
        }
        return info;
    }
}
