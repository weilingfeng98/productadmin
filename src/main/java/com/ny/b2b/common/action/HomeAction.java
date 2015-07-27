package com.ny.b2b.common.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.ny.b2b.common.base.BaseStruts2Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.ny.b2b.common.constant.ModuleCode;
import com.ny.b2b.common.hessian.service.BaseService;
import com.ny.b2b.common.log.JoyLogger;
import com.ny.b2b.common.servlet.RandomCode;
import com.ny.b2b.common.util.Constant;
import com.ny.b2b.session.handler.SessionUtil;
import com.opensymphony.xwork2.ActionContext;

public class HomeAction extends BaseStruts2Action implements Preparable,ModelDriven {

    private static final long serialVersionUID = -9216802838496545635L;

    private String username;

    private String password;

    private String randomCode;

    private BaseService baseService;

    public static final String HOME = "/webFrame/frame.jsp";

    public static final String LOGIN = "/login.jsp";

    public static final String ACTION_LOGIN = "!/";

    protected JoyLogger log = JoyLogger.getLogger(this.getClass()) ;

    public static final String TYPE = "1" ;

    public String index(){

        //每次先去除一个会话的验证码，然后新生成一个新的会话
        //removeAttributeFromSession(RandomCode.RANDOMCODE);
        //Session集中管理SessionID
        //String centralSessionId = UUID.randomUUID().toString();
        //SessionUtil.setCentralSessionId(getRequest(), getResponse(), centralSessionId);

        return LOGIN;
    }

    /**
     * 用户登录。
     * @return
     */
    public String login(){

        String resInfo = loginAsUser() ;
        if(StringUtils.equals(resInfo, SUCCESS)) {
            return "!/home/main.do";
        }

        //每次先去除一个会话的验证码，然后新生成一个新的会话
        //removeAttributeFromSession(RandomCode.RANDOMCODE);
        //Session集中管理SessionID
        String centralSessionId = UUID.randomUUID().toString();
        //SessionUtil.setCentralSessionId(getRequest(), getResponse(), centralSessionId);

        return LOGIN;
    }

    public String main() {
        return HOME;
    }

    /**
     * 检查验证码
     *
     * @return 布尔值 是否验证一致
     */
    private String checkRegisterRandom() {
        String sessionCode = (String) getRequest().getSession().getAttribute(RandomCode.RANDOMCODE);
        return (randomCode != null && sessionCode != null && randomCode.equalsIgnoreCase(sessionCode))?"0":"1";
    }

	private String loginAsUser() {
		//验证码验证
		/*if (checkRegisterRandom().equals("1")) {
			getRequest().setAttribute("resInfo", "wrongrandomCode");
			    return ERROR ;
		}*/
		log.info("*****************登录前账号username:["+username+"],密码：["+password+"]");
        if("admin".equals(username)){
            return SUCCESS ;
        }
		/*if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)) {
			UserInfoQuery query = new UserInfoQuery() ;
			query.setUserName(username) ;
			query.setPwd(password) ;
			query.setDelFlag("0") ;
			@SuppressWarnings("unchecked")
            List<UserInfo> userInfoList = baseService.find(SERVICE, query) ;
			if(!CollectionUtils.isEmpty(userInfoList)) {
			    log.info("#######################查到用户啦~~~~~~~~~");
				UserInfo userInfo = userInfoList.get(0) ;
				if(userInfo!=null && !StringUtils.equals("0", userInfo.getIsAdmin())&&!StringUtils.equals("4", userInfo.getIsAdmin())) {
					Map<String, Object> session = ActionContext.getContext().getSession();
					session.put(Constant.SESSION_USERID, userInfo.getId());
					session.put(Constant.SESSION_USERNAME, userInfo.getUserName());
					session.put(Constants.SESSION_REALNAME, userInfo.getRealName());
					session.put(Constants.SESSION_ADMIN, userInfo.getIsAdmin());
					// 读取权限
					try {
					    Map<String, Privilege> privilegeMap = privilegeService.inquiryUserPrivilege_2_0(APP_NAME, userInfo.getId());
					    if(privilegeMap != null && privilegeMap.size() != 0){
	                        session.put(Constant.SESSION_PVG_MAP, privilegeMap);
	                    }

					    if(Constants.ENP_ADMIN.equalsIgnoreCase(userInfo.getIsAdmin())){//企业管理员需要查询
					    	OrgMngGroupQuery query2 = new OrgMngGroupQuery();
						    query2.setUserId(userInfo.getId());
						    List<OrgMngGroup> mngList = baseService.find("orgMngGroupManager", query2);
						    //企业管理员所管理的部门
						    Map<String,String> mngMap = new HashMap<String, String>();
						    //企业管理员所管理的部门及所有父级节点部门
						    Map<String,String> allMngMap = new HashMap<String, String>();

						    if(mngList != null){
						    	for (OrgMngGroup orgMngGroup : mngList) {
						    		mngMap.put(orgMngGroup.getOrgId(), orgMngGroup.getOrgId());
								}

						    	for (OrgMngGroup orgMngGroup : mngList) {
						    		findAllMngMap(allMngMap,mngMap,orgMngGroup.getOrgId(),orgMngGroup.getOrgCode());
								}
						    }
						    session.put(Constants.SESSION_MNG_MAP, mngMap);
						    session.put(Constants.SESSION_ALL_MNG_MAP, allMngMap);
					    }

					} catch (Exception e) {
                        log.error(ModuleCode.PUBLIC_SAFE_USER_PRIVILEGE, userInfo.getRoleId(), e);
                    }

					return SUCCESS ;
				}
			}
		}*/
		getRequest().setAttribute("resInfo", "wrongpass");
		return ERROR ;
	}

