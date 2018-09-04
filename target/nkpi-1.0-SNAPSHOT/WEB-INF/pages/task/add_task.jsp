<%@ page import="cn.me.kpi.util.TimeUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="../header.jsp" flush="true"/>


<script type="text/javascript">

    // 上传信息
    function save() {
        <!--  使用ajax发送数据  添加上级评分人 被评分人 -->
        var name = $("#name").val();
        var task_type = $("#s_task_type").combobox("getValue");
        var status = $("#s_status").combobox("getValue");
        var start_name = $("#start_name").datetimebox("getValue");
        var end_name = $("#end_name").datetimebox("getValue");
        var check_man = $("#check_man").combobox("getValue");
        var teachers = JSON.stringify($("#grid").datagrid("getSelections"));
        var teacher_ids =
        console.log(teachers)

        $.ajax({
            url: '${pageContext.request.contextPath}/taskAction_addTaskAjax.action',
            type: "post",
            // dataType : "json",
            data: {name:name, task_type: task_type, status:status, start_name:start_name, end_name:end_name, check_man:check_man, teachers:teachers},
            success: function (data) {
                if (data == 0) {
                    $.message.info("成功");
                } else {
                    $.message.info("失败");
                }
            }
        })
    }

    $(function () {

    });
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
    <body class="easyui-layout">
    <div region="north" style="height:31px;overflow:hidden;" split="false" border="false">
        <div class="datagrid-toolbar">
            <a id="save" icon="icon-save" class="easyui-linkbutton" plain="true" onclick="save()">保存</a>
        </div>
    </div>
    <div region="center" style="overflow:auto;padding:5px;" border="false">
        <form id="addTaskForm" method="post" action="taskAction_addTask.action">
            <table class="table-edit" width="80%" align="center">
                <tr class="title">
                    <td colspan="2">新增考核任务</td>
                </tr>
                <tr>
                    <td width="200">考核名称</td>
                    <td>
                        <input id="name" type="text" name="name" class="easyui-validatebox" data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>考核类型</td>
                    <td>
                        <select name="type" id="s_task_type" class="easyui-combobox" name="state" style="width:200px;">
                            <option value="1">平时考核</option>
                            <option value="2">期末考核</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>开启状态</td>
                    <td>
                        <select name="status" id="s_status" class="easyui-combobox" name="state" style="width:200px;">
                            <option value="0">开启</option>
                            <option value="1">关闭</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>开始时间</td>
                    <td>
                        <input id="start_name" name="start_name" class="easyui-datetimebox" value="10/11/2012 2:3:56"
                               style="width:200px">
                    </td>
                </tr>
                <tr>
                    <td>结束时间</td>
                    <td>
                        <input id="end_name" name="end_name" class="easyui-datetimebox" value="10/11/2012 2:3:56"
                               style="width:200px">
                    </td>
                </tr>
                <tr>
                    <td>考核人</td>
                    <td>
                        <input id="check_man" name="end_name" class="easyui-combobox" style="width:200px">
                        <script type="text/javascript">
                            $("#check_man").combobox({
                                url: 'userAction_findAll.action',
                                valueField: 'id',
                                textField: 'name'
                            })
                        </script>
                    </td>
                </tr>
                <tr style="width: 300px">
                    <table id="grid"></table>
                    <script type="text/javascript">
                        $(function () {
                            $("#grid").datagrid({
                                toolbar: [],
                                url: 'userAction_findAllWithoutMe.action',
                                pagination: true,
                                fit: true,
                                columns: [[
                                    {
                                        field: 'id',
                                        title: '编号',
                                        width: 200,
                                        checkbox: true
                                    },
                                    {
                                        field: 'name',
                                        title: '名称',
                                        width: 200
                                    },
                                    {
                                        field: 'gender',
                                        title: '性别',
                                        width: 200,
                                    },
                                ]]
                            });
                        });
                    </script>
                </tr>
                <tr>
                    <td>
                        <a href="#" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-print'"
                           style="float: right; margin-right: 50px; margin-top: 20px">提交</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </body>
</div>
</body>
</html>