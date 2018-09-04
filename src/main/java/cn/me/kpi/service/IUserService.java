package cn.me.kpi.service;

import cn.me.kpi.domain.User;
import cn.me.kpi.util.PageBean;

import java.util.List;

public interface IUserService {

	public User login(User model);

	public void editPassword(String id, String password);

	public void save(User model, String[] roleIds);

	public void pageQuery(PageBean pageBean);

	public List<User> findAll();

	public List<User> findAllWithoutMe();

}
