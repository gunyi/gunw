package cn.me.kpi.domain;// default package



/**
 * ArchivesKPI entity. @author MyEclipse Persistence Tools
 */

public class ArchivesKPI  implements java.io.Serializable {


    // Fields    

     private String id;
     private Department departmentByFromDepartmentId;
     private Department departmentByToDepartmentId;
     private String score;
     private String evaluate;
    private String entity_auditor_score;
    private int taskId;


    // Constructors

    /** default constructor */
    public ArchivesKPI() {
    }

    
    /** full constructor */
    public ArchivesKPI(Department departmentByFromDepartmentId, Department departmentByToDepartmentId, String score, String evaluate) {
        this.departmentByFromDepartmentId = departmentByFromDepartmentId;
        this.departmentByToDepartmentId = departmentByToDepartmentId;
        this.score = score;
        this.evaluate = evaluate;
    }

   
    // Property accessors

    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public Department getDepartmentByFromDepartmentId() {
        return this.departmentByFromDepartmentId;
    }
    
    public void setDepartmentByFromDepartmentId(Department departmentByFromDepartmentId) {
        this.departmentByFromDepartmentId = departmentByFromDepartmentId;
    }

    public Department getDepartmentByToDepartmentId() {
        return this.departmentByToDepartmentId;
    }
    
    public void setDepartmentByToDepartmentId(Department departmentByToDepartmentId) {
        this.departmentByToDepartmentId = departmentByToDepartmentId;
    }

    public String getScore() {
        return this.score;
    }
    
    public void setScore(String score) {
        this.score = score;
    }

    public String getEvaluate() {
        return this.evaluate;
    }
    
    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
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