package cn.me.kpi.model;

import java.util.HashSet;
import java.util.Set;

// 一级指标
public class LevelOne {
    private String id;
    private String name; // 一级指标名称
    private double weight; // 一级指标权重
    Set<LevelTwo> levelTwoSet = new HashSet<>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public Set<LevelTwo> getLevelTwoSet() {
        return levelTwoSet;
    }

    public void setLevelTwoSet(Set<LevelTwo> levelTwoSet) {
        this.levelTwoSet = levelTwoSet;
    }
}
