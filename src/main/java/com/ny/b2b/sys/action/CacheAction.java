package com.ny.b2b.sys.action;

import cn.org.rapid_framework.page.Page;
import com.alibaba.fastjson.JSON;
import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.cache.CacheObject;
import com.ny.b2b.common.cache.JoyMemcachedClient;
import com.ny.b2b.common.cache.impl.RedisClient;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.common.log.JoyLogger;
import com.ny.b2b.hs.cache.service.CacheConfigService;
import com.ny.b2b.sys.model.TcacheConfigMo;
import com.ny.b2b.sys.query.TcacheConfigQuery;
import com.ny.b2b.sys.util.CacheConfig;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import net.rubyeye.xmemcached.KeyIterator;
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import org.apache.commons.lang.StringUtils;

import java.net.InetSocketAddress;
import java.util.*;
import java.util.concurrent.TimeoutException;


/**
 * @author  weilingfeng
 * @version 1.0
 * @since 1.0
 */
public class CacheAction extends BaseStruts2Action implements Preparable,ModelDriven {
    private JoyLogger logger = JoyLogger.getLogger(getClass());
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/sys/cache/list.jsp";
	protected static final String mLIST_JSP= "/pages/sys/cache/memcachelist.jsp";
	protected static final String CREATE_JSP = "/pages/sys/cache/create.jsp";
	protected static final String EDIT_JSP = "/pages/sys/cache/edit.jsp";
	protected static final String SHOW_JSP = "/pages/sys/cache/show.jsp";
	protected static final String MESSAGE_JSP="/pages/sys/cache/message.jsp";
	protected static final String RELIST_JSP= "/pages/sys/cache/listRE.jsp";
	protected static final String RESHOW_JSP = "/pages/sys/cache/showRE.jsp";
	//redirect paths,startWith: !
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/sys/cache/list.do";
	private static final String SERVICE = "tcacheConfigManager";
	
