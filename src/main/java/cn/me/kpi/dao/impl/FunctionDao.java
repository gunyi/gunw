package cn.me.kpi.dao.impl;

import cn.me.kpi.dao.IFunctionDao;
import cn.me.kpi.dao.base.impl.BaseDaoImpl;
import cn.me.kpi.domain.Function;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FunctionDao extends BaseDaoImpl<Function> implements IFunctionDao {

    @Override
    public List<Function> findAllFunctions() {

//        final String sql = "select distinct" +
//                "    function.id as id," +
//                "    function.pid as pid," +
//                "    function.name as name," +
//                "    function.description as description," +
//                "    function.page as page," +
//                "    function.generatemenu as generatemenu," +
//                "    function.zindex as zindex" +
//                "    from" +
//                "        auth_function function" +
//                "    left outer join" +
//                "        role_function rf " +
//                "        on function.id = rf.function_id" +
//                "    left outer join " +
//                "        auth_role role" +
//                "        on role.id = rf.role_id" +
//                "    left outer join " +
//                "        user_role ur" +
//                "        on ur.role_id = role.id" +
//                "    left outer join t_user" +
//                "        on t_user.id = ur.user_id";
//        return this.getHibernateTemplate().execute(new HibernateCallback<List<Function>>() {
//            @Override
//            public List<Function> doInHibernate(Session session) throws HibernateException {
//                SQLQuery sqlQuery = session.createSQLQuery(sql);
//                List result = sqlQuery.list();
//                return (List<Function>) result;
//            }
//        });
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Function.class);
        return (List<Function>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
    }

    @Override
    public List<Function> findFunctionsByUserId(String userId) {
        String hql = "SELECT DISTINCT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.users u WHERE u.id = ?";
        return (List<Function>) this.getHibernateTemplate().find(hql, userId);
    }

    @Override
    public List<Function> findAllMenus() {
        String hql = "FROM Function f WHERE f.generatemenu = '1' ORDER BY f.zindex DESC ";
        return (List<Function>) this.getHibernateTemplate().find(hql);
    }

    @Override
    public List<Function> findMenuByUserId(String userId) {
        String hql = "SELECT DISTINCT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.users u WHERE u.id = ? " +
                " AND f.generatemenu = '1' ORDER BY f.zindex DESC ";
        return (List<Function>) this.getHibernateTemplate().find(hql);
    }
}
