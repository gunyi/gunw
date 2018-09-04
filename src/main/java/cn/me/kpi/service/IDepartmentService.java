package cn.me.kpi.service;

import cn.me.kpi.domain.Department;

public interface IDepartmentService {
    /**
     * 通过标号查询部门
     * @param code
     * @return
     */
    Department findDepartmentByName(String code);

}
