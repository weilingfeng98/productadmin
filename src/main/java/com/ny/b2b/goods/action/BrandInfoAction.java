/*
 * 上海集盛信息技术有限公司
 * www.91nongye.com  OPERATION  DIVISION
 */

package com.ny.b2b.goods.action;

import cn.org.rapid_framework.page.Page;

import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.goods.model.BrandInfoMo;
import com.ny.b2b.goods.vo.query.BrandInfoQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author LYH
 * @version 1.0
 * @since 1.0
 */


public class BrandInfoAction extends BaseStruts2Action implements Preparable,ModelDriven{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/goods/brandinfo/list.jsp";
	protected static final String CREATE_JSP = "/pages/goods/brandinfo/create.jsp";
	protected static final String EDIT_JSP = "/pages/goods/brandinfo/edit.jsp";
	protected static final String SHOW_JSP = "/pages/goods/brandinfo/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/goods/brandinfo/list.do";
	public static final String SERVICE = "brandInfoManager";
	private BaseService baseService;
	
	
	private BrandInfoMo brandInfoMo;
	String id = null;
	private String[] items;
	
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			brandInfoMo = new BrandInfoMo();
		} else {
			brandInfoMo = (BrandInfoMo)baseService.getById(SERVICE,id);
		}
	}
	
	
	public Object getModel() {
		return brandInfoMo;
	}
	
	public void setId(String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		
		BrandInfoQuery query = newQuery(BrandInfoQuery.class,DEFAULT_SORT_COLUMNS);
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
		baseService.save(SERVICE,brandInfoMo);
		return writeAjaxResponse("1");
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		baseService.update(SERVICE,this.brandInfoMo);
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
