package com.news.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.news.biz.NewsInfoBiz;
import com.news.biz.TopicBiz;
import com.news.entity.Admin;
import com.news.entity.NewsInfo;
import com.news.entity.Pager;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.bind.v2.model.core.ID;

public class NewsInfoAction extends ActionSupport implements RequestAware, SessionAware {

	Map<String, Object> request;
	Map<String, Object> session;
	NewsInfo newsInfo;
	TopicBiz topicBiz;
	NewsInfoBiz newsInfoBiz;
	Pager pager;
	int id;
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public NewsInfo getNewsInfo() {
		return newsInfo;
	}
	
	public void setNewsInfo(NewsInfo newsInfo) {
		this.newsInfo = newsInfo;
	}
	
	public TopicBiz getTopicBiz() {
		return topicBiz;
	}

	public void setTopicBiz(TopicBiz topicBiz) {
		this.topicBiz = topicBiz;
	}
	
	public NewsInfoBiz getNewsInfoBiz() {
		return newsInfoBiz;
	}

	public void setNewsInfoBiz(NewsInfoBiz newsInfoBiz) {
		this.newsInfoBiz = newsInfoBiz;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Get news list according to the query condition and page,
	 * And then dispatch to index page.
	 * @return struts action result name, get right response .jsp page according to this result.
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String index() throws Exception {
		int curPage = 1;
		List<NewsInfo> newsInfos = null;
		
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		
		if (newsInfo == null) {
			newsInfos = (List<NewsInfo>) newsInfoBiz.getAllNewsInfoByPage(curPage, 5);
			pager = newsInfoBiz.getPagerOfAllNewsInfo(5);
		} else {
			newsInfos = (List<NewsInfo>) newsInfoBiz.getNewsInfoByConditionAndPage(newsInfo, curPage, 5);
			pager = newsInfoBiz.getPagerOfNewsInfo(newsInfo, 5);
		}
		
		pager.setCurPage(curPage);
		request.put("newsInfoList", newsInfos);
		session.put("topicList", topicBiz.getAllTopics());
		request.put("pager", pager);
		
		return "index";
	}
	
	public String newsRead() throws Exception {
		NewsInfo newsInfo = newsInfoBiz.getNewsInfoById(id);
		request.put("newsInfo", newsInfo);
		return "news_read";
	}
	
	public String newsAdd() throws Exception {
		NewsInfo newsInfo = new NewsInfo();
		Admin admin = (Admin) session.get("admin");
		newsInfo.setAuthor(admin.getLoginName());
		newsInfoBiz.addNews(newsInfo);
		return "news_add";
	}
	
}
