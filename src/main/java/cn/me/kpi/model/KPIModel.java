package cn.me.kpi.model;


import cn.me.kpi.util.TimeUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.IOUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Service
@Scope(value = "singleton")
public class KPIModel {

//    private Map<String, LevelOne> map = new HashMap<>();
    private List<LevelOne> levelOneList = new ArrayList<>();
    private List<LevelTwo> levelTwoList = new ArrayList<>();

    public static final int TYPE_TEACHER = 1;  // 教师

    public static final int TYPE_SAFETY = 2;  // 安全

    public static final int TYPE_DEPARTMENT = 3;  // 部门

    public static final int TYPE_ARCHIVES = 4;  // 档案管理

    public KPIModel() {
        levelOneList = load("F:\\kpi_project\\nkpi\\src\\main\\resources\\kpi_templete\\teacherkpi.json");
    }


    private void set(LevelOne levelOne) {
        levelOneList.add(levelOne);
    }

    public List<LevelTwo> getModel() {
        // 清空
        if (levelTwoList != null && levelTwoList.size() > 0) {
            return levelTwoList;
        }
        // 将数据处理成以二级指标为主的类型
        if (levelOneList != null && levelOneList.size() > 0) {
            for (LevelOne levelOne : levelOneList) {
                Set<LevelTwo> levelTwoSet = levelOne.getLevelTwoSet();
                for (LevelTwo levelTwo : levelTwoSet) {
                    LevelOne l = new LevelOne();
                    l.setId(levelOne.getId());
                    l.setName(levelOne.getName());
                    l.setWeight(levelOne.getWeight());
                    levelOne.setLevelTwoSet(null);
                    levelTwo.setParent(l);
                    levelTwoList.add(levelTwo);
                }
            }
        }
         return levelTwoList;
    }

    // 加载教师kpi文件
    public List<LevelOne> load(String url) {
        Set<LevelTwo> levelTwoSet = new HashSet<>();
        try {
            InputStream inputStream = new FileInputStream(url);
            String text = IOUtils.toString(inputStream, "UTF-8");
            JSONObject json = JSON.parseObject(text);
            JSONArray array = json.getJSONArray("teacher");
            if (array != null && array.size() > 0) {
                for (int i = 0; i < array.size(); i++) {
                    JSONObject object1 = array.getJSONObject(i);
                    LevelOne levelOne = new LevelOne();
                    levelOne.setName(object1.getString("name"));
                    levelOne.setWeight(object1.getDouble("weight"));
                    levelOne.setId(object1.getString("id"));
                    JSONArray levelTwoArray = object1.getJSONArray("LevelTwo");
                    if (levelTwoArray != null && levelTwoArray.size() > 0) {
                        for (int j = 0; j < levelTwoArray.size(); j++) {
                            JSONObject object2 = levelTwoArray.getJSONObject(j);
                            LevelTwo levelTwo = new LevelTwo();
                            levelTwo.setContent(object2.getString("content"));
                            levelTwo.setWeight(object2.getDouble("weight"));
                            levelTwo.setScore(object2.getInteger("score"));
                            levelTwo.setTarget(object2.getString("target"));
                            levelTwo.setCompletionTime(TimeUtils.string2Date(object2.getString("completionTime")));
                            levelTwo.setDataSource(object2.getString("dataSource"));
                            levelTwo.setGradeStandard(object2.getString("gradeStandard"));
                            levelTwo.setSelfEvaluationScore(object2.getInteger("selfEvaluationScore"));
                            levelTwo.setSuperiorScore(object2.getInteger("superiorScore"));
                            levelTwoSet.add(levelTwo);
                        }
                        levelOne.setLevelTwoSet(levelTwoSet);
                    }
                    set(levelOne);
                    levelTwoSet = new HashSet<>();
                }
            }
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return levelOneList;
    }

    public Map<String, LevelOne> getKPIModel(int type) {
        switch (type) {
            case TYPE_TEACHER:

                break;
            case TYPE_SAFETY:

                break;
            case TYPE_DEPARTMENT:

                break;
            case TYPE_ARCHIVES:

                break;
            default:

                break;
        }
        return null;
    }
}
