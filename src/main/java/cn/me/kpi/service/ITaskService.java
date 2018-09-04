package cn.me.kpi.service;

import cn.me.kpi.domain.Task;
import cn.me.kpi.util.PageBean;

import java.util.List;

public interface ITaskService {

    List<Task> findAll(int status);

    void addTask(Task task);

    /**
     * 分页查询
     * @param pageBean
     */
    void pageQuery(PageBean pageBean);

    void delete(Task task);

    /**
     * 批量删除
     * @param ids
     */
    void deleteBatch(String[] ids);
}
