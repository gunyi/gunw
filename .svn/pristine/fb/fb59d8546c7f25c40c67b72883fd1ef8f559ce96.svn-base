package cn.me.kpi.dao.impl;

import cn.me.kpi.dao.IDepartmentDao;
import cn.me.kpi.dao.base.impl.BaseDaoImpl;
import cn.me.kpi.domain.Department;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentDaoImpl extends BaseDaoImpl<Department> implements IDepartmentDao {

    @Override
    public Department findDepartmentByName(String name) {
        String hql = "FROM Department(id, name, description, remark) WHERE name = " + name;
        return (Department) this.getHibernateTemplate().find(hql);
    }
}
