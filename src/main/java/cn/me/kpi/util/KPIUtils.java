package cn.me.kpi.util;

import javax.servlet.http.HttpSession;

import cn.me.kpi.domain.User;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;


/**
 * BOS项目的工具类
 * @author zhaoqx
 *
 */
public class KPIUtils {
	//获取session对象
	public static HttpSession getSession(){
		return ServletActionContext.getRequest().getSession();
	}
	//获取登录用户对象
	public static User getLoginUser(){
		return (User) getSession().getAttribute("loginUser");
	}

	public static String getJSONString(int code) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", code);
        return jsonObject.toString();
    }

	public static String getJSONString(int code, String msg) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", code);
        jsonObject.put("msg", msg);
        return jsonObject.toString();
    }

    public static void writeToPage(int code) throws IOException {
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(getJSONString(code));
    }

    public static void writeToPage(int code, String msg) throws IOException {
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().print(getJSONString(code, msg));
    }
}
