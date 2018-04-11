package com.sys.entity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "sys_role")
public class SysRole {

	@Id
	@GeneratedValue
	private Long id;// 角色id

	private String name;// 角色名称

	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "sys_relation_role_permission", joinColumns = {
			@JoinColumn(name = "roleid", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "permissionid", referencedColumnName = "id") })
	private Set<SysPermission> permissionList; // 权限列表

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

	public Set<SysPermission> getPermissionList() {
		return permissionList;
	}

	public void setPermissionList(Set<SysPermission> permissionList) {
		this.permissionList = permissionList;
	}

}
