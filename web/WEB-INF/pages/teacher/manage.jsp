<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教师kpi管理</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/webuploader/webuploader.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/webuploader/webuploader.js"></script>


    <script type="text/javascript">
        //定义一些webuploader上传时所需的常量
        var state = 'pending';
        var initfilesize=0;
        var isUpFile=false;//判断是否有文件上传成功，来提示dialog进行下部操作

        var server;  // 选择文件上传成功后要执行的操作 {保存， 修改}
        function doAdd() {
            server = '${pageContext.request.contextPath}/teacherAction_saveKPIFile.action';
            $('#uploadWindow').window("open");
        }

        function doReUpload() {
            var selections = $("#grid").datagrid("getSelections");
            if(selections.length != 1) {
                $.messager.alert('Warning','请选择一个记录进行修改！');
            }else {
                // 打开文件上传
                $('#uploadWindow').window("open");
                var data = selections[0];
                server = '${pageContext.request.contextPath}/teacherAction_updateKPIFile.action?id='+data.id;
            }
        }

        function doEdit() {
            alert("修改...");
        }

        function doDelete() {
            var selected = $("#grid").datagrid("getSelected");
            if(selected != null) {
                $.messager.confirm('Confirm','您真的要删除该条记录吗？',function(r){
                    if (r){
                        // 执行删除操作 ajax没有办法进行页面刷新
                        <%--$.ajax({--%>
                            <%--type : 'post',--%>
                            <%--url : '${pageContext.request.contextPath}/teacherAction.delete.action',--%>
                            <%--data : {'id': selected.id},--%>
                            <%--success : function (data) {--%>
                                <%--if(data.error != null && data.error != "") {--%>
                                    <%--alert("删除失败");--%>
                                <%--}else {--%>
                                    <%----%>
                                <%--}--%>
                            <%--}--%>
                        <%--})--%>
                        location.href = '${pageContext.request.contextPath}/teacherAction_delete.action?id=' + selected.id;
                    }
                });
            }else {
                $.messager.alert('Warning','请选中一行后再进行操作！');
            }
        }

        function doSearch() {
            $('#searchWindow').window("open");
        }

        //导出按钮对应的处理函数
        function doExport() {
            //发送请求，请求Action，进行文件下载
            window.location.href = "teacherAction_exportXls.action";
        }

        <!--移除选择的文件-->
        function removeFile(){
            var grid = $("#uploadGrid");
            var fileRows = grid.datagrid("getSelections");
            var copyRows = [];
            for ( var j= 0; j < fileRows.length; j++) {
                copyRows.push(fileRows[j]);
            }
            for(var i =0;i<copyRows.length;i++){
                var index = grid.datagrid('getRowIndex',copyRows[i]);
                uploader.removeFile(copyRows[i].fileid, true);
                grid.datagrid('deleteRow',index);
            }
            grid.datagrid('clearSelections');
        }
        <!--要开始上传文件喽！-->
        function uploadToServer(){
            if(uploader.getFiles().length<=0){
                alert('没有上传的文件!');
                return;
            }
            if ( state === 'uploading' ) {
                uploader.stop();
            }
            else {
                uploader.upload();
            }
        }

        function kpiDetail(data) {
            // 服务器处理excel文件并回显  后期用ajax优化
            location.href = 'teacherAction_lookXls.action?data=' + data;
        }

        //工具栏
        var toolbar = [{
            id: 'button-search',
            text: '查询',
            iconCls: 'icon-search',
            handler: doSearch
        },  {
            id: 'button-edit',
            text: '修改',
            iconCls: 'icon-edit',
            handler: doEdit
        }, {
            id: 'button-delete',
            text: '删除',
            iconCls: 'icon-cancel',
            handler: doDelete
        }, {
                id: 'button-add',
                text: '上传我的绩效表',
                iconCls: 'icon-add',
                handler: doAdd
            }, {
            id: 'button-reUpload',
            text: '重新上传我的绩效表',
            iconCls: 'icon-add',
            handler: doReUpload
        }, {
            id: 'button-export',
            text: '导出kpi绩效表',
            iconCls: 'icon-undo',
            handler: doExport
        }];
        // 定义列
        var columns = [[{
            field: 'id',
            checkbox: true,
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
                if(data == null || data == "") {
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
                if(data == null || data == "") {
                    return "暂无"
                }
                return "<a href='javascript:void(0);' onclick='kpiDetail(\""+data+"\")' target='_self'>查看</a>";
            }
        }
        ]];

        $(function () {
            // 先将body隐藏，再显示，不会出现页面刷新效果
            $("body").css({visibility: "visible"});

            // 数据表格
            $('#grid').datagrid({
                iconCls: 'icon-forward',
                fit: true,
                border: true,
                rownumbers: true,
                striped: true,
                pageList: [2],
                pagination: true,
                toolbar: toolbar,
                url: "teacherAction_pageQuery.action",
                idField: 'id',
                columns: columns,
                onDblClickRow: doDblClickRow
            });

            // 添加、修改分区
            $('#addSubareaWindow').window({
                title: '添加修改分区',
                width: 600,
                modal: true,
                shadow: true,
                closed: true,
                height: 400,
                resizable: false
            });
            $('#uploadWindow').window({
                title: '上传文件',
                width: 600,
                modal: true,
                shadow: true,
                closed: true,
                height: 400,
                resizable: false
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

            $("#btn").click(function () {
                //将指定的form表单中所有的输入项转为json数据{key:value,key:value}
                var p = $("#searchForm").serializeJson();
                console.info(p);
                //调用数据表格的load方法，重新发送一次ajax请求，并且提交参数
                $("#grid").datagrid("load", p);
                //关闭查询窗口
                $("#searchWindow").window("close");
            });
        });

        function doDblClickRow() {
            alert("双击表格数据...");
        }
    </script>
</head>
<body class="easyui-layout" style="visibility:hidden;">
<div region="center" border="false">
    <table id="grid"></table>
</div>

<%--webuploader的上传窗口--%>
<div class="easyui-window" title="上传文件" id="uploadWindow" collapsible="false" minimizable="false"
     maximizable="false"  style="top:20px;left:200px">
    <div style=" height:200px;width: 500px; overflow:hidden;padding:5px;" split="false" border="false">
        <div class="datagrid-toolbar">
            <div id="picker" style="margin-top:-4px;float:left;">选择文件</div>
            <a id="remove" icon="icon-remove" href="#" class="easyui-linkbutton" plain="true" onclick="removeFile()">移除文件</a>
            <a id="upload" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" onclick="uploadToServer()">开始上传</a>
            <%--在这里写script代码--%>
            <script type="text/javascript">
                // 初始化webuploader
                var uploader = WebUploader.create({
                    // swf文件信息  用于flush
                    swf : '${pageContext.request.contextPath }/js/webuploader/Uploader.swf',
                    // 选择文件的按钮。可选。
                    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                    pick : '#picker',
                    //选择上传服务器
                    server : 'kpiAction_saveKPIFile.action?kpiType=teacher',
                    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                    resize : false,
                    threads:1,
                    fileNumLimit: 1, //限制上传个数
                    duplicate:true,//是否可重复选择同一文件
                    chunkRetry:false,//如果失败，则不重试
                });
                // 当有文件被添加进队列的时候
                uploader.on( 'fileQueued', function( file ) {
                        var row = {fileid:file.id,name:file.name,size:file.size,process:0,state:"等待上传"};
                        var grid = $("#uploadGrid");
                        grid.datagrid("insertRow",{
                            index : 0,
                            row : row
                        })
                });
                uploader.on("uploadAccept", function( file, data){
                    var res = false;
                    if(data.code === '1') {
                        // 导入文件成功！
                        res = true;
                        console.log("导入文件成功")
                    }else{
                        // 导入文件失败- -
                        res = false;
                    }
                    return res;
                });
                // 文件上传过程中创建进度条实时显示。
                uploader.on( 'uploadProgress', function( file, percentage ) {
                    $("#uploadGrid").datagrid('updateRow',
                        {index:0,row:{progress:(percentage * 100).toFixed(2)}});
                });
                //文件上传成功
                uploader.on( 'uploadSuccess', function( file , response ) {
                    $.ajax({
                        type : 'post',
                        url : server,
                        data : {'kpiFileName': response.kpiFileName, 'dataTime' : response.dataTime},
                        success : function (data) {
                            if(data.code != null && data.code == '1') {
                                alert("导入成功");
                                location.reload();
                            }else {
                                alert("导入失败");
                            }
                        }
                    });

                    $("#remove").linkbutton("disable");
                    $("#uploadGrid").datagrid('updateRow',{index:0,row:{state:'上传成功'}});
                    isUpFile=true;
                });
                uploader.on('uploadFinished',function(){   //成功后

                    // location.href = server;  // 跳转到保存或是更新
                    // location.reload();
                });
                uploader.on('uploadError', function(file){
                    $("#uploadGrid").datagrid('updateRow',
                        {index:0,row:{state:'上传失败'}});
                });
            </script>
        </div>
        <div style="width: 500px">
            <table id="uploadGrid"></table>
            <script type="text/javascript">
                $("#uploadGrid").datagrid({
                    rownumbers: true,
                    columns:[[
                        { title: 'id', field: 'fileid',hidden:true,width:100},
                        {field:'name',title:'文件名称',width:100,align:'center'},
                        {field:'size',title:'文件大小',width:100,align:'center'},
                        {field:'progress',title:'上传进度',width:100,align:'center'},
                        {field:'state',title:'上传状态',width:100,align:'center'}
                    ]]
                })
            </script>
        </div>
    </div>
</div>


<%--<div class="easyui-window" title="上传文件" id="rePploadWindow" collapsible="false" minimizable="false"--%>
     <%--maximizable="false"  style="top:20px;left:200px">--%>
    <%--<div style=" height:200px;width: 500px; overflow:hidden;padding:5px;" split="false" border="false">--%>
        <%--<div class="datagrid-toolbar">--%>
            <%--<div id="p" style="margin-top:-4px;float:left;">选择文件</div>--%>
            <%--<a id="remove" icon="icon-remove" href="#" class="easyui-linkbutton" plain="true" onclick="removeFile()">移除文件</a>--%>
            <%--<a id="upload" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" onclick="uploadToServer()">开始上传</a>--%>
            <%--&lt;%&ndash;在这里写script代码&ndash;%&gt;--%>
            <%--<script type="text/javascript">--%>
                <%--// 初始化webuploader--%>
                <%--var reUploader = WebUploader.create({--%>
                    <%--// swf文件信息  用于flush--%>
                    <%--swf : '${pageContext.request.contextPath }/js/webuploader/Uploader.swf',--%>
                    <%--// 选择文件的按钮。可选。--%>
                    <%--// 内部根据当前运行是创建，可能是input元素，也可能是flash.--%>
                    <%--pick : '#p',--%>
                    <%--//选择上传服务器--%>
                    <%--server : '${pageContext.request.contextPath}/teacherAction_reUploadFile.action',--%>
                    <%--// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！--%>
                    <%--resize : false,--%>
                    <%--threads:1,--%>
                    <%--fileNumLimit: 1, //限制上传个数--%>
                    <%--duplicate:true,//是否可重复选择同一文件--%>
                    <%--chunkRetry:false,//如果失败，则不重试--%>
                <%--});--%>
                <%--// 当有文件被添加进队列的时候--%>
                <%--reUploader.on( 'fileQueued', function( file ) {--%>
                    <%--var row = {fileid:file.id,name:file.name,size:file.size,process:0,state:"等待上传"};--%>
                    <%--var grid = $("#uploadGrid");--%>
                    <%--grid.datagrid("insertRow",{--%>
                        <%--index : 0,--%>
                        <%--row : row--%>
                    <%--})--%>
                <%--});--%>
                <%--reUploader.on("uploadAccept", function( file, data){--%>
                    <%--var res = false;--%>
                    <%--if(data.code == '1') {--%>
                        <%--// 导入文件成功！--%>
                        <%--res = true;--%>
                        <%--console.log("导入文件成功")--%>
                    <%--}else{--%>
                        <%--// 导入文件失败- ---%>
                        <%--res = false;--%>
                        <%--alert(data.result);--%>
                    <%--}--%>
                    <%--return res;--%>
                <%--});--%>
                <%--// 文件上传过程中创建进度条实时显示。--%>
                <%--reUploader.on( 'uploadProgress', function( file, percentage ) {--%>
                    <%--$("#uploadGrid").datagrid('updateRow',--%>
                        <%--{index:0,row:{progress:(percentage * 100).toFixed(2)}});--%>
                <%--});--%>
                <%--//文件上传成功--%>
                <%--reUploader.on( 'uploadSuccess', function( file ) {--%>
                    <%--alert("上传成功");--%>
                    <%--$("#remove").linkbutton("disable");--%>
                    <%--$("#uploadGrid").datagrid('updateRow',{index:0,row:{state:'上传成功'}});--%>
                    <%--isUpFile=true;--%>
                <%--});--%>
                <%--reUploader.on('uploadFinished',function(){   //成功后--%>

                    <%--location.reload();--%>
                <%--});--%>
                <%--reUploader.on('uploadError', function(file){--%>
                    <%--$("#uploadGrid").datagrid('updateRow',--%>
                        <%--{index:0,row:{state:'上传失败'}});--%>
                <%--});--%>
            <%--</script>--%>
        <%--</div>--%>
        <%--<div style="width: 500px">--%>
            <%--<table id="reUploadGrid"></table>--%>
            <%--<script type="text/javascript">--%>
                <%--$("#uploadGrid").datagrid({--%>
                    <%--rownumbers: true,--%>
                    <%--columns:[[--%>
                        <%--{ title: 'id', field: 'fileid',hidden:true,width:100},--%>
                        <%--{field:'name',title:'文件名称',width:100,align:'center'},--%>
                        <%--{field:'size',title:'文件大小',width:100,align:'center'},--%>
                        <%--{field:'progress',title:'上传进度',width:100,align:'center'},--%>
                        <%--{field:'state',title:'上传状态',width:100,align:'center'}--%>
                    <%--]]--%>
                <%--})--%>
            <%--</script>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<!-- 添加 -->
<div class="easyui-window" title="分区添加修改" id="addSubareaWindow" collapsible="false" minimizable="false"
     maximizable="false" style="top:20px;left:200px">
    <div style="height:31px;overflow:hidden;" split="false" border="false">
        <div class="datagrid-toolbar">
            <a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
            <script type="text/javascript">
                $(function () {
                    $("#save").click(function () {
                        //表单校验
                        var r = $("#addSubareaForm").form('validate');
                        if (r) {
                            $("#addSubareaForm").submit();
                        }
                    });
                });
            </script>
        </div>
    </div>

    <div style="overflow:auto;padding:5px;" border="false">
        <form id="addSubareaForm" method="post" action="#">
            <table class="table-edit" width="80%" align="center">
                <tr class="title">
                    <td colspan="2">分区信息</td>
                </tr>
                <tr>

                </tr>
                <tr>
                    <td>关键字</td>
                    <td><input type="text" name="addresskey" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>起始号</td>
                    <td><input type="text" name="startnum" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>终止号</td>
                    <td><input type="text" name="endnum" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>单双号</td>
                    <td>
                        <select class="easyui-combobox" name="single" style="width:150px;">
                            <option value="0">单双号</option>
                            <option value="1">单号</option>
                            <option value="2">双号</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>位置信息</td>
                    <td><input type="text" name="position" class="easyui-validatebox" required="true"
                               style="width:250px;"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>