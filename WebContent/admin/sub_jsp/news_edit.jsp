<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑新闻</title>
<link type="text/css" rel="stylesheet" href="../../css/global.css" />
<link type="text/css" rel="stylesheet" href="../css/admin.css" />
</head>
<body>
	<div id="right_container">
		<div id="right_list">
			<ul>
				<li>
					<p>标题</p>
					<p>更新时间</p>
					<p>状态</p>
					<p>操作</p>
				</li>
				<s:iterator id="news" value="#session.newsInfoList8">
					<li><p>
							<a href="newsread?id=${news.id}"> ${news.title}</a>
						</p>
						<p>更新时间</p>
						<p>已审核</p>
						<p>编辑 查看 删除</p></li>
				</s:iterator>
			</ul>
			<div id="list_nav">
				<ul id="pagination" class="pagination-sm"></ul>
			</div>
		</div>
		<div id="right_form">
			<h1>编辑新闻</h1>
			<form action="queryNews" method="POST">
				<div id="keywords">
					<div class="label">关键字</div>
					<input type="text" name="newsInfo.title" /> <input class="inputBtn"
						type="submit" value="检索" />
				</div>
				<div id="topic">
					<div class="label">主题</div>
					<s:select name="newsInfo.topic.id" list="#session.topicList"
						listKey="id" listValue="name"></s:select>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="../../js/jquery-3.1.0.js"></script>
	<script type="text/javascript" src="../../js/jquery.twbsPagination.min.js"></script>
	<script type="text/javascript" src="../script/admin.js"></script>
</body>
</html>