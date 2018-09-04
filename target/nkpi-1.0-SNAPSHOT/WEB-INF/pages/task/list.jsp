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
						location.href='${pageContext.request.contextPath}/page_task_add_task.action';
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
                }
            ],
			url : 'taskAction_pageQuery.action',
			pagination : true,
			fit:true,
			columns : [[
			  {
				  field : 'id',
				  title : '编号',
				  width : 200,
				  checkbox:true
			  },
			  {
				  field : 'name',
				  title : '名称',
				  width : 200
			  },  
			  {
				  field : 'type',
				  title : '考核类型',
				  width : 200,
                  formatter : function(data,row, index){
                      if(data == 1){
                          return "平时考核";
                      }else if (data == 2){
                          return "期末考核";
                      }
                  }
			  },  
			  {
				  field : 'status',
				  title : '开启状态',
				  width : 150,
				  formatter : function(data,row, index){
						if(data == 0){
							return "开启";
						}else{
							return "关闭";
						}
					}
			  },  
			  {
				  field : 'startTime',
				  title : '开始时间',
				  width : 200,
                  formatter : function(data,row, index){
                      var year = data.year;
                      var month = data.month;
                      var day = data.day;

                      return 2018 + '-' +month + '-' + day;
                  }
			  },  
			  {
				  field : 'endTime',
				  title : '结束时间',
				  width : 200,
                  formatter : function(data,row, index){
				      if (data == null) {
				          return "-"
                      } else {
                          var year = data.year;
                          var month = data.month;
                          var day = data.day;
                          return 2018 + '-' +month + '-' + day;
                      }
                  }
			  }
			]]
		});
	});
</script>	
</head>
<body class="easyui-layout">
<div data-options="region:'center'">
	<table id="grid"></table>
</div>
</body>
</html>