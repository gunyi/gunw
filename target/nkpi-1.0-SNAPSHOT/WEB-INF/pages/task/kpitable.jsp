<jsp:include page="../header.jsp" flush="true"/>
<%@page pageEncoding="UTF-8"%>


<script type="text/javascript">
	$(function(){
		$("#grid").datagrid({
			toolbar : [
				{
					id : 'add',
					text : '添加',
					iconCls : 'icon-add',
					handler : function(){
						<%--location.href='${pageContext.request.contextPath}/page_admin_function_add.action';--%>
					}
				}, {
                    id : 'edit',
                    text : '修改考核内容',
                    iconCls : 'icon-add',
                    handler : function(){
                        <%--location.href='${pageContext.request.contextPath}/page_admin_function_add.action';--%>
                    }
                }, {
                    id : 'delete',
                    text : '删除考核内容',
                    iconCls : 'icon-remove',
                    handler : function(){

                        $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                            if (r){
                                var ids = [];
                                var items = $('#grid').datagrid('getSelections');
                                for(var i=0; i<items.length; i++){
                                    ids.push(items[i].id);
                                }
                                ids.join(",");
                                location.href = "${pageContext.request.contextPath}/taskAction_deleteBatch.action?ids=" + ids;
                                <%--$.ajax({--%>
                                    <%--url : '${pageContext.request.contextPath}/taskAction_delete.action',--%>
                                    <%--type : "post",--%>
                                    <%--// dataType : "json",--%>
                                    <%--data : {ids : ids},--%>
                                    <%--success : function (data) {--%>
                                        <%--if (data == 0) {--%>
                                            <%--$.message.info("成功");--%>
                                        <%--} else {--%>
                                            <%--$.message.info("失败");--%>
                                        <%--}--%>
                                    <%--}--%>
                                <%--})--%>
                            }
                        });
                    }
                },{
                    id : 'save',
                    text : '提交打分',
                    iconCls : 'icon-save',
                    handler : function(){
                        alert("提交打分")
                        <%--location.href='${pageContext.request.contextPath}/page_admin_function_add.action';--%>
                    }
                }
            ],
			url : 'taskAction_teacherkpitemp.action',
			pagination : true,
			fit:true,
			columns : [[
			  {
				  field : 'id',
				  title : '编号',
				  width : 50,
				  checkbox:true
			  },
			  {
				  field : 'name',
				  title : '一级指标名称',
				  width : 100,
                  formatter:function(val, row, index){
                      if(row.parent){
                          return  row.parent.name;
                      }
                  },
              },
                {
                    field : 'weight',
                    title : '二级权重',
                    width : 55,
                    formatter:function(val, row, index){
                        if(row){
                            return  row.weight;
                        }
                    },
                },
                {
				  field : 'parent.weight',
				  title : '一级权重',
				  width : 55,
                  formatter:function(val, row, index){
                          return row.parent.weight;
                  },
			  },  

			  {
				  field : 'content',
				  title : '内容',
				  width : 676,
			  },
                {
                    field : 'target',
                    title : '目标值',
                    width : 347,

                },
                {
                    field : 'score',
                    title : '总分',
                    width : 55,

                },
                {
                    field : 'completionTime',
                    title : '完成时间',
                    width : 104,

                },
                {
                    field : 'dataSource',
                    title : '数据来源',
                    width : 150,

                },
                {
                    field : 'gradeStandard',
                    title : '评分标准',
                    width : 150,

                },
                {
                    field : 'selfEvaluationScore',
                    title : '自评得分',
                    width : 100,
                    formatter:function(val, row, index){
                        if(val === 0) {
                            return "<input align='center' style='width: 50px' type='text' value='自评得分' id='selfEvaluationScore'>"
                        } else {
                            return "<input type='text' style='width:50px' value='"+val+"' id='selfEvaluationScore'>"
                        }
                    },
                },
                {
                    field : 'superiorScore',
                    title : '直接上级评分',
                    width : 100,
                    formatter:function(val, row, index){
                        if(val === 0) {
                            return "<input align='center' style='width: 50px' type='text' value='上级评分' id='superiorScore'>"
                        } else {
                            return "<input type='text' style='width: 50px' value='"+val+"' id='superiorScore'>"
                        }
                    },
                },
			]]
		});
	});
</script>	
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
	<table id="grid"></table>

    <!-- 保存被批改的教师id -->
    <%--<input id="user_id" type="hidden" name="user_id>--%>
</div>
</body>
</html>