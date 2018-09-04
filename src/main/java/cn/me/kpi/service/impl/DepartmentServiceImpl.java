package cn.me.kpi.service.impl;

import cn.me.kpi.dao.IDepartmentDao;
import cn.me.kpi.domain.Department;
import cn.me.kpi.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private IDepartmentDao departmentDao;

    @Override
    public Department findDepartmentByName(String code) {
        return departmentDao.findDepartmentByName(code);
    }
}
