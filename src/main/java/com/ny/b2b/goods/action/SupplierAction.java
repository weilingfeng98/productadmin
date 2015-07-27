/*
 * 上海集盛信息技术有限公司
 * www.91nongye.com  OPERATION  DIVISION
 */

package com.ny.b2b.goods.action;

import cn.org.rapid_framework.page.Page;

import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.goods.model.SupplierMo;
import com.ny.b2b.goods.vo.query.SupplierQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author LYH
 * @version 1.0
 * @since 1.0
 */


@SuppressWarnings("rawtypes")
public class SupplierAction extends BaseStruts2Action implements Preparable,ModelDriven{
	private static final long serialVersionUID = 1L;

	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/goods/supplier/list.jsp";
	protected static final String CREATE_JSP = "/pages/goods/supplier/create.jsp";
	protected static final String EDIT_JSP = "/pages/goods/supplier/edit.jsp";
	protected static final String SHOW_JSP = "/pages/goods/supplier/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/goods/supplier/list.do";
	
	private BaseService baseService;
	public static final String SERVICE = "supplierManager";
	
	private SupplierMo supplierMo;
	String id = null;
	private String[] items;
	
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			supplierMo = new SupplierMo();
		} else {
			supplierMo = (SupplierMo)baseService.getById(SERVICE,id);
		}
	}
	
	public Object getModel() {
		return supplierMo;
	}
	
	public void setId(String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		
		SupplierQuery query = newQuery(SupplierQuery.class,DEFAULT_SORT_COLUMNS);
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
		baseService.save(SERVICE,supplierMo);
		return writeAjaxResponse("1");
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		baseService.update(SERVICE,this.supplierMo);
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
