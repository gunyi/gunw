package cn.me.kpi.service.impl;

import cn.me.kpi.dao.ITaskDao;
import cn.me.kpi.domain.Task;
import cn.me.kpi.service.ITaskService;
import cn.me.kpi.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TaskServiceImpl implements ITaskService {

    @Autowired
    ITaskDao taskDao;
    @Override
    public List<Task> findAll(int status) {
        return taskDao.findAll(status);
    }

    @Override
    public void addTask(Task task) {
        taskDao.save(task);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        taskDao.pageQuery(pageBean);
    }

    @Override
    public void delete(Task task) {
        taskDao.delete(task);
    }

    @Override
    public void deleteBatch(String[] ids) {
        for (String id : ids) {
            taskDao.deleteById(Integer.parseInt(id));
        }
    }
}
