package com.news.biz.impl;

import java.util.List;

import com.news.biz.NewsInfoBiz;
import com.news.dao.NewsInfoDAO;
import com.news.entity.NewsInfo;
import com.news.entity.Pager;

public class NewsInfoBizImpl implements NewsInfoBiz {
	
	NewsInfoDAO newsInfoDAO;
	public void setNewsInfoDAO(NewsInfoDAO newsInfoDAO) {
		this.newsInfoDAO = newsInfoDAO;
	}
	/**
	 * 获得指定页码page的列表，列表记录为pageSize
	 */
	@Override
	public List<?> getAllNewsInfoByPage(int page, int pageSize) {
		return newsInfoDAO.getAllNewsInfoByPage(page, pageSize);
	}
	/**
	 * 根据分页大小返回分页对象
	 * @return 分页对象信息
	 */
	@Override
	public Pager getPagerOfAllNewsInfo(int pageSize) {
		int count = newsInfoDAO.getCountOfAllNewsInfo();
		Pager pager = new Pager();
		pager.setPerPageRows(pageSize);
		pager.setRowCount(count);
		return pager;
	}

	@Override
	public List<?> getNewsInfoByConditionAndPage(NewsInfo condition, int page, int pageSize) {
		return newsInfoDAO.getNewsInfoByConditionAndPage(condition, page, pageSize);
	}

	@Override
	public Pager getPagerOfNewsInfo(NewsInfo condition, int pageSize) {
		int count = newsInfoDAO.getCountOfNewsInfo(condition);
		Pager pager = new Pager();
		pager.setPerPageRows(pageSize);
		pager.setRowCount(count);
		return pager;
	}

	@Override
	public NewsInfo getNewsInfoById(int id) {
		return newsInfoDAO.getNewsInfoById(id);
	}

	@Override
	public void addNews(NewsInfo newsInfo) {
		newsInfoDAO.addNews(newsInfo);
	}

	@Override
	public void updateNews(NewsInfo newsInfo) {
		newsInfoDAO.updateNews(newsInfo);
	}

	@Override
	public void deleteNews(NewsInfo newsInfo) {
		newsInfoDAO.deleteNews(newsInfo);
	}
	
	

}
