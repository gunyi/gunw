package cn.me.kpi.service.impl;

import cn.me.kpi.dao.ITeacherDao;
import cn.me.kpi.domain.TeacherKPI;
import cn.me.kpi.domain.User;
import cn.me.kpi.service.ITeacherKPIService;
import cn.me.kpi.util.KPIUtils;
import cn.me.kpi.util.PageBean;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TeacherKPIServiceImpl implements ITeacherKPIService{

    @Autowired
    private ITeacherDao teacherDao;

    @Override
    public List<TeacherKPI> findKPI() {
        List<TeacherKPI> list;
        User user = KPIUtils.getLoginUser();
        if(user.getUsername().equals("admin")) {
            list = teacherDao.findAllKPI();
        }else {
            list = teacherDao.findKPIByUserId(user.getId());
        }
        return list;
    }

    @Override
    public void save(TeacherKPI kpi) {
        teacherDao.save(kpi);
    }

    @Override
    public void delete(String id) {
        teacherDao.deleteById(id);
    }

    @Override
    public void pageQuery(PageBean pageBean) {
        teacherDao.pageQuery(pageBean);
    }

    @Override
    public void updateKPIFileById(String id, String kpiFileName, String dataTime) {
        teacherDao.updateKPIFileById(id, kpiFileName, dataTime);
    }
}
