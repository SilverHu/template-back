package com.sys.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "sys_permission")
public class SysPermission {
	@Id
	@GeneratedValue
	private Long id;// 资源id
	private String name;// 资源名称
	private Long parentid;// 父资源id
	private String link;// 链接
	private String permission;// 权限标识
	private String urlpattern;// 可访问路径
	private String description;// 资源描述
	private Byte type;// 资源类型 1-菜单 2-按钮
	private Integer weight; // 权重
	@OneToMany(mappedBy="parentid", fetch = FetchType.EAGER)
	private List<SysPermission> subPermissions; // 子菜单

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getParentid() {
		return parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getUrlpattern() {
		return urlpattern;
	}

	public void setUrlpattern(String urlpattern) {
		this.urlpattern = urlpattern;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public List<SysPermission> getSubPermissions() {
		return subPermissions;
	}

	public void setSubPermissions(List<SysPermission> subPermissions) {
		this.subPermissions = subPermissions;
	}

}
