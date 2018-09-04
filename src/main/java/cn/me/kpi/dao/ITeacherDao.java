package cn.me.kpi.dao;

import cn.me.kpi.dao.base.IBaseDao;
import cn.me.kpi.domain.TeacherKPI;

import java.util.List;

public interface ITeacherDao extends IBaseDao<TeacherKPI>{
    /**
     * 查询所有教师的KPI信息
     * @return
     */
    List<TeacherKPI> findAllKPI();

    /**
     * 通过教师ID查询相应的KPI
     * @param teacher_id
     * @return
     */
    List<TeacherKPI> findKPIByUserId(String teacher_id);

    /**
     *
     * @param id
     */
    void deleteById(String id);

    void updateKPIFileById(String id, String kpiFileName, String dataTime);
}
