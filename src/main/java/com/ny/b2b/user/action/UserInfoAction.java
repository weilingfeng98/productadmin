/*
 * JOY电子商务网运营事业部
 * 中国移动通信集团设计院有限公司
 * B2BJOY.COM  OPERATION  DIVISION
 * China Mobile Group Design Institute Co., Ltd
 */

package com.ny.b2b.user.action;


import cn.org.rapid_framework.page.Page;
import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.user.model.UserInfoMo;
import com.ny.b2b.user.query.UserInfoQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author  zongtt
 * @version 1.0
 * @since 1.0
 */


public class UserInfoAction extends BaseStruts2Action implements Preparable,ModelDriven {
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String LIST_JSP= "/pages/user/list.jsp";
	protected static final String CREATE_JSP = "/pages/user/create.jsp";
	protected static final String EDIT_JSP = "/pages/user/edit.jsp";
	protected static final String SHOW_JSP = "/pages/user/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/user/list.do";
	String id = null;
	private UserInfoMo userInfoMo;
    private BaseService baseService;

    public static final String SERVER = "userInfoManager";

	private String[] items;
	
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			userInfoMo = new UserInfoMo();
		} else {
			userInfoMo = (UserInfoMo)baseService.getById(SERVER,id);
		}
	}

	public Object getModel() {
		return userInfoMo;
	}
	
	public void setId(String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		
		UserInfoQuery query = newQuery(UserInfoQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = baseService.findPage(SERVER,query);
		
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
		baseService.save(SERVER, userInfoMo);
		return writeAjaxResponse("1");
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		baseService.update(SERVER, this.userInfoMo);
		return writeAjaxResponse("1");
	}
	
	/**删除对象*/
	public String delete() {
		if(items!=null)
			for(String ids:items){
				String[] idArray = ids.split(",");
				for(String id:idArray)
				baseService.removeById(SERVER,id);
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
