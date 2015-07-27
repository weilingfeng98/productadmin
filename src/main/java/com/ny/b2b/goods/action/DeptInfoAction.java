/*
 * 上海集盛信息技术有限公司
 * www.91nongye.com  OPERATION  DIVISION
 */

package com.ny.b2b.goods.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sourceforge.pinyin4j.PinyinHelper;

import org.apache.commons.lang.StringUtils;

import cn.org.rapid_framework.page.Page;

import com.alibaba.fastjson.JSONObject;
import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.base.IdGenerator;
import com.ny.b2b.common.constant.ModuleCode;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.common.log.JoyLogger;
import com.ny.b2b.common.util.Constant;
import com.ny.b2b.goods.model.DeptInfoMo;
import com.ny.b2b.goods.model.GoodsCatMo;
import com.ny.b2b.goods.vo.query.DeptInfoQuery;
import com.ny.b2b.goods.vo.query.GoodsCatQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author LYH
 * @version 1.0
 * @since 1.0
 */


public class DeptInfoAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	private JoyLogger logger = JoyLogger.getLogger(getClass());
	//forward paths
	protected static final String LIST_JSP= "/pages/goods/deptinfo/list.jsp";
	protected static final String CREATE_JSP = "/pages/goods/deptinfo/create.jsp";
	protected static final String EDIT_JSP = "/pages/goods/deptinfo/edit.jsp";
	protected static final String SHOW_JSP = "/pages/goods/deptinfo/show.jsp";
	protected static final String ADD_JSP = "/pages/goods/deptinfo/addDept.jsp";
	//redirect paths,startWith: !f+
	protected static final String LIST_ACTION = "!/sys/dept/list.do";
	private static final String SERVICE = "deptInfoManager";
	private static StringBuilder catPathSb = null;
	private static int levelCount;
	private BaseService baseService;
	
	public BaseService getBaseService() {
		return baseService;
	}


	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}

	private DeptInfoMo deptInfoMo;
	java.lang.String id = null;
	private String[] items;
	
	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			deptInfoMo = new DeptInfoMo();
		} else {
			deptInfoMo = (DeptInfoMo)baseService.getById(SERVICE,id);
		}
	}
	

	public Object getModel() {
		return deptInfoMo;
	}
	
	public void setId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		
		DeptInfoQuery query = newQuery(DeptInfoQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = baseService.findPage(SERVICE,query);
		getRequest().setAttribute("page", page);
		return LIST_JSP;
	}
	

	/** 部门信息维护*/
	public String addDept() {
		return ADD_JSP;
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
		baseService.save(SERVICE,deptInfoMo);
		return writeAjaxResponse("1");
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		baseService.update(SERVICE,this.deptInfoMo);
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
	
	/* 获取部门信息*/
	/**
     * 获取类目列表信息，用于类目树的展示。
     */
    @SuppressWarnings("unchecked")
    public String getDeptInfoList(){
        // 要返回的结果。
        List<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();

        String pid = getRequest().getParameter("id");
        // 如果要获取一级列表，则同时将企业信息返回作为根节点。
        Map<String, Object> root = null;
        if(StringUtils.isBlank(pid)){
            root = new HashMap<String, Object>();
            root.put("id", "-1");
            root.put("name", "集盛信息科技");
            root.put("isParent", true);
            root.put("open", true);
            root.put("nocheck", true);
            pid = "-1";
        }
        DeptInfoQuery deptInfoQuery = new DeptInfoQuery();
        deptInfoQuery.setDelFlag("0");
        deptInfoQuery.setSortColumns(" ORDER_BY ASC");
        List<DeptInfoMo> deptInfoMoList = baseService.find(SERVICE, deptInfoQuery); 
        if(deptInfoMoList != null && deptInfoMoList.size() != 0){
            Map<String, Object> temp = null;
            for(DeptInfoMo deptInfo : deptInfoMoList){
                temp = new HashMap<String, Object>();
                temp.put("id", deptInfo.getId());
                temp.put("nam", deptInfo.getDeptName());
                temp.put("deptCode", deptInfo.getDeptCode());
                temp.put("deptLevel", deptInfo.getDeptLevel());
                temp.put("orderBy", deptInfo.getOrderBy());
                temp.put("pid", pid);
                temp.put("isParent", true);
                resList.add(temp);
            }
        }

        if(root != null){
            root.put("children", resList);
            return writeAjaxResponse(JSONObject.toJSONString(root));
        }

        //记录用户访问行为。
        logger.action(ModuleCode.TRAVEL_ENP_MANAGE, "获取商品类别信息，用于类别树的展示",null);
        return writeAjaxResponse(JSONObject.toJSONString(resList));
    }
	
    /**
     * 获取类目列表信息，用于类目树的展示。
     */
    @SuppressWarnings("unchecked")
    public String ajaxAllGoodsCatList(){
        // 要返回的结果。
        List<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();

        Map<String, Object> root = null;
        root = new HashMap<String, Object>();
        root.put("id", "-1");
        root.put("name", "集盛信息科技");
        root.put("open", true);
        root.put("isParent", true);
        root.put("nocheck", true);
        resList.add(root);
        DeptInfoQuery deptInfoQuery = new DeptInfoQuery();
        deptInfoQuery.setDelFlag("0");
        deptInfoQuery.setSortColumns(" ORDER_BY ASC");
        List<DeptInfoMo> deptInfoMoList = baseService.find(SERVICE, deptInfoQuery); 
        if(deptInfoMoList != null && deptInfoMoList.size() != 0){
            Map<String, Object> temp = null;
            for(DeptInfoMo deptInfo : deptInfoMoList){
                temp = new HashMap<String, Object>();
                temp.put("id", deptInfo.getId());
                temp.put("nam", deptInfo.getDeptName());
                temp.put("deptCode", deptInfo.getDeptCode());
                temp.put("deptLevel", deptInfo.getDeptLevel());
                temp.put("orderBy", deptInfo.getOrderBy());
                temp.put("pId", deptInfo.getParentId());
                temp.put("isParent", true);
                resList.add(temp);
            }
        }
        return writeAjaxResponse(JSONObject.toJSONString(resList));
    }
    
    
    /**
     * 获取编码
     */
    public String getDeptCode(){
        String pid = getRequest().getParameter("pid");
        Map<String, String> result = new HashMap<String, String>();
        result.put("resMsg", "");
        if(StringUtils.isBlank(pid)){
            result.put("resMsg", "pidnull");
            return writeAjaxResponse(JSONObject.toJSONString(result));
        }

        // 获取类目编码。
        String code = null;
        int sameLevelSize = getSameLevelChildrenByParentId(pid);
        if("-1".equals(pid)){
            code = String.format("%04d",sameLevelSize);
        }else{
            GoodsCatMo goodsCat = (GoodsCatMo) baseService.getById(SERVICE, pid);
            // 如果id对应的类目不存在，返回错误信息。
            if(goodsCat == null){
                result.put("resMsg", "notexist");
                return writeAjaxResponse(JSONObject.toJSONString(result));
            }

            //获取编码
            levelCount = 1;
            code = goodsCat.getCatCode()+String.format("%04d",sameLevelSize);
        }

        result.put("catCode", code);
        result.put("catOrder", String.valueOf(sameLevelSize));
        result.put("resMsg", "success");

        return writeAjaxResponse(JSONObject.toJSONString(result));
    }
    
    /**
     * 获取父节点下的所有子节点
     * @param pId
     * @return
     */
    private int getSameLevelChildrenByParentId(String pId) {
        DeptInfoQuery deptInfoQuery = new DeptInfoQuery();
        deptInfoQuery.setParentId(pId);
        List<DeptInfoMo> deptInfoList = baseService.find(SERVICE, deptInfoQuery);
        int max = 0;
        if(deptInfoList != null && deptInfoList.size() > 0) {
            for(DeptInfoMo deptInfo:deptInfoList) {
                String deptCode = deptInfo.getDeptCode();
                if(StringUtils.isNotBlank(deptCode)) {
                    int codeMax = Integer.valueOf(deptCode.substring(deptCode.length()-4, deptCode.length()));
                    if(codeMax > max)
                        max = codeMax;
                }

            }
        }
        return max+1;
    }
    /**
     * 保存或新增类目信息。
     * @return
     */
    public String saveOrUpdate(){

        Map<String, String> result = new HashMap<String, String>();
        DeptInfoMo goodsCat = null;
        String id = getRequest().getParameter("id");
        if(StringUtils.isNotBlank(id)){
        	goodsCat = (DeptInfoMo) baseService.getById(SERVICE, id);
        }else{
        	goodsCat = new DeptInfoMo();
        }

        //验证提交表单
        String validStr = getInfoFromRequest(goodsCat);
        if(StringUtils.isNotBlank(validStr)){
            result.put("resMsg", validStr);
            return writeAjaxResponse(JSONObject.toJSONString(result));
        }

        if(StringUtils.isNotBlank(id)){
            result.put("optType", "update");
            DeptInfoMo cache = (DeptInfoMo)baseService.getById(SERVICE, id);
            if(!StringUtils.equals(goodsCat.getDeptName(),cache.getDeptName())
                    || !StringUtils.equals(goodsCat.getOrderBy()+"", cache.getOrderBy()+"")){
                goodsCat.setNewName(goodsCat.getDeptName());
                goodsCat.setNewOrder(goodsCat.getOrderBy());
                goodsCat.setDeptName(cache.getDeptName());
                goodsCat.setOrderBy(cache.getOrderBy());
            }
            goodsCat.setUpdateTime(new Date());
            Object userId = getAttributeFormSession(Constant.SESSION_USERID);
            goodsCat.setUpdator(null == userId ? "test" : userId.toString());
            baseService.update(SERVICE, goodsCat);
        }else{
            catPathSb = new StringBuilder();
            levelCount = 0;
            result.put("optType", "save");
            id = IdGenerator.genUUIDStr();
            goodsCat.setId(id);
            int levelCount = getLevelGoodsCat(goodsCat);
            catPathSb.append("-1");
            goodsCat.setDeptLevel(levelCount);
            goodsCat.setNewName(goodsCat.getDeptName());
            goodsCat.setNewOrder(goodsCat.getOrderBy());
            goodsCat.setDeptPath(StringUtils.reverseDelimitedString(catPathSb.toString(), "|"));
            goodsCat.setAuthType("2");
            goodsCat.setDeptPinyin("pinyin");
            goodsCat.setInsertTime(new Date());
            Object userId = getAttributeFormSession(Constant.SESSION_USERID);
            goodsCat.setCreator(null == userId ? "test" : userId.toString());
            baseService.save(SERVICE, goodsCat);
        }

        result.put("resMsg", "success");
        result.put("id", id);
        result.put("pid", goodsCat.getParentId());
        result.put("parendName", getRequest().getParameter("parendName"));

        //记录用户访问行为。
        logger.action(ModuleCode.TRAVEL_ENP_MANAGE, "保存或新增类目信息", null);
        return writeAjaxResponse(JSONObject.toJSONString(result));
    }
    
    /**
     * 获取前台页面中传入的类目信息验证表单参数。
     * @param deptInfoCat
     * @return
     */
    @SuppressWarnings("unchecked")
    private String getInfoFromRequest(DeptInfoMo deptInfoCat){
        String parentId = getRequest().getParameter("parentId");
        if(StringUtils.isNotBlank(parentId)){
            deptInfoCat.setParentId(parentId);
        }else{
            return "所属商品类目信息丢失！";
        }
        String name = getRequest().getParameter("deptName");
        if(StringUtils.isNotBlank(name)){
            String catId = deptInfoCat.getId();
            DeptInfoQuery deptInfoQuery = new DeptInfoQuery();
            deptInfoQuery.setParentId(parentId);
            deptInfoQuery.setDeptName(name);
            deptInfoQuery.setDelFlag("0");
            List<DeptInfoMo> goodsCatList = baseService.find(SERVICE, deptInfoQuery);
            if(goodsCatList != null && goodsCatList.size() != 0){
            	DeptInfoMo temp = goodsCatList.get(0);
                if(!temp.getId().equals(catId)){
                    return "商品类目名称已被使用！";
                }
            }
            deptInfoCat.setDeptName(name);
        }else{
            return "商品类目名称不能为空！";
        }
        String catCode = getRequest().getParameter("deptCode");
        if(StringUtils.isNotBlank(catCode)){
            deptInfoCat.setDeptCode(catCode);
        }else{
            return "类目编码不能为空！";
        }

        String catOrder = getRequest().getParameter("orderBy");
        if(StringUtils.isBlank(catOrder)){
            return "类目排序不能为空！";
        } else{
            deptInfoCat.setOrderBy(Integer.valueOf(catOrder));
        }
        deptInfoCat.setDelFlag("0");

        return null;
    }
    
    /**
     * 计算级别
     * @param goodsCat
     * @return
     */
    private int getLevelGoodsCat(DeptInfoMo goodsCat) {
        if(catPathSb != null)
            catPathSb.append(goodsCat.getId()).append("|");
        levelCount ++;
        if(goodsCat == null || goodsCat.getParentId().equals("-1")){
            return levelCount;
        }
        if(goodsCat.getParentId() != null) {
            goodsCat = (DeptInfoMo) baseService.getById(SERVICE, goodsCat.getParentId());
            getLevelGoodsCat(goodsCat);
        }
        return levelCount;
    }
    
    public String moveNode() {
        String id = getRequest().getParameter("id");
        String targetId = getRequest().getParameter("parentFuncId");
        String position = getRequest().getParameter("position");

        DeptInfoMo goodsCatOld = (DeptInfoMo)baseService.getById(SERVICE, id);
        if(goodsCatOld == null) {
            return writeAjaxResponse("null");
        }

        if(!goodsCatOld.getParentId().equals(targetId)) {
            return writeAjaxResponse("notequals");
        }

        GoodsCatQuery query = new GoodsCatQuery();
        query.setParentId(targetId);
        List<DeptInfoMo> childrenList = baseService.find(SERVICE, query);
        childrenList.remove(goodsCatOld);
        childrenList.add(Integer.valueOf(position), goodsCatOld);
        if(childrenList != null && childrenList.size() > 0) {
            for(int i=0;i < childrenList.size(); i++) {
            	DeptInfoMo entity = childrenList.get(i);
                entity.setOrderBy(i+1);
                baseService.update(SERVICE, entity);
            }
        }
        return writeAjaxResponse("1");
    }
    
    /**
     * 根据ID删除类目。
     */
    @SuppressWarnings("unchecked")
    public String removeGoodsCatById(){

        String id = getRequest().getParameter("id");
        if(StringUtils.isNotBlank(id)){
            // 商品类目不存在，则不允许删除。
            DeptInfoMo goodsCat = (DeptInfoMo) baseService.getById(SERVICE, id);
            if(goodsCat == null){
                return writeAjaxResponse("goodsnull");
            }else{
                // 如果有子类目则不允许删除。
                DeptInfoQuery goodsCatQuery = new DeptInfoQuery();
                goodsCatQuery.setParentId(goodsCat.getId());
                goodsCatQuery.setDelFlag("0");
                List<DeptInfoMo> subList = baseService.find(SERVICE, goodsCatQuery);
                if(subList != null && subList.size() != 0){
                    return writeAjaxResponse("subgoods");
                }

                baseService.removeById(SERVICE, id);
            }
        }else{
            return writeAjaxResponse("idnull");
        }

        return writeAjaxResponse("success");
    }
    
    /**
     * 根据ID获取类目信息，用于修改。
     */
    public String getGoodsCatInfo(){
        String id = getRequest().getParameter("id");
        if(StringUtils.isNotBlank(id)){
            DeptInfoMo goodsCat = (DeptInfoMo) baseService.getById(SERVICE, id);
            if(goodsCat == null){
                return writeAjaxResponse("goodsnull");
            }else{
                return writeAjaxResponse(JSONObject.toJSONString(goodsCat));
            }
        }else{
            return writeAjaxResponse("idnull");
        }
    }

	
}
