/*
 * 上海集盛信息技术有限公司
 * www.91nongye.com  OPERATION  DIVISION
 */

package com.ny.b2b.goods.action;

import com.alibaba.fastjson.JSONObject;
import com.ny.b2b.common.base.BaseStruts2Action;
import com.ny.b2b.common.base.IdGenerator;
import com.ny.b2b.common.constant.ModuleCode;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.common.log.JoyLogger;
import com.ny.b2b.common.util.Constant;
import com.ny.b2b.goods.model.GoodsCatMo;
import com.ny.b2b.goods.vo.query.GoodsCatQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.apache.commons.lang.StringUtils;

import java.util.*;

/**
 * @author weilingfeng
 * @version 1.0
 * @since 1.0
 */


public class GoodsCatAction extends BaseStruts2Action implements Preparable, ModelDriven {

    private static final long serialVersionUID = -6715319124951413962L;
    //forward paths
    protected static final String LIST_PAGE = "/pages/goods/cate/list.jsp";
    //redirect paths,startWith: !
    protected static final String LIST_ACTION = "!/pages/goods/cate/list.jsp";

    protected static final String PREVIEW_HOMECAT_PAGE = "/pages/goods/cate/preview_homecat.jsp";

    private static StringBuilder catPathSb = null;

    private static int levelCount;

    private static final String SERVICE = "goodsCatManager";

    // 用户session
    public static final String T_ENTERPRISE_USER = "TENTERPRISEUSER";

    private JoyLogger logger = JoyLogger.getLogger(getClass());

    private BaseService baseService;

    private GoodsCatMo goodsCatMo;

    private String id;

    public void prepare() throws Exception {
        if (isNullOrEmptyString(id)) {
            goodsCatMo = new GoodsCatMo();
        } else {
            goodsCatMo = (GoodsCatMo)baseService.getById(SERVICE,id);
        }
    }


    public Object getModel() {
        return goodsCatMo;
    }

    public String list(){
        return LIST_PAGE;
    }

