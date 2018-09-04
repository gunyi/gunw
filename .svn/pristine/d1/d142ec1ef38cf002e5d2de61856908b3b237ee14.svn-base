
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
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
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type : 'post',
                url : "${pageContext.request.contextPath}/teacherAction_checkXls.action",
                data : {'kpiFileUrl':'<s:property value="#parameters.data"/>'},
                success : function (data) {
                    console.log(data);
                    // 如果出错 将粗略的处理错误
                    if(data.error != null) {
                        window.location.href = '${pageContext.request.contextPath}/file_not_found.jsp';
                    }
                    // 回显成功 设置数据
                    $("#A0").text(data.A0);
                    $("#A1").text(data.A1);
                    $("#A2").text(data.A2);
                    $("#A3").text(data.A3);

                    $("#B0").text(data.B0);
                    $("#B1").text(data.B1);
                    $("#B2").text(data.B2);
                    $("#B3").text(data.B3);
                    $("#B4").text(data.B4);
                    $("#B5").text(data.B5);
                    $("#B6").text(data.B6);

                    $("#C0").text(data.C0);
                    $("#C1").text(data.C1);
                    $("#C2").text(data.C2);
                    $("#C3").text(data.C3);
                    $("#C4").text(data.C4);

                    $("#D0").text(data.D0);
                    $("#D1").text(data.D1);
                    $("#D2").text(data.D2);
                    $("#D3").text(data.D3);
                    $("#D4").text(data.D4);
                    $("#D5").text(data.D5);
                    $("#D6").text(data.D6);
                    $("#D7").text(data.D7);
                    $("#D8").text(data.D8);
                    $("#D9").text(data.D9);
                    $("#D10").text(data.D10);

                    $("#E0").text(data.E0);
                    $("#E1").text(data.E1);
                    $("#E2").text(data.E2);
                    $("#E3").text(data.E3);
                    $("#E4").text(data.E4);
                    $("#E5").text(data.E5);
                    $("#E6").text(data.E6);
                    $("#E7").text(data.E7);
                    $("#E8").text(data.E8);
                    $("#E9").text(data.E9);
                    $("#E10").text(data.E10);

                    $("#F0").text(data.F0);
                    $("#F1").text(data.F1);
                    $("#F2").text(data.F2);
                    $("#F3").text(data.F3);
                    $("#F4").text(data.F4);
                    $("#F5").text(data.F5);
                    $("#F6").text(data.F6);

                    $("#G0").text(data.G0);
                    $("#G1").text(data.G1);
                    $("#G2").text(data.G2);
                    $("#G3").text(data.G3);
                    $("#G4").text(data.G4);
                    $("#G5").text(data.G5);
                    $("#G6").text(data.G6);

                    $("#H0").text(data.H0);
                    $("#H1").text(data.H1);
                    $("#H2").text(data.H2);
                    $("#H3").text(data.H3);
                    $("#H4").text(data.H4);
                    $("#H5").text(data.H5);
                    $("#H6").text(data.H6);
                    $("#H7").text(data.H7);
                    $("#H8").text(data.H8);
                    $("#H9").text(data.H9);
                    $("#H10").text(data.H10);

                    $("#I0").text(data.I0);
                    $("#I1").text(data.I1);
                    $("#I2").text(data.I2);
                    $("#I3").text(data.I3);
                    $("#I4").text(data.I4);
                    $("#I5").text(data.I5);

                    $("#J0").text(data.J0);
                    $("#J1").text(data.J1);
                    $("#J2").text(data.J2);
                    $("#J3").text(data.J3);
                    $("#J4").text(data.J4);
                    $("#J5").text(data.J5);
                    $("#J6").text(data.J6);
                    $("#J7").text(data.J7);
                    $("#J8").text(data.J8);
                    $("#J9").text(data.J9);
                    $("#J10").text(data.J10);

                    $("#K0").text(data.K0);
                    $("#K1").text(data.K1);
                    $("#K2").text(data.K2);
                    $("#K3").text(data.K3);
                    $("#K4").text(data.K4);
                    $("#K5").text(data.K5);
                    $("#K6").text(data.K6);
                    $("#K7").text(data.K7);

                    $("#L0").text(data.L0);
                    $("#L1").text(data.L1);
                    $("#L2").text(data.L2);
                    $("#L3").text(data.L3);
                    $("#L4").text(data.L4);
                    $("#L5").text(data.L5);
                    $("#L6").text(data.L6);
                    $("#L7").text(data.L7);
                    $("#L8").text(data.L8);
                    $("#L9").text(data.L9);
                    $("#L10").text(data.L10);

                    $("#M0").text(data.M0);
                    $("#M1").text(data.M1);
                    $("#M2").text(data.M2);
                    $("#M3").text(data.M3);
                    $("#M4").text(data.M4);
                    $("#M5").text(data.M5);
                    $("#M6").text(data.M6);
                    $("#M7").text(data.M7);
                    $("#M8").text(data.M8);

                    $("#N0").text(data.N0);
                    $("#N1").text(data.N1);
                    $("#N2").text(data.N2);
                    $("#N3").text(data.N3);
                    $("#N4").text(data.N4);
                    $("#N5").text(data.N5);
                    $("#N6").text(data.N6);
                    $("#N7").text(data.N7);
                    $("#N8").text(data.N8);

                    $("#O0").text(data.O0);
                    $("#O1").text(data.O1);
                    $("#O2").text(data.O2);
                    $("#O3").text(data.O3);
                    $("#O4").text(data.O4);
                    $("#O5").text(data.O5);
                    $("#O6").text(data.O6);
                    $("#O7").text(data.O7);
                    $("#O8").text(data.O8);

                    $("#P0").text(data.P0);
                    $("#P1").text(data.P1);
                    $("#P2").text(data.P2);
                    $("#P3").text(data.P3);
                    $("#P4").text(data.P4);
                    $("#P5").text(data.P5);
                    $("#P6").text(data.P6);
                    $("#P7").text(data.P7);
                    $("#P8").text(data.P8);

                    $("#Q0").text(data.Q0);
                    $("#Q1").text(data.Q1);
                    $("#Q2").text(data.Q2);
                    $("#Q3").text(data.Q3);

                    $("#R0").text(data.R0);
                }
            })


        <%--检测直接上级评分项是否被批改过--%>


        })
    </script>
	<body style="margin:0px;padding:0px;">
        <div style="width: 100%; height: 30px; background-color: #00b7ee">
            <button style="align-content: center" type="button">增加</button>
            <button type="button">修改</button>
            <button type="button">删除</button>
            <button type="button">提交</button>
        </div>
		<div style="width: 100%;height: 50px;font-size: 30px;text-align:center;">员工关键绩效指标(KPI)表</div>
		<div style="width: 100%;height: 50px;font-size:24px;text-align:center;">(适用机关，教辅，后勤和学院其他岗位)</div>
		<div class="biaoge" contenteditable="ture" style="text-align:center;">
			<form method="post" action="#">
				<table border="1" style="margin:0 auto;border-collapse: collapse;align：left；table-layout:fixed; width:100%;height:100%;" onclick="this.contentEditable=true;" name="reset2">
					<tr>
						<th colspan="3" id="A0"></th>

						<th colspan="3" id="A1"></th>

						<th colspan="2" id="A2"></th>

						<th colspan="3" id="A3"></th>

					</tr>
					<tr>
						<td colspan="5" id="B0"></td>

						<td rowspan="2" id="B1"></td>
						<td rowspan="2" id="B2"></td>
						<td rowspan="2" id="B3"></td>
						<td rowspan="2" id="B4"></td>

						<td rowspan="2" id="B5"></td>
						<td rowspan="2" id="B6"></td>

					</tr>
					<tr>
						<td id="C0"></td>
						<td id="C1">（%）</td>
						<td id="C2" style="word-wrap: break-word;" width="200"></td>
						<td id="C3"></td>
						<td id="C4"></td>

					</tr>
					<tr>
						<td id="D0"></td>
						<td id="D1"></td>
						<td id="D2" ></td>
						<td id="D3"></td>
						<td id="D4"> </td>
						<td id="D5"></td>
						<td id="D6"></td>
						<td id="D7"></td>
						<td id="D8"></td>
						<td id="D9"></td>
						<td id="D10"></td>

					</tr>
					<tr>
						<td id="E0" rowspan="3"></td>

						<td id="E1" rowspan="3"></td>

						<td id="E2" style="word-wrap: break-word;" width="10">  </td>
						<td id="E3"></td>
						<td id="E4"></td>
						<td id="E5"></td>
						<td id="E6"></td>
						<td id="E7" rowspan="3"></td>
						<td id="E8" rowspan="3"></td>
						<td id="E9"></td>
						<td id="E10" ></td>

					</tr>
					<tr>

						<td id="F0"></td>
						<td id="F1"></td>
						<td id="F2"></td>
						<td id="F3"></td>
						<td id="F4"></td>
						<td id="F5"></td>
						<td id="F6"></td>

					</tr>
					<tr>
						<td id="G0"></td>
						<td id="G1"></td>
						<td id="G2"></td>
						<td id="G3"></td>
						<td id="G4"></td>
						<td id="G5"></td>
						<td id="G6"></td>

					</tr>

					<tr>
						<td id="H0" rowspan="2"></td>
						<td id="H1"  rowspan="2"></td>
						<td id="H2"></td>
						<td id="H3"></td>
						<td id="H4" rowspan="2"></td>
						<td id="H5"></td>
						<td id="H6"></td>
						<td id="H7" rowspan="2"></td>
						<td id="H8" rowspan="2"></td>
						<td id="H9"></td>
						<td id="H10"></td>

					</tr>
					<tr>
						<td id="I0" ></td>
						<td id="I1"></td>
						<td id="I2"></td>
						<td id="I3"></td>
						<td id="I4"></td>
						<td id="I5"></td>

					</tr>
					<tr>
						<td id="J0" rowspan="2"></td>
						<td id="J1" rowspan="2"></td>
						<td id="J2"></td>
						<td id="J3"></td>
						<td id="J4"></td>
						<td id="J5"></td>
						<td id="J6"></td>
						<td id="J7"></td>
						<td id="J8" rowspan="2"></td>
						<td id="J9"></td>
                        <td id="J10"></td>
					</tr>
						<tr >
						<td id="K0"></td>
						<td id="K1"></td>
						<td id="K2"></td>
						<td id="K3"></td>
						<td id="K4"></td>
						<td id="K5"></td>
						<td id="K6"></td>
						<td id="K7"></td>
					</tr>
						<tr>
						<td id="L0"  rowspan="5"></td>
						<td id="L1" rowspan="5"></td>
						<td id="L2"></td>
						<td id="L3"></td>
						<td id="L4"></td>
						<td id="L5"></td>
						<td id="L6"></td>
						<td id="L7" rowspan="5"></td>
						<td id="L8"></td>
						<td id="L9"></td>
						<td id="L10"></td>
					</tr>
						<tr>
						<td id="M0"></td>
						<td id="M1"></td>
						<td id="M2"></td>
						<td id="M3"></td>
						<td id="M4"></td>
						<td id="M5"></td>
						<td id="M6"></td>
						<td id="M7"></td>
						<td id="M8"></td>
					</tr>
						<tr>
						<td id="N0"></td>
						<td id="N1"></td>
						<td id="N2"></td>
						<td id="N3"></td>
						<td id="N4"></td>
						<td id="N5"></td>
						<td id="N6"></td>
						<td id="N7"></td>
					</tr>
						<tr >
						<td id="O0"></td>
						<td id="O1"></td>
						<td id="O2"></td>
						<td id="O3"></td>
						<td id="O4"></td>
						<td id="O5"></td>
						<td id="O6"></td>
						<td id="O7"></td>
					</tr>
						<tr>
						<td id="P0"></td>
						<td id="P1"></td>
						<td id="P2"></td>
						<td id="P3"></td>
						<td id="P4"></td>
						<td id="P5"></td>
						<td id="P6"></td>
						<td id="P7"></td>
					</tr>
						<tr>
						<td id="Q0" colspan="3"></td>
						<td id="Q1" colspan="5"></td>
						<td id="Q2"></td>
						<td id="Q3"></td>
						<td id="Q4"></td>
					</tr>

		            <tr>
						<td id="R0" colspan="11"></td>
					</tr>

				</table>
            </form>
        </div>
	</body>
    <%--<s:property value="#parameters.data"/>--%>
    <%--<s:debug></s:debug>--%>
</html>