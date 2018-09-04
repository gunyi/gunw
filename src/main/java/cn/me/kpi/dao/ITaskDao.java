package cn.me.kpi.dao;

import cn.me.kpi.dao.base.IBaseDao;
import cn.me.kpi.domain.Task;

import java.util.List;

public interface ITaskDao extends IBaseDao<Task> {
    List<Task> findAll(int status);

    void deleteById(int id);
}
