package cn.me.kpi.domain;// default package



/**
 * AcademyKPI entity. @author MyEclipse Persistence Tools
 */

public class AcademyKPI  implements java.io.Serializable {


    // Fields    

     private String id;
     private Academy academy;
     private Department department;
     private Integer score;
     private String evaluate;
    private String entity_auditor_score;
    private int taskId;


    // Constructors

    /** default constructor */
    public AcademyKPI() {
    }

    
    /** full constructor */
    public AcademyKPI(Academy academy, Department department, Integer score, String evaluate) {
        this.academy = academy;
        this.department = department;
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

    public Academy getAcademy() {
        return this.academy;
    }
    
    public void setAcademy(Academy academy) {
        this.academy = academy;
    }

    public Department getDepartment() {
        return this.department;
    }
    
    public void setDepartment(Department department) {
        this.department = department;
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