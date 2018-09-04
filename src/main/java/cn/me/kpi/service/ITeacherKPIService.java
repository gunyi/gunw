package cn.me.kpi.service;

import cn.me.kpi.domain.TeacherKPI;
import cn.me.kpi.util.PageBean;

import java.util.List;

/**
 * 教师KPI服务
 */
public interface ITeacherKPIService {

    /**
     * 查询教师kpi详情信息
     * @return
     */
    List<TeacherKPI> findKPI();

    /**
     * 保存教师提交的绩效信息
     * @param kpi
     */
    void save(TeacherKPI kpi);

    /**
     * 根据id删除教师的一条kpi记录
     * 逻辑删除
     * @param id
     */
    void delete(String id);

    void pageQuery(PageBean pageBean);

    /**
     * 通过id更新kpi绩效表
     * @param id
     * @param kpiFileName
     */
    void updateKPIFileById(String id, String kpiFileName, String dataTime);
}
