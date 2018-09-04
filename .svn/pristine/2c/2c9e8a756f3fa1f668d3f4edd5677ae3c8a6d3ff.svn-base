package cn.me.kpi.service.impl;

import cn.me.kpi.dao.IFunctionDao;
import cn.me.kpi.dao.IRoleDao;
import cn.me.kpi.domain.Function;
import cn.me.kpi.domain.Role;
import cn.me.kpi.service.IRoleService;
import cn.me.kpi.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;
    @Autowired
    private IFunctionDao functionDao;

    @Override
    public void save(Role model, String functionIds) {

        roleDao.save(model);
        for(String id : functionIds.split(",")) {
            Function function = new Function(id);  // 创建一个托管状态的对象
            model.getFunctions().add(function);
        }


//        Set functions = model.getFunctions();
//        for(String id : functionIds.split(",")) {
//            Function function = functionDao.findById(id);
//            functions.add(function);
//        }
//        model.setFunctions(functions);
//        roleDao.save(model);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        roleDao.pageQuery(pageBean);
    }

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }
}
