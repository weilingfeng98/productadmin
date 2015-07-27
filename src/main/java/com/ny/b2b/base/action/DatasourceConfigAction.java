/*
 * JOY电子商务网运营事业部
 * 中国移动通信集团设计院有限公司
 * B2BJOY.COM  OPERATION  DIVISION
 * China Mobile Group Design Institute Co., Ltd
 */

package com.ny.b2b.base.action;

import cn.org.rapid_framework.page.Page;
import com.ny.b2b.base.model.DatasourceConfigMo;
import com.ny.b2b.base.vo.query.DatasourceConfigQuery;
import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.helper.ServiceContext;
import com.ny.b2b.common.hessian.service.BaseService;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import java.util.Date;

/**
 * @author  zongtt
 * @version 1.0
 * @since 1.0
 */


public class DatasourceConfigAction extends BaseStruts2Action implements Preparable,ModelDriven{
    
	/**
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
     */
    private static final long serialVersionUID = -8654149720244996534L;

    //默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/base/datasourceConfig/list.jsp";
	protected static final String CREATE_JSP = "/pages/base/datasourceConfig/create.jsp";
	protected static final String EDIT_JSP = "/pages/base/datasourceConfig/edit.jsp";
	protected static final String SHOW_JSP = "/pages/base/datasourceConfig/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/base/datasourceConfig/list.do";
	
	private BaseService comBaseService;
	private static final String SERVICE = "datasourceConfigManager";
	
	private DatasourceConfigMo datasourceConfigMo;
	String id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
            datasourceConfigMo = new DatasourceConfigMo();
		} else {
            datasourceConfigMo = (DatasourceConfigMo)comBaseService.getById(SERVICE, id);
		}
	}

	public Object getModel() {
		return datasourceConfigMo;
	}

	public void setId(String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		
		DatasourceConfigQuery query = newQuery(DatasourceConfigQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = comBaseService.findPage(SERVICE,query);
		
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
        datasourceConfigMo.setCreator(ServiceContext.getUserId());
        datasourceConfigMo.setInsertTime(new Date());
	    comBaseService.save(SERVICE,datasourceConfigMo);
		return writeAjaxResponse("1");
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
        datasourceConfigMo.setUpdateTime(new Date());
	    comBaseService.update(SERVICE,this.datasourceConfigMo);
		return writeAjaxResponse("1");
	}
	
	/**删除对象*/
	public String delete() {
		if(items!=null)
			for(String ids:items){
				String[] idArray = ids.split(",");
				for(String id:idArray)
				    comBaseService.removeById(SERVICE,id);
			}
		return writeAjaxResponse("1");
	}

    
    public BaseService getComBaseService() {
        return comBaseService;
    }
    
    public void setComBaseService(BaseService comBaseService) {
        this.comBaseService = comBaseService;
    }
	
}
