<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<title>新闻发布系统</title>

</head>
<link type="text/css" rel="stylesheet" href="css/ryougi_css.css" />
<link type="text/css" rel="stylesheet" href="css/global.css" />
<body>
	<div id="main_container">
		<div id="banner">
			<div id="banner_logo"></div>
			<div id="banner_nav">
				<ul class="banner_nav_level1">
					<li class="banner_nav_level1_item">り
						<ul class="banner_nav_level2">
							<li><a></a></li>
							<li><a></a></li>
							<li><a></a></li>
						</ul>
					</li>
					<li class="banner_nav_level1_item">ょ
						<ul class="banner_nav_level2">
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</li>
					<li class="banner_nav_level1_item">う
						<ul class="banner_nav_level2">
							<li></li>
							<li></li>
						</ul>
					</li>
					<li class="banner_nav_level1_item">ぎ
						<ul class="banner_nav_level2">
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div id="main">
			<div id="main_pager">
				<s:if test="pager.curPage > 1">
					<a id="first" href="index?page.curPage=1&newsInfo.topic.id=${requestScope.newsInfo.topic.id}">First</a>
					<a id="pre" href="index?page.curPage=${pager.curPage - 1}&newsInfo.topic.id=${requestScope.newsInfo.topic.id}">Previous</a>
				</s:if><s:if test="pager.curPage < pager.pageCount">
					<a id="next" href="index?page.curPage=${pager.curPage - 1}&newsInfo.topic.id=${requestScope.newsInfo.topic.id}">Next</a>
					<a id="last" href="index?page.curPage=${pager.pageCount}&newsInfo.topic.id=${requestScope.newsInfo.topic.id}">Last</a>
				</s:if>
			</div>
			<div id="main_block">
				<div class="main_block_list" id="main_block_righttop">
					<s:form id="indexForm" action="index">
						<ul>
							<s:iterator id="news" value="#session.newsInfoList">
								<li><a href="newsread?id=${news.id}"><b>❅ </b>
											${news.title} <span><s:date name="%{#news.createDate}" format="MM/dd/yyyy" /></span></a>  </li>
							</s:iterator>
						</ul>
					</s:form>
				</div>
				<div class="main_block_square" id="main_block_lefttop">
					<ul>
						<li>り</li>
						<li>ょ</li>
						<li>う</li>
						<li>ぎ</li>
					</ul>
				</div>
				<div class="main_block_square" id="main_block_bottom">
					<ul>
						<li>り</li>
						<li id="main_block_bottom_left2">ょ</li>
						<li>う</li>
						<li>ぎ</li>
						<li>ょ</li>
						<li>う</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer">
			<div>
				Sun Yat-sen University Guangzhou,P.R.China &nbsp; |&nbsp; E-mail: <a
					href="mailto:ryougi.chan.fire@gmail.com">ryougi.chan.fire@gmail.com</a>
			</div>
			<div class="contact">
				Technic: <a href="">RyougiChan </a> <a href="login.jsp">Management</a> &nbsp;
				| &nbsp;Copyright © <a href="">RyougiChan</a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
	<script type="text/javascript" src="js/global.js"></script>
	<script type="text/javascript" src="js/ryougi_js.js"></script>
	<script type="text/javascript" src="js/ryougi_bg.js"></script>
	<script>

		(function(){
			var yetVisited = <%=request.getAttribute("loaded")%>;
		    if (!yetVisited) {
		    	$("#indexForm").submit();
 		    	/* $.post('index',$('#indexForm').serialize(),function(data){
 		    		console.log(data);
 		    	}); */
		    }
		})();
	
	</script>
</body>
</html>