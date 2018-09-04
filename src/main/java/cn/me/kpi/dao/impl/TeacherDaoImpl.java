package cn.me.kpi.dao.impl;

import cn.me.kpi.dao.ITeacherDao;
import cn.me.kpi.dao.base.impl.BaseDaoImpl;
import cn.me.kpi.domain.TeacherKPI;
import cn.me.kpi.util.PageBean;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeacherDaoImpl extends BaseDaoImpl<TeacherKPI> implements ITeacherDao {

    @Override
    public List<TeacherKPI> findAllKPI() {
        DetachedCriteria criteria = DetachedCriteria.forClass(TeacherKPI.class);
        criteria.add(Restrictions.eq("expire", 0));  // 没有被逻辑删除的kpi记录
        return (List<TeacherKPI>) this.getHibernateTemplate().findByCriteria(criteria);
    }

    @Override
    public List<TeacherKPI> findKPIByUserId(String teacher_id) {
        String hql = "FROM TeacherKPI WHERE teacher_id = ?";
        return (List<TeacherKPI>) this.getHibernateTemplate().find(hql, teacher_id);
    }

    @Override
    public void deleteById(String id) {
        String hql = "UPDATE TeacherKPI as t SET t.expire = "+ 1 +" WHERE t.id = :id";
        Query query = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
        query.setString("id", id);
        query.executeUpdate();
    }

    @Override
    public void updateKPIFileById(String id, String kpiFileName, String dateTime) {
        String hql = "UPDATE TeacherKPI as t SET t.dateTime=:dateTime, t.kpiFilePath=:kpiFilePath WHERE t.id=:id";
        Query query = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);
        query.setString("id", id);
        query.setString("dateTime", dateTime);
        query.setString("kpiFilePath", kpiFileName);
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
