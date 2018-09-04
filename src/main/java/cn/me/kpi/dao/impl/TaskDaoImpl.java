package cn.me.kpi.dao.impl;

import cn.me.kpi.dao.ITaskDao;
import cn.me.kpi.dao.base.impl.BaseDaoImpl;
import cn.me.kpi.domain.Task;
import cn.me.kpi.util.PageBean;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TaskDaoImpl extends BaseDaoImpl<Task> implements ITaskDao {

    public List<Task> findAll(int status) {
        String sql = "FROM Task WHERE status = ?";
        List<Task> list = (List<Task>) this.getHibernateTemplate().find(sql, status);
        return list;
    }

    @Override
    public void deleteById(int id) {
        String hql = "UPDATE Task as t SET t.expire = "+ 1 +" WHERE t.id = :id";
        Query query = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
        query.setInteger("id", id);
        query.executeUpdate();
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        DetachedCriteria criteria = pageBean.getDetachedCriteria();
        criteria.add(Restrictions.eq("expire", 0));
        pageBean.setDetachedCriteria(criteria);
        super.pageQuery(pageBean);
    }
}
