package cn.me.kpi.dao.impl;

import java.util.List;

import cn.me.kpi.dao.IUserDao;
import cn.me.kpi.dao.base.impl.BaseDaoImpl;
import cn.me.kpi.domain.User;
import cn.me.kpi.util.KPIUtils;
import org.springframework.stereotype.Repository;


@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {
	/**
	 * 根据用户名和密码查询用户
	 */
	public User findUserByUsernameAndPassword(String username, String password) {
		String hql = "FROM User u WHERE u.username = ? AND u.password = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, username,password);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	public User findUserByUsername(String username) {
		String hql = "FROM User u WHERE u.username = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, username);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

    @Override
    public List<User> findAllWithoutMe() {
        User loginUser = KPIUtils.getLoginUser();
        String hql = "FROM User u WHERE u.id != ?";
        List<User> list = (List<User>) this.getHibernateTemplate().find(hql, loginUser.getId());
        return list;
    }
}
