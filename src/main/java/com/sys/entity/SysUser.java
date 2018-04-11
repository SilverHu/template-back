package com.sys.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 系统用户
 * 
 * @author SilverHu
 *
 */
@Entity
@Table(name = "sys_user")
public class SysUser {

	@Id
	@GeneratedValue
	private Long id;// 用户id
	private String username;// 用户名
	private String name;// 用户姓名
	private String password;// 密码
	private String email;// 用户邮箱
	@Column(nullable = false)
	private Boolean status;// 保留字符 0-删除 1-存在
	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "sys_relation_user_role", joinColumns = {
			@JoinColumn(name = "userid", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "roleid", referencedColumnName = "id") })
	private Set<SysRole> roleList; // 角色列表
	@OneToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "sys_relation_user_permission", joinColumns = {
			@JoinColumn(name = "userid", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "permissionid", referencedColumnName = "id") })
	private Set<SysPermission> permissionList; // 权限列表

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Set<SysRole> getRoleList() {
		return roleList;
	}

	public void setRoleList(Set<SysRole> roleList) {
		this.roleList = roleList;
	}

	public Set<SysPermission> getPermissionList() {
		return permissionList;
	}

	public void setPermissionList(Set<SysPermission> permissionList) {
		this.permissionList = permissionList;
	}

}
