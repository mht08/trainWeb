package cn.train.entity;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

import cn.train.utils.DateUtil;

public class Menu {

	private Long id;
	private String parentId; // '父级编号',
	private String parentIds; // '所有父级编号',
	private String name; // '名称',
	private String sort; // '排序',
	private String href; // '链接',
	private String hrefType; // '链接类型',
	private String target; // '目标',
	private String icon; // '图标',
	private String isShow; // '是否在菜单中显示',
	private String permission; // '权限标识',
	private String createBy; // '创建者',
	private Date createDate; // '创建时间',
	private String updateBy; // '更新者',
	private Date updateDate; // '更新时间',
	private String remarks; // '备注信息',
	private String delFlag; // '删除标记',
	private String version; // '版本号',
	@SuppressWarnings("unused")
	private String createDateStr;
	@SuppressWarnings("unused")
	private String updateDateStr;
	private String parentIdStr;
	private String parentIdsStr;
	
	public String getParentIdStr() {
		return parentIdStr;
	}
	public void setParentIdStr(String parentIdStr) {
		this.parentIdStr = parentIdStr;
	}
	public String getParentIdsStr() {
		return parentIdsStr;
	}
	public void setParentIdsStr(String parentIdsStr) {
		this.parentIdsStr = parentIdsStr;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getParentId() {
		return StringUtils.isBlank(parentId) ? "0":parentId.trim();
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getParentIds() {
		return StringUtils.isBlank(parentIds) ? "0," : parentIds.trim();
	}
	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getHrefType() {
		return hrefType;
	}
	public void setHrefType(String hrefType) {
		this.hrefType = hrefType;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getIsShow() {
		return isShow;
	}
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}

	public String getCreateDateStr() {
		return DateUtil.formatDate(getCreateDate(), DateUtil.FMT);
	}
	public String getUpdateDateStr() {
		return DateUtil.formatDate(getUpdateDate(), DateUtil.FMT);
	}
	
	
}