	/*private void findAllMngMap(Map<String,String> allMngMap,Map<String,String> mngMap,String deptId,String deptCode){
		if(!allMngMap.containsKey(deptId)){//不包含当前节点时将当前节点加入到MAP中

			if(mngMap.containsKey(deptId)){//所管理的部门打标识1
				allMngMap.put(deptId, "1");
			}else{//非管理部门标识0
				allMngMap.put(deptId, "0");
			}

			if(deptCode.length() > 4){//非一级部门时，查找的父部门，将其也加入到MAP中
				OrgInfo org = CacheUtil.get4Object_2_0(OrgInfo.class,CacheConstants.XP_ORG, deptId);
				findAllMngMap(allMngMap, mngMap, org.getParentId(), org.getOrgCode());
			}
		}
	}*/

   /* public String resetPwd(){
		String oldPwd = getRequest().getParameter("oldPwd");
		String newPwd = getRequest().getParameter("newPwd");
		String confirmNewPwd = getRequest().getParameter("rePwd");
		if(StringUtils.isBlank(oldPwd)){
			return writeAjaxResponse("notnull");
		}
		if(StringUtils.isBlank(newPwd)){
			return writeAjaxResponse("notnull");
		}
		if(StringUtils.isBlank(confirmNewPwd)){
			return writeAjaxResponse("notnull");
		}

		if(!newPwd.equals(confirmNewPwd)){
			return writeAjaxResponse("confirmPwdError");
		}

    	String userId = (String) getAttributeFormSession(Constant.SESSION_USERID) ;

    	UserInfo userInfo = (UserInfo) baseService.getById(SERVICE, userId) ;
    	if(!StringUtils.equals(userInfo.getPwd(), oldPwd)) {
    		return writeAjaxResponse("pwdwrong");
    	}
    	userInfo.setPwd(newPwd) ;
    	userInfo.setUpdateTime(new Date()) ;
    	baseService.update(SERVICE, userInfo) ;
		return writeAjaxResponse("1");
	}*/

    /**
     * 跳转到修改密码页面
     * @return
     */
    /*public String editPwd(){
        //如果是get请求，跳转到修改密码页面
        if("get".equalsIgnoreCase(getRequest().getMethod())){
            return "/templates/sys/password/editPwd.ftl";
        }else{
            String oldNewPass = this.getRequest().getParameter("oldNewPass");
            String txtNewPass = this.getRequest().getParameter("txtNewPass");

            String id = (String)getAttributeFormSession(Constant.SESSION_USERID);

            boolean  b = userInfoService.updateUserPwd(id, oldNewPass, txtNewPass);
            if(b){
                return    writeAjaxResponse("1");
            }else{
                return 	writeAjaxResponse("0");
            }
        }
    }*/

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRandomCode(String randomCode) {
        this.randomCode = randomCode;
    }


    public BaseService getBaseService() {
        return baseService;
    }

    public void setBaseService(BaseService baseService) {
        this.baseService = baseService;
    }


    public String logout(){
        getRequest().getSession().invalidate();
        return ACTION_LOGIN;
    }

    public String getTopMenu() {
        return "";
    }

    public String getLeftMenu() {
        return "";
    }

    @Override
    public Object getModel() {
        return null;
    }

    @Override
    public void prepare() throws Exception {

    }
}
