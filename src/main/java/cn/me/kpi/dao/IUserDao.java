package cn.me.kpi.dao;


import cn.me.kpi.dao.base.IBaseDao;
import cn.me.kpi.domain.User;

import java.util.List;

public interface IUserDao extends IBaseDao<User> {

	public User findUserByUsernameAndPassword(String username, String password);

	public User findUserByUsername(String username);

    List<User> findAllWithoutMe();
}
