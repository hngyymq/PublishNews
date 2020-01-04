package com.ymq.service;

import java.util.List;

import com.ymq.bean.AjaxResult;
import com.ymq.bean.News;

public interface NewsService {

	void publish(AjaxResult result, News news);
	List<News> queryAllNews();
	int queryNewsCount();
	News queryNewsByID(Integer newsId);
	void updateNews(AjaxResult result, News news);
	void deleteNews(AjaxResult result,Integer newsId);
}
