package cn.me.kpi.util;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 处理Excel
 */
public class ExcelParser {
    public static String[] array = new String[]{"", "A", "B", "C", "D", "E", "F", "G", "H", "I",
            "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

    public static Map<String, String> getTeacherExcelContentMap(File file, int kpiType) throws FileNotFoundException, IOException, InvalidFormatException {

        Map<String, String> contentMap = new HashMap<>(0);

        Workbook workbook = WorkbookFactory.create(file);
        Sheet sheet = workbook.getSheetAt(0);// 获取第一页
        // 遍历标签页中的所有行  拼接数据并存放入map
        int cellCount = 0;
        int rowNum = 0;
        String cellValue = "";

        // 获取kpi的解析规则
        Rule rule = new Rule();
        Map<Integer, int[]> ruleMap = rule.getRule(kpiType);

        for (Row row : sheet) {
            rowNum = row.getRowNum();
            if (rowNum == 0) {
                continue;
            }
            if (rowNum > 18) {
                break;
            }
            // 通过解析规则获取需要解析的列
            int[] cells = ruleMap.get(rowNum);
            for(int i : cells) {
                Cell cell = row.getCell(i);
                // 拼接键
                String key = array[rowNum] + cellCount;
                if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                    // 当前值是日期并且不是百分数
                    if (DateUtil.isValidExcelDate(cell.getNumericCellValue()) && cell.getNumericCellValue() > 100) {
                        Date date = cell.getDateCellValue();//根据需要取时间，date类型和String类型
                        cellValue = TimeUtils.date2String(date);
                    }else {
                        cellValue = String.valueOf(cell.getNumericCellValue());
                    }
                } else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
                    cellValue = cell.getStringCellValue();
                }else {
                    cellValue = "";
                }
                contentMap.put(key, cellValue);
                cellCount++;
            }
            cellCount = 0;
        }
        return contentMap;
    }


    public static int TYPE_TEACHER = 0;

    static class Rule {

        int A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6,
                H = 7, I = 8, J = 9, K = 10, L = 11, M = 12, N = 13, O = 14, P = 15;

        public Rule() {
        }

        public Map<Integer, int[]> getRule(int type) {
            // 拿map存入每行需要解析的列  避免重复
            Map<Integer, int[]> map = new HashMap<>();
            int row;
            int[] cells;
            switch (type) {
                case 0:
                    // 解析教师的kpi文件 第一行不解析
                    for (int i = 1; i < 19; i++) {
                        row = i;
                        switch (i) {
                            case 1:
                                cells = new int[]{A, D, H, N};
                                map.put(row, cells);
                                break;
                            case 2:
                                cells = new int[]{A, G, I, K, M, O, P};
                                map.put(row, cells);
                                break;
                            case 3:
                                cells = new int[]{A, B, C, E, F};
                                map.put(row, cells);
                                break;
                            case 4:
                                cells = new int[]{A, B, C, E, F, G, I, K, M, O, P};
                                map.put(row, cells);
                                break;
                            case 5:
                                cells = new int[]{A, B, C, E, F, G, I, K, M, O, P};
                                map.put(row, cells);
                                break;
                            case 6:
                                cells = new int[]{C, E, F, G, I, O, P};
                                map.put(row, cells);
                                break;
                            case 7:
                                cells = new int[]{C, E, F, G, I, O, P};
                                map.put(row, cells);
                                break;
                            case 8:
                                cells = new int[]{A, B, C, E, F, G, I, K, M, O, P};
                                map.put(row, cells);
                                break;
                            case 9:
                                cells = new int[]{C, E, G, I, O, P};
                                map.put(row, cells);
                                break;
                            case 10:
                                cells = new int[]{A, B, C, E, F, G, I, K, M, O, P};
                                map.put(row, cells);
                                break;
                            case 11:
                                cells = new int[]{C, E, F, G, I, K, O, P};
                                map.put(row, cells);
                                break;
                            case 12:
                                cells = new int[]{A, B, C, E, F, G, I, K, M, O, P};
                                map.put(row, cells);
                                break;
                            case 13:
                                cells = new int[]{C, E, F, G, I, M, O, P};
                                map.put(row, cells);
                                break;
                            case 14:
                                cells = new int[]{C, E, F, G, I, M, O, P};
                                map.put(row, cells);
                                break;
                            case 15:
                                cells = new int[]{C, E, F, G, I, M, O, P};
                                map.put(row, cells);
                                break;
                            case 16:
                                cells = new int[]{C, E, F, G, I, M, O, P};
                                map.put(row, cells);
                                break;
                            case 17:
                                cells = new int[]{A, E, N, O, P};
                                map.put(row, cells);
                                break;
                            case 18:
                                cells = new int[]{A};
                                map.put(row, cells);
                                break;
                        }
                    }

                case 1:

                default:
            }
            return map;
        }
    }

}
