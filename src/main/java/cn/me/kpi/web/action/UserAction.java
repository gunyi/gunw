package cn.me.kpi.web.action;

import java.io.IOException;
import java.util.List;

import cn.me.kpi.domain.User;
import cn.me.kpi.service.IUserService;
import cn.me.kpi.util.KPIUtils;
import cn.me.kpi.util.MD5Utils;
import cn.me.kpi.web.action.base.BaseAction;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {
	//属性驱动，接收页面输入的验证码
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	
	@Autowired
	private IUserService userService;
	
	/**
	 * 用户登录,使用shiro框架提供的方式进行认证操作
	 */
	public String login_shiro(){
		//从Session中获取生成的验证码
		String validatecode = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
		//校验验证码是否输入正确
		if(StringUtils.isNotBlank(checkcode) && checkcode.equals(validatecode)){
			//使用shiro框架提供的方式进行认证操作
			Subject subject = SecurityUtils.getSubject();//获得当前用户对象,状态为“未认证”
			AuthenticationToken token = new UsernamePasswordToken(model.getUsername(),MD5Utils.md5(model.getPassword()));//创建用户名密码令牌对象
			try{
				subject.login(token);
			}catch (IncorrectCredentialsException incorrectCredentialsException) {
			    // 密码错误
                this.addActionError("输入的密码错误！");
                return LOGIN;
            }catch (UnknownAccountException unknownAccountException) {
                // 用户不存在！
                this.addActionError("当前登录用户不存在！");
                return LOGIN;
            } catch(Exception e) {
				e.printStackTrace();
				return LOGIN;
			}
			User user = (User) subject.getPrincipal();  // 从本地线程中拿到User 存入Session
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
			return HOME;
		}else{
			//输入的验证码错误,设置提示信息，跳转到登录页面
			this.addActionError("输入的验证码错误！");
			return LOGIN;
		}
	}
	
	/**
	 * 用户登录
	 */
	public String login_base(){
		//从Session中获取生成的验证码
		String validatecode = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
		//校验验证码是否输入正确
		if(StringUtils.isNotBlank(checkcode) && checkcode.equals(validatecode)){
			//输入的验证码正确
			User user = userService.login(model);
			if(user != null){
				//登录成功,将user对象放入session，跳转到首页
				ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
				return HOME;
			}else{
				//登录失败，,设置提示信息，跳转到登录页面
				//输入的验证码错误,设置提示信息，跳转到登录页面
				this.addActionError("用户名或者密码输入错误！");
				return LOGIN;
			}
		}else{
			//输入的验证码错误,设置提示信息，跳转到登录页面
			this.addActionError("输入的验证码错误！");
			return LOGIN;
		}
	}

	// 查询所有用户
	public String findAll(){
        List<User> userList = userService.findAll();
        this.java2Json(userList, new String[]{"department", "parentDept", "roles"});
        return null;
    }

    // 查询所有用户排除自己
    public String findAllWithoutMe(){
        List<User> userList = userService.findAllWithoutMe();
        this.java2Json(userList, new String[]{"password", "department", "parentDept", "roles"});
        return null;
    }
	/**
	 * 用户注销
	 */
	public String logout(){
		ServletActionContext.getRequest().getSession().invalidate();
		return LOGIN;
	}
	
	/**
	 * 修改当前用户密码
	 * @throws IOException 
	 */
	public String editPassword() throws IOException{
		String f = "1";
		//获取当前登录用户
		User user = KPIUtils.getLoginUser();
		try{
			userService.editPassword(user.getId(),model.getPassword());
		}catch(Exception e){
			f = "0";
			e.printStackTrace();
		}
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		ServletActionContext.getResponse().getWriter().print(f);
		return NONE;
	}
	
	//属性驱动，接收多个角色id
	private String[] roleIds;
	public void setRoleIds(String[] roleIds) {
		this.roleIds = roleIds;
	}
	
	/**
	 * 添加用户
	 */
	public String add(){
		userService.save(model,roleIds);
		return LIST;
	}

	/**
	 * 用户数据分页查询
	 */
	public String pageQuery(){
		userService.pageQuery(pageBean);
		this.java2Json(pageBean, new String[]{"noticebills","roles"});
		return NONE;
	}
}
