/*
 * JOY电子商务网运营事业部
 * 中国移动通信集团设计院有限公司
 * B2BJOY.COM  OPERATION  DIVISION
 * China Mobile Group Design Institute Co., Ltd
 */

package com.ny.b2b.sys.util;

import com.ny.b2b.common.base.BaseEntity;
import com.ny.b2b.common.util.Utils;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * @author weilingfeng
 * @version 1.0
 * @since 1.0
 * 管理Redis缓存中数据
 */

public class CacheConfig extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias
	public static final String TABLE_ALIAS = "Redis缓存";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_CACHE_KEY = "缓存KEY";
	public static final String ALIAS_CACHE_NAME = "缓存名称";
	public static final String ALIAS_USER_ID = "创建人";
	public static final String ALIAS_IP = "创建IP";
	public static final String ALIAS_INSERT_TIME = "创建时间";
	public static final String ALIAS_APPCONTEXT="应用";
	public static final String FORMAT_INSERT_TIME = DATE_FORMAT;
	public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;

	// 可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	// columns START
	private String id;
	private String cacheKey;
	private String cacheName;
	private String userId;
	private String ip;

	private String insertTime;
    private String appContext;
	public CacheConfig() {
	}

	public String getAppContext() {
		return this.appContext;
	}

	public void setAppContext(String value) {
		this.appContext = value;
	}

	public CacheConfig(String id) {
		this.id = id;
	}

	public void setId(String value) {
		this.id = value;
	}

	public String getId() {
		return this.id;
	}

	public void setCacheKey(String value) {
		this.cacheKey = value;
	}

	public String getCacheKey() {
		return this.cacheKey;
	}

	public void setCacheName(String value) {
		this.cacheName = value;
	}

	public String getCacheName() {
		return this.cacheName;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String value) {
		this.userId = value;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String value) {
		this.ip = value;
	}

	public String getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(String value) {
		this.insertTime = value;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("Id", getId()).append("CacheKey", getCacheKey())
				.append("CacheName", getCacheName())
				.append("UserId", getUserId()).append("Ip", getIp())
				.append("InsertTime", getInsertTime())
				.append("AppContext", getAppContext())
				.toString();
	}

	public String toString(String separator) {
		Utils.setEmptyNoException(this);
		StringBuffer sb = new StringBuffer();
		sb.append(ALIAS_ID + ":").append(id).append(separator);
		sb.append(ALIAS_CACHE_KEY + ":").append(cacheKey).append(separator);
		sb.append(ALIAS_CACHE_NAME + ":").append(cacheName).append(separator);
		sb.append(ALIAS_USER_ID + ":").append(userId).append(separator);
		sb.append(ALIAS_IP + ":").append(ip).append(separator);
		sb.append(ALIAS_APPCONTEXT + ":").append(appContext).append(separator);
		sb.append(ALIAS_INSERT_TIME + ":").append(getInsertTime()).append(separator);
		return sb.toString();
	}
	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}
	public boolean equals(Object obj) {
		if (obj instanceof CacheConfig == false)
			return false;
		if (this == obj)
			return true;
		CacheConfig other = (CacheConfig) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}
}
