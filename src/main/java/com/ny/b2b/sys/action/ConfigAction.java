/*
 * 上海集盛信息技术有限公司
 * www.91nongye.com
 */

package com.ny.b2b.sys.action;


import cn.org.rapid_framework.page.Page;
import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.sys.model.TsysConfigMo;
import com.ny.b2b.sys.query.TsysConfigQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.apache.commons.lang.StringUtils;

import java.util.List;


/**
 * @author  weilingfeng
 * @version 1.0
 * @since 1.0
 */


public class ConfigAction extends BaseStruts2Action implements Preparable,ModelDriven {
    //默认多列排序,example: username desc,createTime asc
    protected static final String DEFAULT_SORT_COLUMNS = null;
    private static final String CONFIGSERVICE = "tsysConfigManager";
    private static final String SERVICE ="tsysConfigManager";

    //forward paths
    protected static final String LIST_JSP= "/pages/sys/config/list.jsp";
    protected static final String CREATE_JSP = "/pages/sys/config/create.jsp";
    protected static final String EDIT_JSP = "/pages/sys/config/edit.jsp";
    protected static final String SHOW_JSP = "/pages/sys/config/show.jsp";

    private BaseService baseService;


    private TsysConfigMo tsysConfigMo;
    String id = null;
    private String[] items;
    public void setBaseService(BaseService baseService) {
        this.baseService = baseService;
    }
    public void prepare() throws Exception {
        if (isNullOrEmptyString(id)) {
            tsysConfigMo = new TsysConfigMo();
        } else {
            tsysConfigMo = (TsysConfigMo)baseService.getById(CONFIGSERVICE,id);
        }
    }

    /** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
    public Object getModel() {
        return tsysConfigMo;
    }

    public void setId(String val) {
        this.id = val;
    }

    public void setItems(String[] items) {
        this.items = items;
    }

    /** 执行搜索 */
    public String list() {

        TsysConfigQuery query = newQuery(TsysConfigQuery.class,DEFAULT_SORT_COLUMNS);
        Page page = baseService.findPage(SERVICE, query);

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
        formValidate(tsysConfigMo.getKeyName());
        String appIds = tsysConfigMo.getApp();
        tsysConfigMo.setApp(appIds!=null?appIds.replace(" ", ""):"");
        baseService.save(CONFIGSERVICE,tsysConfigMo);
        return writeAjaxResponse("1");
    }

    private String formValidate(String key){
        if (StringUtils.isNotBlank(key)) {
            TsysConfigQuery query = new TsysConfigQuery();
            query.setKeyName(key);
            List<TsysConfigMo> sysConfigList = baseService.find(SERVICE, query);
            if (sysConfigList != null && sysConfigList.size() > 0) {
                return writeAjaxResponse("2");
            }
        }
        return writeAjaxResponse("1");
    }

    /**进入更新页面*/
    public String edit() {
        return EDIT_JSP;
    }

    /**保存更新对象*/
    public String update() {
        String appIds = tsysConfigMo.getApp();
        tsysConfigMo.setApp(appIds != null ? appIds.replace(" ", "") : "");
        baseService.update(CONFIGSERVICE,this.tsysConfigMo);
        return writeAjaxResponse("1");
    }

    /**删除对象*/
    public String delete() {
        if(items!=null)
            for(String ids:items){
                String[] idArray = ids.split(",");
                for(String id:idArray)
                    baseService.removeById(CONFIGSERVICE,id);
            }
        return writeAjaxResponse("1");
    }
}