    /**
     * 获取类目列表信息，用于类目树的展示。
     */
    @SuppressWarnings("unchecked")
    public String getGoodsCatList(){
        // 要返回的结果。
        List<Map<String, Object>> resList = new ArrayList<Map<String, Object>>();

        String pid = getRequest().getParameter("id");
        // 如果要获取一级列表，则同时将企业信息返回作为根节点。
        Map<String, Object> root = null;
        if(StringUtils.isBlank(pid)){
            root = new HashMap<String, Object>();
            root.put("id", "-1");
            root.put("name", "商品类目根目录");
            root.put("isParent", true);
            root.put("open", true);
            root.put("nocheck", true);
            pid = "-1";
        }

        GoodsCatQuery goodsCatQuery = new GoodsCatQuery();
        goodsCatQuery.setParentId(pid);
        goodsCatQuery.setDelFlag("0");
        goodsCatQuery.setSortColumns(" CAT_ORDER ASC");
        List<GoodsCatMo> goodsCatList = baseService.find(SERVICE, goodsCatQuery);
        if(goodsCatList != null && goodsCatList.size() != 0){
            Map<String, Object> temp = null;
            for(GoodsCatMo goodsCat : goodsCatList){
                temp = new HashMap<String, Object>();
                temp.put("id", goodsCat.getId());
                temp.put("name", goodsCat.getName());
                temp.put("catCode", goodsCat.getCatCode());
                temp.put("catLevel", goodsCat.getCatLevel());
                temp.put("catOrder", goodsCat.getCatOrder());
                temp.put("catShow", goodsCat.getCatShow());
                temp.put("pubFlag", goodsCat.getPubFlag());
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
        root.put("name", "商品类目根目录");
        root.put("open", true);
        root.put("isParent", true);
        root.put("nocheck", true);
        resList.add(root);

        GoodsCatQuery goodsCatQuery = new GoodsCatQuery();
        goodsCatQuery.setDelFlag("0");
        //goodsCatQuery.setParentId("-1");
        goodsCatQuery.setSortColumns(" CAT_ORDER ASC");
        List<GoodsCatMo> goodsCatList = baseService.find(SERVICE, goodsCatQuery);
        if(goodsCatList != null && goodsCatList.size() != 0){
            Map<String, Object> temp = null;
            for(GoodsCatMo goodsCat : goodsCatList){
                temp = new HashMap<String, Object>();
                temp.put("id", goodsCat.getId());
                temp.put("name", goodsCat.getName());
                temp.put("catCode", goodsCat.getCatCode());
                temp.put("catLevel", goodsCat.getCatLevel());
                temp.put("catOrder", goodsCat.getCatOrder());
                temp.put("catShow", goodsCat.getCatShow());
                temp.put("pubFlag", goodsCat.getPubFlag());
                temp.put("pId", goodsCat.getParentId());
                //temp.put("isParent", true);
                resList.add(temp);
            }
        }
        //root.put("children", resList);
        return writeAjaxResponse(JSONObject.toJSONString(resList));
    }

    /**
     * 获取编码
     */
    public String getGoodsCatCode(){
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
     * 计算级别
     * @param goodsCat
     * @return
     */
    private int getLevelGoodsCat(GoodsCatMo goodsCat) {
        if(catPathSb != null)
            catPathSb.append(goodsCat.getId()).append("|");
        levelCount ++;
        if(goodsCat == null || goodsCat.getParentId().equals("-1")){
            return levelCount;
        }
        if(goodsCat.getParentId() != null) {
            goodsCat = (GoodsCatMo) baseService.getById(SERVICE, goodsCat.getParentId());
            getLevelGoodsCat(goodsCat);
        }
        return levelCount;
    }

    /**
     * 获取父节点下的所有子节点
     * @param pId
     * @return
     */
    private int getSameLevelChildrenByParentId(String pId) {
        GoodsCatQuery goodsCatQuery = new GoodsCatQuery();
        goodsCatQuery.setParentId(pId);
        List<GoodsCatMo> goodsCatList = baseService.find(SERVICE, goodsCatQuery);
        int max = 0;
        if(goodsCatList != null && goodsCatList.size() > 0) {
            for(GoodsCatMo goodsCat:goodsCatList) {
                String catCode = goodsCat.getCatCode();
                if(StringUtils.isNotBlank(catCode)) {
                    int codeMax = Integer.valueOf(catCode.substring(catCode.length()-4, catCode.length()));
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
        GoodsCatMo goodsCat = null;
        String id = getRequest().getParameter("id");
        if(StringUtils.isNotBlank(id)){
            goodsCat = (GoodsCatMo) baseService.getById(SERVICE, id);
        }else{
            goodsCat = new GoodsCatMo();
        }

        //验证提交表单
        String validStr = getInfoFromRequest(goodsCat);
        if(StringUtils.isNotBlank(validStr)){
            result.put("resMsg", validStr);
            return writeAjaxResponse(JSONObject.toJSONString(result));
        }

        if(StringUtils.isNotBlank(id)){
            result.put("optType", "update");
            GoodsCatMo cache = (GoodsCatMo)baseService.getById(SERVICE, id);
            if(!StringUtils.equals(goodsCat.getName(),cache.getCatCode())
                    || !StringUtils.equals(goodsCat.getCatOrder()+"", cache.getCatOrder()+"")
                    || !StringUtils.equals(goodsCat.getCatShow()+"", cache.getCatShow()+"")){
                goodsCat.setNewName(goodsCat.getName());
                goodsCat.setNewOrder(goodsCat.getCatOrder());
                goodsCat.setNewShow(goodsCat.getCatShow());
                goodsCat.setName(cache.getName());
                goodsCat.setCatOrder(cache.getCatOrder());
                goodsCat.setCatShow(cache.getCatShow());
                goodsCat.setPubFlag(0);//待发布
            }
            baseService.update(SERVICE, goodsCat);
        }else{
            catPathSb = new StringBuilder();
            levelCount = 0;
            result.put("optType", "save");
            id = IdGenerator.genUUIDStr();
            goodsCat.setId(id);
            int levelCount = getLevelGoodsCat(goodsCat);
            catPathSb.append("-1");
            goodsCat.setCatLevel(levelCount);

            goodsCat.setNewName(goodsCat.getName());
            goodsCat.setNewOrder(goodsCat.getCatOrder());
            goodsCat.setNewShow(goodsCat.getCatShow());
            goodsCat.setPubFlag(1);//已发布

            goodsCat.setCatPath(StringUtils.reverseDelimitedString(catPathSb.toString(), "|"));
            goodsCat.setOptTime(new Date());
            Object userId = getAttributeFormSession(Constant.SESSION_USERID);
            goodsCat.setOptUser(null == userId ? "test" : userId.toString());
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
     * 回滚商品分类修改
     * @return
     */
    public String ajaxRollBackTempInfo(){
        String id = getRequest().getParameter("id");
        if(StringUtils.isNotBlank(id)){
            GoodsCatMo goodsCat = (GoodsCatMo)baseService.getById(SERVICE, id);
            if(null != goodsCat){
                goodsCat.setPubFlag(1);//已发布
                goodsCat.setNewName(goodsCat.getName());
                goodsCat.setNewOrder(goodsCat.getCatOrder());
                goodsCat.setNewShow(goodsCat.getCatShow());
                baseService.update(SERVICE, goodsCat);
            }
        }
        return writeAjaxResponse("1");
    }

    /**
     * 获取前台页面中传入的类目信息验证表单参数。
     * @param goodsCat
     * @return
     */
    @SuppressWarnings("unchecked")
    private String getInfoFromRequest(GoodsCatMo goodsCat){
        String parentId = getRequest().getParameter("parentId");
        if(StringUtils.isNotBlank(parentId)){
            goodsCat.setParentId(parentId);
        }else{
            return "所属商品类目信息丢失！";
        }

        String name = getRequest().getParameter("name");
        if(StringUtils.isNotBlank(name)){
            String catId = goodsCat.getId();
            GoodsCatQuery goodsCatQuery = new GoodsCatQuery();
            goodsCatQuery.setParentId(parentId);
            goodsCatQuery.setName(name);
            goodsCatQuery.setDelFlag("0");
            List<GoodsCatMo> goodsCatList = baseService.find(SERVICE, goodsCatQuery);
            goodsCatQuery.setName(null);
            goodsCatQuery.setNewName(name);
            List<GoodsCatMo> goodsCatList2 = baseService.find(SERVICE, goodsCatQuery);//冗余字段也不能重复
            if(goodsCatList != null && goodsCatList.size() != 0){
                GoodsCatMo temp = goodsCatList.get(0);
                if(!temp.getId().equals(catId)){
                    return "商品类目名称已被使用！";
                }
            }
            if(goodsCatList2 != null && goodsCatList2.size() != 0){
                GoodsCatMo temp = goodsCatList2.get(0);
                if(!temp.getId().equals(catId)){
                    return "商品类目名称已被使用！";
                }
            }
            goodsCat.setName(name);
        }else{
            return "商品类目名称不能为空！";
        }

        //goodsCat.setOptUser(value);

        String catCode = getRequest().getParameter("catCode");
        if(StringUtils.isNotBlank(catCode)){
            goodsCat.setCatCode(catCode);
        }else{
            return "类目编码不能为空！";
        }

        String catOrder = getRequest().getParameter("catOrder");
        if(StringUtils.isBlank(catOrder)){
            return "类目排序不能为空！";
        } else{
            goodsCat.setCatOrder(Integer.valueOf(catOrder));
        }

        String catShow = getRequest().getParameter("catShow");
        if(StringUtils.isBlank(catShow)){
            return "类目是否显示不能为空！";
        } else{
            goodsCat.setCatShow(Integer.valueOf(catShow));
        }

        goodsCat.setDelFlag("0");

        return null;
    }

    /**
     * 根据ID获取类目信息，用于修改。
     */
    public String getGoodsCatInfo(){

        String id = getRequest().getParameter("id");
        if(StringUtils.isNotBlank(id)){
            GoodsCatMo goodsCat = (GoodsCatMo) baseService.getById(SERVICE, id);
            if(goodsCat == null){
                return writeAjaxResponse("goodsnull");
            }else{
                return writeAjaxResponse(JSONObject.toJSONString(goodsCat));
            }
        }else{
            return writeAjaxResponse("idnull");
        }
    }

    /**
     * 根据ID删除类目。
     */
    @SuppressWarnings("unchecked")
    public String removeGoodsCatById(){

        String id = getRequest().getParameter("id");
        if(StringUtils.isNotBlank(id)){
            // 商品类目不存在，则不允许删除。
            GoodsCatMo goodsCat = (GoodsCatMo) baseService.getById(SERVICE, id);
            if(goodsCat == null){
                return writeAjaxResponse("goodsnull");
            }else{
                // 如果有子类目则不允许删除。
                GoodsCatQuery goodsCatQuery = new GoodsCatQuery();
                goodsCatQuery.setParentId(goodsCat.getId());
                goodsCatQuery.setDelFlag("0");
                List<GoodsCatMo> subList = baseService.find(SERVICE, goodsCatQuery);
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
     * 类目首页效果预览
     * @return
     */
    /*public String previewHomecat(){
        GoodsCatQuery query = new GoodsCatQuery();
        query.setParentId("-1");
        query.setCatLevel(1);
        query.setDelFlag(0);
        query.setSortColumns("NEW_ORDER");
        List<GoodsCat> cats = baseService.find(XpurchaseManagerName.GOODS_CAT, query);	// 一级分类

        List<GoodsCat> resCats = new ArrayList<GoodsCat>();
        List<GoodsCat> showCat = null;
        List<GoodsCat> hideCat = null;
        for (GoodsCat goodsCat : cats) {
            if(goodsCat.getPubFlag()==0){
                if(goodsCat.getNewShow()!=1)	// 非首页显示的页面不显示
                    continue;
                goodsCat.setCatShow(goodsCat.getNewShow());
                goodsCat.setName(goodsCat.getNewName());
                goodsCat.setCatOrder(goodsCat.getNewOrder());
            }else{
                if(goodsCat.getCatShow()!=1)	// 非首页显示的页面不显示
                    continue;
            }
            query.setParentId(goodsCat.getId());
            query.setCatLevel(2);
            List<GoodsCatMo> childCats = baseService.find(XpurchaseManagerName.GOODS_CAT, query);	//二级分类
            showCat = new ArrayList<GoodsCat>();
            hideCat = new ArrayList<GoodsCat>();
            for (GoodsCatMo goodsCat2 : childCats) {
                if(goodsCat2.getPubFlag()!=null && goodsCat2.getPubFlag()==0){
                    if(goodsCat2.getNewShow()==2)// 全局隐藏的分类不显示
                        continue;
                    goodsCat2.setCatShow(goodsCat2.getNewShow());
                    goodsCat2.setName(goodsCat2.getNewName());
                    goodsCat2.setCatOrder(goodsCat2.getNewOrder());
                }else{
                    if(goodsCat2.getCatShow()==2)	// 全局隐藏的分类不显示
                        continue;
                }
                if(goodsCat2.getCatShow()==1)
                    showCat.add(goodsCat2);
                else
                    hideCat.add(goodsCat2);
            }
            goodsCat.setChildGoodsCatsShow(showCat);
            goodsCat.setChildGoodsCatsHide(hideCat);
            resCats.add(goodsCat);
        }
        getRequest().setAttribute("goodsCatTree", resCats);
        return PREVIEW_HOMECAT_PAGE;
    }*/

    /**
     * 发布预览效果
     */
    /*public void issue(){
        GoodsCatQuery query = new GoodsCatQuery();
        query.setDelFlag(0);
        query.setPubFlag(0);
        query.setSortColumns("NEW_ORDER");
        boolean flag;
        int countFail = 0 ;
        @SuppressWarnings("unchecked")
        List<GoodsCatMo> cats = baseService.find(XpurchaseManagerName.GOODS_CAT, query);
        Date now = new Date();
        Object userId = getAttributeFormSession(Constant.SESSION_USERID);
        String optUser = null == userId ? "test" : userId.toString();
        boolean isUndo = "undo".equals(getRequest().getParameter("type"));
        for (GoodsCatMo cat : cats) {
            if(isUndo){	// 还原所有分类修改
                cat.setNewShow(cat.getCatShow());
                cat.setNewName(cat.getName());
                cat.setNewOrder(cat.getCatOrder());
            }else{
                cat.setCatShow(cat.getNewShow());
                cat.setName(cat.getNewName());
                cat.setCatOrder(cat.getNewOrder());
            }
            cat.setPubFlag(1);
            cat.setOptTime(now);
            cat.setOptUser(optUser);
            try {
                flag = baseService.update(XpurchaseManagerName.GOODS_CAT, cat);
                if(!flag)
                    countFail++;
            } catch (Exception e) {
                countFail++;
                logger.error(ModuleCode.BIZ_XP, "GoodsCatAction.issue", "发布分类异常model："+JSONObject.toJSONString(cat)+",Exception:"+e.getMessage(),e);
            }
        }
        writeAjaxResponse(String.valueOf(countFail));
    }*/

    public String moveNode() {
        String id = getRequest().getParameter("id");
        String targetId = getRequest().getParameter("parentFuncId");
        String position = getRequest().getParameter("position");

        GoodsCatMo goodsCatOld = (GoodsCatMo)baseService.getById(SERVICE, id);
        if(goodsCatOld == null) {
            return writeAjaxResponse("null");
        }

        if(!goodsCatOld.getParentId().equals(targetId)) {
            return writeAjaxResponse("notequals");
        }

        GoodsCatQuery query = new GoodsCatQuery();
        query.setParentId(targetId);
        List<GoodsCatMo> childrenList = baseService.find(SERVICE, query);
        childrenList.remove(goodsCatOld);
        childrenList.add(Integer.valueOf(position), goodsCatOld);
        if(childrenList != null && childrenList.size() > 0) {
            for(int i=0;i < childrenList.size(); i++) {
                GoodsCatMo entity = childrenList.get(i);
                entity.setCatOrder(i+1);
                baseService.update(SERVICE, entity);
            }
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
