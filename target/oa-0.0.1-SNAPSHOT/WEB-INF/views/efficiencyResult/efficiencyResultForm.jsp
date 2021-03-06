<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<script src="${ctx }/static/My97/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工月度效能</title>
</head>
<body>
	<div class="container">
		<table class="table-condensed">
			<tr>
				<td>部门：</td>
				<td>${er.departmentName }</td>
				<td>工号：</td>
				<td>${er.employeCode }</td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td>${er.employeName }</td>
				<td>时间：</td>
				<td><fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</table>
	</div>
	<div>
		<hr />
	</div>
	<h6>项目详情</h6>
	<c:forEach items="${pros}" var="pro">
	<div class="container"> 
		<table class=" table-condensed">
			<tr>
				<td>项目：</td>
				<td>${pro.name }</td>
			</tr>
			<tr>
				<td>项目状态：</td>
				<td><c:if test="${pro.state == 1}">已完成</c:if> <c:if
						test="${pro.state != 1}">进行中</c:if></td>
			</tr>
			<tr>
				<td>项目经理：</td>
				<td>${pro.pm }</td>
			</tr>
		</table>
		</div>
		<div class="container"> 
		<table class="table-striped table-bordered table-condensed">
			<tr>
				<td>周期：</td>
				<c:forEach items="${es }" var="es">
					<c:if test="${es.projectId == pro.id }">
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${es.planBeginTime }" />~<fmt:formatDate
								pattern="yyyy-MM-dd" value="${es.planEndTime }" /></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td>计划工时：</td>
				<c:forEach items="${es }" var="es">
					<c:if test="${es.projectId == pro.id }">
						<td>${es.planHours }</td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td>实际工时：</td>
				<c:forEach items="${es }" var="es">
					<c:if test="${es.projectId == pro.id }">
						<td>${es.actualHours }</td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td>产出工时：</td>
				<c:forEach items="${es }" var="es">
					<c:if test="${es.projectId == pro.id }">
						<td>${es.outputHours }</td>
					</c:if>
				</c:forEach>
			</tr>
		</table>
		</div>
		<div>
			<hr />
		</div>
	</c:forEach>
	<h6>统计</h6>
	<div class="container"> 
		<table class="table-condensed">
			<tr>
				<td>时间：</td>
				<td><fmt:formatDate value="${beginTime }" pattern="yyyy-MM-dd" />~<fmt:formatDate
						value="${endTime }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>计划工时：</td>
				<td>${er.planHours }小时</td>
			</tr>
			<tr>
				<td>实际工时：</td>
				<td>${er.actualHours }小时</td>
			</tr>
			<tr>
				<td>产出工时：</td>
				<td>${er.outputHours }小时</td>
			</tr>
			<tr>
				<td>标准工时：</td>
				<td>${er.basicHours }小时</td>
			</tr>
			<tr>
				<td>负荷率：</td>
				<td>${er.loadRate}%</td>
			</tr>
			<tr>
				<td>效率：</td>
				<td>${er.efficiencyPercentage}%</td>
			</tr>
			<tr>
				<td>效能总分：</td>
				<td>${er.efficiencyTotalScore }</td>
			</tr>
		</table>
		</div>
</body>
</html>