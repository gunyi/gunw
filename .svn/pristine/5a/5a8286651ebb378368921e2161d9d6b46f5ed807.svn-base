package cn.me.kpi.service;

import cn.me.kpi.domain.Role;
import cn.me.kpi.util.PageBean;

import java.util.List;

public interface IRoleService {
    /**
     * 为角色添加权限
     * @param model
     * @param functionIds
     */
    void save(Role model, String functionIds);

    /**
     * 分页查询
     * @param pageBean
     */
    void pageQuery(PageBean pageBean);

    /**
     * 查询所有角色
     * @return
     */
    List<Role> findAll();

}
