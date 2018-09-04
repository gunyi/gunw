<%--
  Created by IntelliJ IDEA.
  User: muying
  Date: 2018/9/2
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>安全工作管理</title>

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

    <%--导入webuploader上传插件--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/webuploader/webuploader.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/webuploader/webuploader.js"></script>

    <script type="text/javascript">

        //工具栏
        var toolbar = [{
            id: 'button-search',
            text: '查询',
            iconCls: 'icon-add',
        }, {
            id: 'button-edit',
            text: '修改',
            iconCls: 'icon-edit',
        }, {
            id: 'button-delete',
            text: '删除',
            iconCls: 'icon-delete',

        }, {
            id: 'button-add',
            text: '上传我的绩效表',
            iconCls: 'icon-add',

        }, {
            id: 'button-reUpload',
            text: '重新上传我的绩效表',
            iconCls: 'icon-add',
        }, {
            id: 'button-export',
            text: '导出kpi绩效表',
            iconCls: 'icon-undo',
        }];

        //定义列
        var columns = [[{
            field: 'id',
            checkbox: 'true'

        }, {
            field: 'teacher.id',
            title: '教师编号',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                return row.teacher.id;
            }

        }, {
            field: 'teacher.name',
            title: '教师姓名',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                return row.teacher.name;
            }
        }, {
            field: 'scoreDepartment.name',
            title: '所属部门',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                if (row.scoreDepartment != null) {
                    return row.scoreDepartment.name;
                }
            }
        }, {
            field: 'score',
            title: '总得分',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                if (data == null) {
                    return "未打分"
                }
                return data;
            }
        }, {
            field: 'evaluate',
            title: '评价',
            width: 120,
            align: 'center'
        }, {
            field: 'parentUser.name',
            title: '批改人',
            width: 100,
            align: 'center',
            formatter: function (data, row, index) {
                if (data == null || data == "") {
                    return "暂无";
                }
                return row.parentUser.name;
            }
        }, {
            field: 'description',
            title: '描述备注',
            width: 100,
            align: 'center'
        }, {
            field: 'date',
            title: '提交时间',
            width: 100,
            align: 'center'
        }, {
            field: 'kpiFilePath',
            title: 'kpi文件',
            width: 100,
            align: 'center',
            formatter: function (data, row, index) {
                if (data == null || data == "") {
                    return "暂无"
                }
                return "<a href='javascript:void(0);' onclick='kpiDetail(\"" + data + "\")' target='_self'>查看</a>";
            }
        }
        ]];

        $(function () {
            //先将body隐藏，再显示，不会出现页面刷新效果
            $("body").css({visibility: "visible"});

            //数据表格
            $('#grid').datagrid({
                iconCls: 'icon-forward',
                fit: true,
                border: true,
                rownumbers: true,
                striped: true,
                pageList: [2],
                pagination: true,
                toolbar: toolbar,
                idField: 'id',
                columns: columns,
                onDblClickRow: doDblClickRow
            });

            $("#btn").click(function () {
                //将指定的form表单中所有的输入项转为json数据{key:value,key:value}
                var p = $("#searchForm").serializeJson();
                console.info(p);
                //调用数据表格的load方法，重新发送一次ajax请求，并且提交参数
                $("#grid").datagrid("load", p);
                //关闭查询窗口
                $("#searchWindow").window("close");
            });

            //定义一个工具方法，用于将指定的form表单中所有的输入项转为json数据{key:value,key:value}
            $.fn.serializeJson = function () {
                var serializeObj = {};
                var array = this.serializeArray();
                $(array).each(function () {
                    if (serializeObj[this.name]) {
                        if ($.isArray(serializeObj[this.name])) {
                            serializeObj[this.name].push(this.value);
                        } else {
                            serializeObj[this.name] = [serializeObj[this.name], this.value];
                        }
                    } else {
                        serializeObj[this.name] = this.value;
                    }
                });
                return serializeObj;
            };

        });

        function doDblClickRow() {
            alert("双击表格数据...");
        }
        
        function doSearch() {

        }
    </script>
</head>
<body class="easyui-layout" style="visibility: hidden;">
outer
<div region="center" border="false">
    hello
    <table id="grid"></table>
</div>

</body>
</html>
