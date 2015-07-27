
package com.ny.b2b.goods.action;

import cn.org.rapid_framework.page.Page;

import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.goods.model.GoodsInfoMo;
import com.ny.b2b.goods.model.SupplierMo;
import com.ny.b2b.goods.vo.query.GoodsInfoQuery;
import com.ny.b2b.goods.vo.query.SupplierQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import java.util.List;

/**
 * @author  zongtt
 * @version 1.0
 * @since 1.0
 */


public class GoodsInfoAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/goods/goodsinfo/list.jsp";
	protected static final String CREATE_JSP = "/pages/goods/goodsinfo/create.jsp";
	protected static final String EDIT_JSP = "/pages/goods/goodsinfo/edit.jsp";
	protected static final String SHOW_JSP = "/pages/goods/goodsinfo/show.jsp";
	protected static final String DEMO_JSP = "/pages/goods/goodsinfo/demo.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/goods/info/list.do";
	
	private BaseService baseService;
	
	public BaseService getBaseService() {
		return baseService;
	}
	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}

	public static final String SERVICE = "goodsInfoManager";

    public static final String SUPPLIER_SERVICE = "supplierManager";
	
	private GoodsInfoMo goodsInfoMo;
	String id = null;
	private String[] items;
	
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			goodsInfoMo = new GoodsInfoMo();
		} else {
			goodsInfoMo = (GoodsInfoMo)baseService.getById(SERVICE,id);
		}
	}
	
	
	public Object getModel() {
		return goodsInfoMo;
	}
	
	public void setId(String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		
		GoodsInfoQuery query = newQuery(GoodsInfoQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = baseService.findPage(SERVICE,query);

		getRequest().setAttribute("page", page);
		return LIST_JSP;
	}
	
	/** 查看对象*/
	public String show() {
		return SHOW_JSP;
	}
	

	/** 查看对象*/
	public String demo() {
		return DEMO_JSP;
	}
	
	/** 进入新增页面*/
	public String create() {
		return CREATE_JSP;
	}
	
	/** 保存新增对象 */
	public String save() {
		baseService.save(SERVICE,goodsInfoMo);
		return writeAjaxResponse("1");
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {

		baseService.update(SERVICE,this.goodsInfoMo);
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
}
