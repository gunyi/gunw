package cn.me.kpi.service;

import cn.me.kpi.domain.Function;
import cn.me.kpi.util.PageBean;

import java.util.List;

public interface IFunctionService {

    /**
     * 查询页面目录
     * @return
     */
    List<Function> findMenu();

    /**
     * 分页查询
     * @param pageBean
     */
    void pageQuery(PageBean pageBean);

    /**
     * 查询所有功能点
     * @return
     */
    List<Function> findAll();

    /**
     * 添加功能权限
     * @param model
     */
    void save(Function model);

    /**
     * 查询所有的权限功能
     * @return
     */
    List<Function> findAllFunctions();

    /**
     * 通过用户id查询所对应的权限
     * @param userId
     * @return
     */
    List<Function> findFunctionsByUserId(String userId);
}
