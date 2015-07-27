/*
 * JOY电子商务网运营事业部
 * 中国移动通信集团设计院有限公司
 * B2BJOY.COM  OPERATION  DIVISION
 * China Mobile Group Design Institute Co., Ltd
 */

package com.ny.b2b.sys.action;

import cn.org.rapid_framework.page.Page;
import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.common.log.JoyLogger;
import com.ny.b2b.sys.model.TbaseDatatype;
import com.ny.b2b.sys.query.TbaseDatatypeQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author  liuxin
 * @version 1.0
 * @since 1.0
 */


public class BasedataAction extends BaseStruts2Action implements Preparable,ModelDriven {
	private JoyLogger logger = JoyLogger.getLogger(getClass());
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/sys/basedata/list.jsp";
	protected static final String CREATE_JSP = "/pages/sys/basedata/create.jsp";
	protected static final String EDIT_JSP = "/pages/sys/basedata/edit.jsp";
	protected static final String SHOW_JSP = "/pages/sys/basedata/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/sys/basedata/list.do";
	
	private static final String SERVICE = "tbaseDatatypeManager";
	private BaseService baseService;
	
	private TbaseDatatype tbaseDatatype;
	String datatypeId = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(datatypeId)) {
			tbaseDatatype = new TbaseDatatype();
		} else {
			tbaseDatatype = (TbaseDatatype)baseService.getById(SERVICE,datatypeId);
		}
	}

	/** 执行搜索 */
	public String list() {

		TbaseDatatypeQuery query = newQuery(TbaseDatatypeQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = baseService.findPage(SERVICE,query);

		getRequest().setAttribute("page", page);
		return LIST_JSP;
	}

	/** 查看对象*/
	public String show() {
		return SHOW_JSP;
	}

	/** 进入新增页面*/
	public String create() {
		return CREATE_JSP;
	}

	/** 保存新增对象 */
	public String save() {
		String datatypeId = getRequest().getParameter("datatypeId")==""?"":getRequest().getParameter("datatypeId");
		String datatypeName = getRequest().getParameter("datatypeName")==""?"":getRequest().getParameter("datatypeName");
		TbaseDatatype baseDatatype = new TbaseDatatype();
		baseDatatype.setDatatypeId(datatypeId);
		baseDatatype.setDatatypeName(datatypeName);
		baseService.save(SERVICE,baseDatatype);
		return writeAjaxResponse("1");
	}

	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}

	/**保存更新对象*/
	public String update() {
		String datatypeId = getRequest().getParameter("datatypeId")==""?"":getRequest().getParameter("datatypeId");
		String datatypeName = getRequest().getParameter("datatypeName")==""?"":getRequest().getParameter("datatypeName");
		TbaseDatatype baseDatatype = new TbaseDatatype();
		baseDatatype.setDatatypeId(datatypeId);
		baseDatatype.setDatatypeName(datatypeName);
		baseService.update(SERVICE,baseDatatype);
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


	public Object getModel() {
		return tbaseDatatype;
	}

	public void setDatatypeId(String datatypeId) {
		this.datatypeId = datatypeId;
	}
	
	public void setItems(String[] items) {
		this.items = items;
	}
	
	
}
