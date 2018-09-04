package cn.edward.test;

import cn.me.kpi.model.KPIModel;
import cn.me.kpi.model.LevelOne;
import cn.me.kpi.model.LevelTwo;
import cn.me.kpi.util.TimeUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.IOUtils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Set;

public class Test {
//    public static void main(String[] args) {
//        KPIModel kpiModel = new KPIModel();
//        Set<LevelTwo> levelTwoSet = new HashSet<>();
//        try {
//            InputStream inputStream = new FileInputStream("H:\\Sias\\nkpi\\src\\main\\resources\\kpi_templete\\teacherkpi.json");
//            String text = IOUtils.toString(inputStream);
//            JSONObject json = JSON.parseObject(text);
//            JSONArray array = json.getJSONArray("teacher");
//            if (array != null && array.size() > 0) {
//                for (int i = 0; i < array.size(); i++) {
//                    JSONObject object1 = array.getJSONObject(i);
//                    LevelOne levelOne = new LevelOne();
//                    levelOne.setName(object1.getString("name"));
//                    levelOne.setWeight(object1.getDouble("weight"));
//                    levelOne.setId(object1.getString("id"));
//                    JSONArray levelTwoArray = object1.getJSONArray("LevelTwo");
//                   if (levelTwoArray != null && levelTwoArray.size() > 0) {
//                       for (int j = 0; j < levelTwoArray.size(); j++) {
//                           JSONObject object2 = levelTwoArray.getJSONObject(j);
//                           LevelTwo levelTwo = new LevelTwo();
//                           levelTwo.setContent(object2.getString("content"));
//                           levelTwo.setWeight(object2.getDouble("weight"));
//                           levelTwo.setScore(object2.getInteger("score"));
//                           levelTwo.setCompletionTime(TimeUtils.string2Date(object2.getString("completionTime")));
//                           levelTwo.setDataSource(object2.getString("dataSource"));
//                           levelTwo.setGradeStandard(object2.getString("gradeStandard"));
//                           levelTwo.setSelfEvaluationScore(object2.getInteger("selfEvaluationScore"));
//                           levelTwo.setSuperiorScore(object2.getInteger("superiorScore"));
//                           levelTwoSet.add(levelTwo);
//                       }
//                       levelOne.setLevelTwoSet(levelTwoSet);
//                   }
//                    kpiModel.set(levelOne.getId(), levelOne);
//                    levelTwoSet = new HashSet<>();
//                }
//            }
//            inputStream.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

}
