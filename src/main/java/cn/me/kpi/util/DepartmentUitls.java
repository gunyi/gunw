package cn.me.kpi.util;

import cn.me.kpi.domain.Department;
import cn.me.kpi.service.IDepartmentService;
import cn.me.kpi.service.impl.DepartmentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;

/**
 * 快速获得对应部门的工具
 */
public class DepartmentUitls {

    // 学务处
    public static String SA = "学务处";

    // 教师
    public static String TEACHER = "教师";

    private static IDepartmentService departmentService = new DepartmentServiceImpl();

    public DepartmentUitls() {

    }

   public static Department getDepartment(String code) {
        return departmentService.findDepartmentByName(code);
   }
}
