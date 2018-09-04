package cn.me.kpi.domain;// default package

import java.util.HashSet;
import java.util.Set;


/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department  implements java.io.Serializable {


    // Fields    

     private String id;
//     private Department parentDepartment;
     private String name;
     private String description;
     private String remark;

     private Set<User> users = new HashSet<>(0);

    // Constructors

    /** default constructor */
    public Department() {
    }

    public Department(String id) {
        this.id = id;
    }

    
    // Property accessors

    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }










}