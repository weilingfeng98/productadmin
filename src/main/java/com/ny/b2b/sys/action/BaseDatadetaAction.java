/*
 * JOY电子商务网运营事业部
 * 中国移动通信集团设计院有限公司
 * B2BJOY.COM  OPERATION  DIVISION
 * China Mobile Group Design Institute Co., Ltd
 */

package com.ny.b2b.sys.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.org.rapid_framework.page.Page;

import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.common.log.JoyLogger;
import com.ny.b2b.sys.model.TbaseDatadeta;
import com.ny.b2b.sys.model.TbaseDatatype;
import com.ny.b2b.sys.query.TbaseDatadetaQuery;
import com.ny.b2b.sys.query.TbaseDatatypeQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author  liuxin
 * @version 1.0
 * @since 1.0
 */


public class BaseDatadetaAction extends BaseStruts2Action implements Preparable,ModelDriven{
	private JoyLogger logger = JoyLogger.getLogger(getClass());
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/sys/datadeta/list.jsp";
	protected static final String CREATE_JSP = "/pages/sys/datadeta/create.jsp";
	protected static final String EDIT_JSP = "/pages/sys/datadeta/edit.jsp";
	protected static final String SHOW_JSP = "/pages/sys/datadeta/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/sys/datadeta/list.do";
	private List<TbaseDatatype> datatypeList = new ArrayList<TbaseDatatype>();
	private static final String SERVICE = "datadetaManager";
	private static final String datatypeSERVICE = "tbaseDatatypeManager";
	private BaseService baseService;
	
	private TbaseDatadeta tbaseDatadeta;
	String projId = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(projId)) {
			tbaseDatadeta = new TbaseDatadeta();
		} else {
			tbaseDatadeta = (TbaseDatadeta)baseService.getById(SERVICE,projId);
		}
	}

	public Object getModel() {
		return tbaseDatadeta;
	}

	public void setProjId(String projId) {
		this.projId = projId;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		TbaseDatadetaQuery detaQuery = newQuery(TbaseDatadetaQuery.class,"DATATYPE_ID,SN");
		Page page = baseService.findPage(SERVICE,detaQuery);
		getRequest().setAttribute("page", page);
		return LIST_JSP;
	}
	public void getDataList(){
		TbaseDatatypeQuery query = newQuery(TbaseDatatypeQuery.class,DEFAULT_SORT_COLUMNS);
		query.setPageSize(100);
		Page page = baseService.findPage(datatypeSERVICE,query);
		for(Object obj:page.getResult()){
			TbaseDatatype datatype = (TbaseDatatype)obj;
			datatypeList.add(datatype);
		}
	}
	/** 查看对象*/
	public String show() {
		return SHOW_JSP;
	}
	
	/** 进入新增页面*/
	public String create() {
		getDataList();
		getRequest().setAttribute("datatypeList", datatypeList);
		return CREATE_JSP;
	}
	
	/** 保存新增对象 */
	public String save() {
		String projId = getRequest().getParameter("projId")==""?"":getRequest().getParameter("projId");
		String projName = getRequest().getParameter("projName")==""?"":getRequest().getParameter("projName");
		String sn = getRequest().getParameter("sn")==""?"1":getRequest().getParameter("sn");
		String datatypeId = getRequest().getParameter("datatypeId")==""?"":getRequest().getParameter("datatypeId");
		TbaseDatadeta tbaseDatadeta = new TbaseDatadeta();
		tbaseDatadeta.setProjId(projId);
		tbaseDatadeta.setProjName(projName);
		tbaseDatadeta.setSn(Integer.parseInt(sn));
		tbaseDatadeta.setDatatypeId(datatypeId);
		baseService.save(SERVICE,tbaseDatadeta);
		return writeAjaxResponse("1");
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		baseService.update(SERVICE,this.tbaseDatadeta);
		return writeAjaxResponse("1");
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

	public BaseService getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}
	
	
}
