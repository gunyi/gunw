package cn.me.kpi.domain;// default package

import java.util.HashSet;
import java.util.Set;


/**
 * Academy entity. @author MyEclipse Persistence Tools
 */

public class Academy  implements java.io.Serializable {


    // Fields    

     private String id;
     private String name;
     private String description;
     private Set academyKPIs = new HashSet(0);


    // Constructors

    /** default constructor */
    public Academy() {
    }

    
    /** full constructor */
    public Academy(String name, String description, Set academyKPIs) {
        this.name = name;
        this.description = description;
        this.academyKPIs = academyKPIs;
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

    public Set getAcademyKPIs() {
        return this.academyKPIs;
    }
    
    public void setAcademyKPIs(Set academyKPIs) {
        this.academyKPIs = academyKPIs;
    }



}