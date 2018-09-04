package cn.me.kpi.model;

import java.util.Date;

public class LevelTwo {
    // 二级指标
        private double weight; // 权重
        private String content;  // 二级指标内容
        private String target;  // 目标值
        private double score; // 总分
        private Date completionTime; // 完成时间
        private String dataSource; // 数据来源
        private String gradeStandard; // 评分标准
        private double selfEvaluationScore; // 自评得分
        private double superiorScore; // 直接上级评分

        // 添加一级指标类
        private LevelOne parent = new LevelOne();

    public LevelOne getParent() {
        return parent;
    }

    public void setParent(LevelOne parent) {
        this.parent = parent;
    }

    public double getWeight() {
            return weight;
        }

        public void setWeight(double weight) {
            this.weight = weight;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public String getTarget() {
            return target;
        }

        public void setTarget(String target) {
            this.target = target;
        }

        public double getScore() {
            return score;
        }

        public void setScore(double score) {
            this.score = score;
        }

        public Date getCompletionTime() {
            return completionTime;
        }

        public void setCompletionTime(Date completionTime) {
            this.completionTime = completionTime;
        }

        public String getDataSource() {
            return dataSource;
        }

        public void setDataSource(String dataSource) {
            this.dataSource = dataSource;
        }

        public String getGradeStandard() {
            return gradeStandard;
        }

        public void setGradeStandard(String gradeStandard) {
            this.gradeStandard = gradeStandard;
        }

        public double getSelfEvaluationScore() {
            return selfEvaluationScore;
        }

        public void setSelfEvaluationScore(double selfEvaluationScore) {
            this.selfEvaluationScore = selfEvaluationScore;
        }

        public double getSuperiorScore() {
            return superiorScore;
        }

        public void setSuperiorScore(double superiorScore) {
            this.superiorScore = superiorScore;
        }
}
