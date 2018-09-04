<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教师kpi绩效表</title>
    <!-- 导入jquery核心类库 -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <!-- 导入easyui类库 -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/default.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
    <script
            src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
            type="text/javascript"></script>
    <%--加载js--%>
    <script type="text/javascript">
        
        // $('#grid').datagrid({
        //     url:'#',
        //     columns:[[
        //         {field:'code',title:'Code',width:100},
        //
        //         {field:'name',title:'Name',width:100},
        //
        //         {field:'price',title:'Price',width:100,align:'right'}
        //     ]]
        // });

        <!-- 进行合并单元格的操作 -->
        

    </script>

</head>

<body >
    <div>
        <table id="table" border=1 cellpadding="1" cellspacing="0" style="width: 1500px">
            <thead>
                <td id="A">A</td>
                <td id="B">B</td>
                <td id="C">C</td>
                <td id="D">D</td>
                <td id="E">E</td>
                <td id="F">E</td>
                <td id="G">G</td>
                <td id="H">H</td>
                <td id="I">I</td>
                <td id="J">J</td>
                <td id="K">K</td>
                <td id="L">L</td>
                <td id="N">N</td>
                <td id="O">O</td>
                <td id="P">P</td>
            </thead>
            <tr>
                <td id="A_A" style="width: 1000px" colspan="2">姓名：刘老师</td>
                <td id="A_B"></td>
                <td id="A_C">c</td>
                <td id="A_D" colspan="4">所在单位：学校办公室</td>
                <td id="A_E">e</td>
                <td id="A_F">f</td>
                <td id="A_G">g</td>
                <td id="A_H">岗位：综合办干事</td>
                <td id="A_I"></td>
                <td id="A_J">g</td>
                <td id="A_K">g</td>
                <td id="A_L">g</td>
                <td id="A_N" colspan="3">考核周期： 2017年7月1日至2018年6月30日</td>
                <td id="A_O">g</td>
                <td id="A_P">g</td>
            </tr>
            <tr>
                <td id="B_A">KPI名称</td>
                <td id="B_B"></td>
                <td id="B_C">c</td>
                <td id="B_D"></td>
                <td id="B_E">e</td>
                <td id="B_F">f</td>
                <td id="B_G">总分</td>
                <td id="B_H">g</td>
                <td id="B_I">指标的完成时间</td>
                <td id="B_J">g</td>
                <td id="B_K">数据来源</td>
                <td id="B_L">g</td>
                <td id="B_M">g</td>
                <td id="B_N">评分标准</td>
                <td id="B_O">自评得分</td>
                <td id="B_P">直接上级评分</td>
            </tr>
            <tr>
                <td id="C_A">一级指标</td>
                <td id="C_B">一级指标
                    权重（%）</td>
                <td id="C_C">考核内容（二级指标）</td>
                <td id="C_D">x</td>
                <td id="C_E">二级指标 权重（%）</td>
                <td id="C_F">目标值</td>
                <td id="C_G">g</td>
                <td id="C_H">g</td>
                <td id="C_I">x</td>
                <td id="C_J">g</td>
                <td id="C_K">g</td>
                <td id="C_L">g</td>
                <td id="C_M">g</td>
                <td id="C_N">x</td>
                <td id="C_O">g</td>
                <td id="C_P">g</td>
            </tr>

            <tr>
                <td id="D_A">日常接待工作</td>
                <td id="D_B">15%</td>
                <td id="D_C">协助主管领导完成上级来校检查、评估、调研等接待工作；协助主管领导做好友好院校来访、考察、交流的组织与接待工作</td>
                <td id="D_D">x</td>
                <td id="D_E">15%</td>
                <td id="D_F">行程安排合理妥当，来访人员满意度≥95%</td>
                <td id="D_G">100</td>
                <td id="D_H">g</td>
                <td id="D_I">2018/6/30</td>
                <td id="D_J">g</td>
                <td id="D_K">校领导、      校属各单位</td>
                <td id="D_L">g</td>
                <td id="D_M">g</td>
                <td id="D_N">满意度≥95%为优秀，≥80%为良好，≥60%为及格</td>
                <td id="D_O">g</td>
                <td id="D_P">g</td>
            </tr>

            <tr>
                <td id="E_A">行政工作</td>
                <td id="E_B">25%</td>
                <td id="E_C">做好学校各项活动协调会召开的组织工作及会议准备；协助主管领导做好学校各项大型活动的统筹协调工作</td>x
                <td id="E_D">x</td>
                <td id="E_E">10%</td>
                <td id="E_F">组织协调工作准确、及时、无差错</td>
                <td id="E_G">100</td>
                <td id="E_H">g</td>
                <td id="E_I">2018/6/30</td>
                <td id="E_J">g</td>
                <td id="E_K">校领导、      校属各单位</td>
                <td id="E_L">g</td>
                <td id="E_M">g</td>
                <td id="E_N">出现差错一次扣2分</td>
                <td id="E_O">g</td>
                <td id="E_P">g</td>
            </tr>

            <tr>
                <td id="F_A"></td>
                <td id="F_B"></td>
                <td id="F_C">完成学校综合统计数据的收集、整理、汇总工作并及时上报</td>x
                <td id="F_D">10%</td>
                <td id="F_E">组织协调工作准确、及时、无差错</td>
                <td id="F_F">f</td>
                <td id="F_G">100</td>
                <td id="F_H">g</td>
                <td id="F_I">2018/6/30</td>
                <td id="F_J">g</td>
                <td id="F_K"></td>
                <td id="F_L">g</td>
                <td id="F_N">x</td>
                <td id="F_M">x</td>
                <td id="F_O">g</td>
                <td id="F_P">g</td>
            </tr>

            <tr>
                <td id="G_A"></td>
                <td id="G_B"></td>
                <td id="G_C">掌握行政楼七楼会议室的申请与使用情况；学校办公室预算制定，做好校办日常报账；学校酒水、礼品的管理及发放</td>
                <td id="G_D">x</td>
                <td id="G_E">5%</td>
                <td id="G_F">会议室使用情况安排合理；报账及时、无差错；酒水、礼品管理无误</td>
                <td id="G_G">100</td>
                <td id="G_H">g</td>
                <td id="G_I">2018/6/30</td>
                <td id="G_J">g</td>
                <td id="G_K">g</td>
                <td id="G_L">g</td>
                <td id="G_M">g</td>
                <td id="G_N">x</td>
                <td id="G_O">g</td>
                <td id="G_P">g</td>
            </tr>

            <tr>
                <td id="H_A">学生助理团队管理工作</td>
                <td id="H_B">15%</td>
                <td id="H_C">协助主管领导做好学生助理的招聘与遴选</td>x
                <td id="H_D">x</td>
                <td id="H_E">5%</td>
                <td id="H_F">学生助理日常值班与会务、礼仪工作完整、高效</td>
                <td id="H_G">100</td>
                <td id="H_H">g</td>
                <td id="H_I">2018/6/30</td>
                <td id="H_J">g</td>
                <td id="H_K">校领导、      校办各二级部门</td>
                <td id="H_L">g</td>
                <td id="H_M">g</td>
                <td id="H_N">综合满意度满意度≥95%为优秀，≥80%为良好，≥60%为及格</td>
                <td id="H_O">g</td>
                <td id="H_P">g</td>
            </tr>

            <tr>
                <td id="I_A"></td>
                <td id="I_B"></td>
                <td id="I_C">协助主管领导做好学生助理的日常培训与值班安排，做好定期考核工作，加强团队文化建设</td>
                <td id="I_D">x</td>
                <td id="I_E">10%</td>
                <td id="I_F">行程安排合理妥当，来访人员满意度≥95%</td>
                <td id="I_G">100</td>
                <td id="I_H">g</td>
                <td id="I_I">2018/6/30</td>
                <td id="I_J">g</td>
                <td id="I_K">g</td>
                <td id="I_L">g</td>
                <td id="I_M">g</td>
                <td id="I_N">x</td>
                <td id="I_O">g</td>
                <td id="I_P">g</td>
            </tr>

            <tr>
                <td id="J_A">校领导服务工作</td>
                <td id="J_B">15%</td>
                <td id="J_C">校领导参加校内各种礼仪活动及外出工作的事务安排、服务与保障工作；做好校长邀请来访我校的嘉宾的邮件跟踪和接待工作</td>
                <td id="J_D">x</td>
                <td id="J_E">10%</td>
                <td id="J_F">行程安排合理妥当，来访人员满意度≥95%</td>
                <td id="J_G">100</td>
                <td id="J_H">g</td>
                <td id="J_I">2018/6/30</td>
                <td id="J_J">g</td>
                <td id="J_K">校领导、      校属各单位</td>
                <td id="J_L">g</td>
                <td id="J_M">g</td>
                <td id="J_N">满意度≥95%为优秀，≥80%为良好，≥60%为及格</td>
                <td id="J_O">g</td>
                <td id="J_P">g</td>
            </tr>

            <tr>
                <td id="K_A"></td>
                <td id="K_B"></td>
                <td id="K_C">校领导日常接待、差旅的报账，办公用品的更换、补充；做好校领导交办的其他事项</td>
                <td id="K_D">x</td>
                <td id="K_E">5%</td>
                <td id="K_F">报账无差错，办公用品更换、补充及时；工作完成及时、有效</td>
                <td id="K_G">100</td>
                <td id="K_H">g</td>
                <td id="K_I">2018/6/30</td>
                <td id="K_J">g</td>
                <td id="K_K">校领导</td>
                <td id="K_L">g</td>
                <td id="K_M">g</td>
                <td id="K_N">x</td>
                <td id="K_O">g</td>
                <td id="K_P">g</td>
            </tr>

            // TODO 继续完成kpi表格
            <tr>
                <td id="L_A">学年专项工作</td>
                <td id="L_B">30%</td>
                <td id="L_C"></td>
                <td id="L_D">配合领导完成规章制度修订工作</td>
                <td id="L_E">5%</td>
                <td id="L_F">在规定节点内按时完成</td>
                <td id="L_G">100</td>
                <td id="L_H">g</td>
                <td id="L_I">2018/6/30</td>
                <td id="L_J">g</td>
                <td id="L_K">目标管理小组、校领导、校属各单位</td>
                <td id="L_L">g</td>
                <td id="L_M">g</td>
                <td id="L_N">定性指标</td>
                <td id="L_O">g</td>
                <td id="L_P">g</td>
            </tr>

            <tr>
                <td id="M_A"></td>
                <td id="M_B"></td>
                <td id="M_C">配合领导完成流程管理工作</td>
                <td id="M_D"></td>
                <td id="M_E">5%</td>
                <td id="M_F">在规定节点内按时完成</td>
                <td id="M_G">100</td>
                <td id="M_H"></td>
                <td id="M_I">2018/6/30</td>
                <td id="M_J">g</td>
                <td id="M_K">g</td>
                <td id="M_L">g</td>
                <td id="M_M">g</td>
                <td id="M_N">定性指标</td>
                <td id="M_O">g</td>
                <td id="M_P">g</td>
            </tr>

            <tr>
                <td id="N_A"></td>
                <td id="N_B"></td>
                <td id="N_C">配合领导完成行政职能流程梳理工作</td>
                <td id="N_D"></td>
                <td id="N_E">5%</td>
                <td id="N_F">完成职能流程展示、平台搭建工作及部分常用流程上线工作</td>
                <td id="N_G">100</td>
                <td id="N_H">g</td>
                <td id="N_I">2018/6/30</td>
                <td id="N_J">g</td>
                <td id="N_K">g</td>
                <td id="N_L">g</td>
                <td id="N_M">g</td>
                <td id="N_N">定性指标</td>
                <td id="N_O">g</td>
                <td id="N_P">g</td>
            </tr>

            <tr>
                <td id="O_A"></td>
                <td id="O_B"></td>
                <td id="O_C">配合领导完成无纸化办公</td>
                <td id="O_D">x</td>
                <td id="O_E">10%</td>
                <td id="O_F">全部完成</td>
                <td id="O_G">100</td>
                <td id="O_H">g</td>
                <td id="O_I">2018/6/30</td>
                <td id="O_J">g</td>
                <td id="O_K">g</td>
                <td id="O_L">g</td>
                <td id="O_M">g</td>
                <td id="O_N">定性指标</td>
                <td id="O_O">g</td>
                <td id="O_P">g</td>
            </tr>

            <tr>
                <td id="P_A"></td>
                <td id="P_B"></td>
                <td id="P_C">配合领导完成校庆启动工作</td>
                <td id="P_D">x</td>
                <td id="P_E">5%</td>
                <td id="P_F">在规定时间节点内按时完成</td>
                <td id="P_G">100</td>
                <td id="P_H">g</td>
                <td id="P_I">2018/6/30</td>
                <td id="P_J">g</td>
                <td id="P_K">g</td>
                <td id="P_L">g</td>
                <td id="P_M">g</td>
                <td id="P_N">定性指标</td>
                <td id="P_O">g</td>
                <td id="P_P">g</td>
            </tr>
        </table>
    </div>
</body>

</html>