	private CacheConfigService cacheConfigService;
	private BaseService baseService;
	private JoyMemcachedClient joyMemcachedClient;
	private RedisClient redisClient;
	
	
	private TcacheConfigMo TcacheConfigMo;
	String id = null;
	private String[] items;
	
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
            TcacheConfigMo = new TcacheConfigMo();
		} else {
			TcacheConfigMo = (TcacheConfigMo)baseService.getById(SERVICE,id);
		}
	}
	public String listRE(){
        TcacheConfigQuery query = newQuery(TcacheConfigQuery.class,null);
		Set<String> set;
		if(query.getCacheKey()==null||query.getCacheKey().equals("")){
			set=redisClient.keySet("*");			
		}else{
			set=redisClient.keySet("*"+query.getCacheKey()+"*");
		}		
		List<CacheObject> listcatch=redisClient.getCacheObjectList(new ArrayList<String>(set));
		if(listcatch==null||listcatch.size()==0){
			return RELIST_JSP;
		}
		List<CacheConfig> list=new ArrayList<CacheConfig>();
		for(CacheObject<?> co:listcatch){
			if(co!=null && !co.equals("")){
			CacheConfig cache=new CacheConfig();
			cache.setCacheKey(co.getKey());
			cache.setCacheName(getCacheNameRE(co.getKey()));
			cache.setInsertTime(co.getInsertTime());
			cache.setIp(co.getIp());
			cache.setUserId(co.getUserId());
			cache.setAppContext(co.getAppContext());
			list.add(cache);
		}
		}
		int total = list.size();
		//分页处理
		if(list.size() > query.getPageSize()){
			int begin = (query.getPageNumber() - 1) * query.getPageSize();
			int end = begin + query.getPageSize();
			if (end > list.size()) {
				end = list.size();
			}
			list = list.subList(begin, end);
		}
		Page page =  new Page(query.getPageNumber(),query.getPageSize(),total,list);
		getRequest().setAttribute("page", page);
		return RELIST_JSP;
		
	}
	public String getCacheNameRE(String key){
        TcacheConfigQuery query = new TcacheConfigQuery();
		String keyvalue="";
		if(key.indexOf(":") != -1){
			keyvalue= key.substring(0, key.indexOf(":"));
			
		}else{
			 keyvalue=key;
		}
		query.setCacheKey(keyvalue);
		List<TcacheConfigMo> list=baseService.find(SERVICE,query);
		if(list!=null &&list.size()!=0){
			return list.get(0).getCacheName();
		}else{
			return "";
		}
		
	}
	public String showRE(){
		String key = getRequest().getParameter("id");
		Object value = redisClient.get(key);		
		String result = "";		
		if(value != null){
			if(value instanceof String){
				result = value.toString();
			}else{
				result = JSON.toJSONString(value);
			}
		}	
		 Set set=redisClient.keySet("*"+key+"*");
		 List<CacheObject> listcatch=redisClient.getCacheObjectList(new ArrayList<String>(set));
			List<CacheConfig> list=new ArrayList<CacheConfig>();
			for(CacheObject<?> co:listcatch){
				CacheConfig cache=new CacheConfig();
				cache.setCacheKey(co.getKey());
				cache.setCacheName(getCacheNameRE(co.getKey()));
				cache.setInsertTime(co.getInsertTime());
				cache.setIp(co.getIp());
				cache.setUserId(co.getUserId());
				cache.setAppContext(co.getAppContext());
				list.add(cache);
			}
		getRequest().setAttribute("key", key);
		getRequest().setAttribute("entry", list.get(0));
		getRequest().setAttribute("result", result);
		return RESHOW_JSP;
	}
	public String delRE(){
		if(items!=null)
			for(String ids:items){
				String[] idArray = ids.split(",");
				for(String id:idArray)
					redisClient.delete(id);
			}
		return writeAjaxResponse("1");
		
	}
	/** 执行搜索 */
	public String list() {
        TcacheConfigQuery query = newQuery(TcacheConfigQuery.class,"INSERT_TIME DESC");
		Page page = baseService.findPage(SERVICE,query);
		getRequest().setAttribute("page", page);
		return LIST_JSP;
	}
	public String showMessage(){
		String key = getRequest().getParameter("id");
		Object value = joyMemcachedClient.get(key);		
		String result = "";		
		if(value != null){
			if(value instanceof String){
				result = value.toString();
			}else{
				result = JSON.toJSONString(value);
			}
		}	    
		getRequest().setAttribute("key", id);
		getRequest().setAttribute("result", result);
		
		return MESSAGE_JSP;
	}
	public String getCacheName(Map<String,String> map,String key){
		if(map.containsKey(key)){
			return map.get(key);
			
		}else{
			if(key.indexOf(":") != -1){
				return key.substring(0, key.indexOf(":"));
				
			}else{
				return key;
			}
		}
	}
	/** 执行搜索 */
	@SuppressWarnings("deprecation")
	public String mlist() {
        TcacheConfigQuery query = newQuery(TcacheConfigQuery.class,null);
		MemcachedClient memcachedClient = joyMemcachedClient.getMemcachedClient();
		List<TcacheConfigMo> list = new ArrayList<TcacheConfigMo>(20000);
		Map<String,String> cacheMap = cacheConfigService.fandAllForMap();
		try {
//			for(int i=1;i<15000;i++){
//				memcachedClient.set("test"+i,3000,"test"+i);
//			}
			String queryKey = query.getCacheKey();
			Collection<InetSocketAddress> addressList = memcachedClient.getAvaliableServers();
			if(addressList.size() > 0){
				for(InetSocketAddress itAddress:addressList){
					KeyIterator it=memcachedClient.getKeyIterator(itAddress);
					while(it.hasNext())
					{
						String key=it.next();
						if(!StringUtils.isEmpty(queryKey)){
							if(key.contains(queryKey)){
								TcacheConfigMo sys = new TcacheConfigMo();
								sys.setCacheKey(key);
								sys.setCacheName(getCacheName(cacheMap,key));
								list.add(sys);
							}
						}else{
							TcacheConfigMo sys = new TcacheConfigMo();
							sys.setCacheKey(key);
							sys.setCacheName(getCacheName(cacheMap,key));
							list.add(sys);
						}

					}
				}
			}
		} catch (MemcachedException e) {
			logger.error(e.toString(), e);
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (TimeoutException e) {
			e.printStackTrace();
		}
		int total = list.size();
		//分页处理
		if(list.size() > query.getPageSize()){
			int begin = (query.getPageNumber() - 1) * query.getPageSize();
			int end = begin + query.getPageSize();
			if (end > list.size()) {
				end = list.size();
			}
			list = list.subList(begin, end);
		}
		Page page =  new Page(query.getPageNumber(),query.getPageSize(),total,list);
		getRequest().setAttribute("page", page);
		return mLIST_JSP;
	}
	
	
	/**删除对象*/
	public String delete() {
		if(items!=null)
			for(String ids:items){
				String[] idArray = ids.split(",");
				for(String id:idArray)
				baseService.removeById(SERVICE,id);
			}
		return writeAjaxResponse("1");
	}
	/**删除对象*/
	public String deleteMemcached() {
		MemcachedClient memcachedClient = joyMemcachedClient.getMemcachedClient();
		if(items!=null)
			for(String ids:items){
				String[] idArray = ids.split(",");
				for(String id:idArray)
					try {
						memcachedClient.delete(id);
					} catch (TimeoutException e) {
						e.printStackTrace();
					} catch (InterruptedException e) {
						e.printStackTrace();
					} catch (MemcachedException e) {
						e.printStackTrace();
					}
			}
		return writeAjaxResponse("1");
	}
	
	/**
	 * 刷新服务器中的所有缓存内容。
	 */
	public String flushAll(){
		MemcachedClient memcachedClient = joyMemcachedClient.getMemcachedClient();
		try {
			memcachedClient.flushAll();
		} catch (TimeoutException e) {
			e.printStackTrace();
			return writeAjaxResponse("缓存服务器响应超时！");
		} catch (InterruptedException e) {
			e.printStackTrace();
			return writeAjaxResponse("刷新过程被中断！");
		} catch (MemcachedException e) {
			e.printStackTrace();
			return writeAjaxResponse("缓存服务器异常！");
		}
		return writeAjaxResponse("1");
	}


    public CacheConfigService getCacheConfigService() {
        return cacheConfigService;
    }

    public void setCacheConfigService(CacheConfigService cacheConfigService) {
        this.cacheConfigService = cacheConfigService;
    }

    public BaseService getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}
	
	
	public JoyMemcachedClient getJoyMemcachedClient() {
		return joyMemcachedClient;
	}


	public void setJoyMemcachedClient(JoyMemcachedClient joyMemcachedClient) {
		this.joyMemcachedClient = joyMemcachedClient;
	}


	public Object getModel() {
		return TcacheConfigMo;
	}
	
	public void setId(String val) {
		this.id = val;
	}
	
	public void setItems(String[] items) {
		this.items = items;
	}

	public void setRedisClient(RedisClient redisClient) {
		this.redisClient = redisClient;
	}
}