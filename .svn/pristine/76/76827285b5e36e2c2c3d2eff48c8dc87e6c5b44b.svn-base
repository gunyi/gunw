package cn.me.kpi.dao;

import cn.me.kpi.dao.base.IBaseDao;
import cn.me.kpi.domain.Function;

import java.util.List;

public interface IFunctionDao extends IBaseDao<Function> {
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

    /**
     * 从权限表中查询所有的目录
     * @return
     */
    List<Function> findAllMenus();

    /**
     * 从权限表中查询用户对应的目录
     * @param userId
     * @return
     */
    List<Function> findMenuByUserId(String userId);
}
