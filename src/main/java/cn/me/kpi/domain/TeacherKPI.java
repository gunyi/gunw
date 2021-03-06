package cn.me.kpi.domain;// default package


import java.sql.Timestamp;

/**
 * TeacherKPI entity.
 */

public class TeacherKPI  implements java.io.Serializable {

    // Fields

    private String id;  // 教师id
    private Department scoreDepartment; // 打分部门  暂时设定
    private User teacher;
    private Integer score;
    private String evaluate;
    private User parentUser;   // 打分人（上级）
    private String description;
    private String kpiFilePath; // 上传的kpi文件的路径
    private String dateTime;  // 提交时间or修改时间
    private int expire = 0;
    private String entity_auditor_score;
    private int taskId;


    // Constructors

    /** default constructor */
    public TeacherKPI() {
    }

    
    /** full constructor */
    public TeacherKPI(Department scoreDepartment, User teacher, Integer score, String evaluate, User parentUser, String description) {
        this.scoreDepartment = scoreDepartment;
        this.teacher = teacher;
        this.score = score;
        this.evaluate = evaluate;
        this.parentUser = parentUser;
        this.description = description;
    }

   
    // Property accessors

    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public Department getScoreDepartment() {
        return scoreDepartment;
    }

    public void setScoreDepartment(Department scoreDepartment) {
        this.scoreDepartment = scoreDepartment;
    }


    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    public Integer getScore() {
        return this.score;
    }
    
    public void setScore(Integer score) {
        this.score = score;
    }

    public String getEvaluate() {
        return this.evaluate;
    }
    
    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public User getParentUser() {
        return parentUser;
    }

    public void setParentUser(User parentUser) {
        this.parentUser = parentUser;
    }

    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }


    public String getKpiFilePath() {
        return kpiFilePath;
    }

    public void setKpiFilePath(String kpiFilePath) {
        this.kpiFilePath = kpiFilePath;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public int getExpire() {
        return expire;
    }

    public void setExpire(int expire) {
        this.expire = expire;
    }

    public String getEntity_auditor_score() {
        return entity_auditor_score;
    }

    public void setEntity_auditor_score(String entity_auditor_score) {
        this.entity_auditor_score = entity_auditor_score;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }
}