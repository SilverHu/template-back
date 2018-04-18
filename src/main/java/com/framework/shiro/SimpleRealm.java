package com.framework.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.sys.entity.SysPermission;
import com.sys.entity.SysRole;
import com.sys.entity.SysUser;
import com.sys.service.SysUserService;
import com.util.Constants;

/**
 * 简单Realm，安全数据源
 * 
 * @author SilverHu
 *
 */
public class SimpleRealm extends AuthorizingRealm {

	@Autowired
	private SysUserService sysUserService;

	/**
	 * 为当前登录的Subject授予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) this.getAvailablePrincipal(principals);
		SysUser sysUser = sysUserService.findByUsername(username);
		if (null == sysUser) {
			throw new UnknownAccountException();
		}
		// 获取用户的权限和角色列表
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		if (sysUser.getPermissionList() != null) {
			for (SysPermission permission : sysUser.getPermissionList()) {
				info.addStringPermission(permission.getPermission());
			}
		}
		if (sysUser.getRoleList() != null) {
			for (SysRole sysRole : sysUser.getRoleList()) {
				info.addRole(sysRole.getName());
				if (sysRole.getPermissionList() != null) {
					for (SysPermission permission : sysRole.getPermissionList()) {
						info.addStringPermission(permission.getPermission());
					}
				}
			}

		}
		return info;
	}

	/**
	 * 用户名密码方式认证过程，认证成功后返回AuthenticationInfo对象
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		SysUser sysUser = sysUserService.findByUsername(username);
		if (sysUser == null) {
			throw new UnknownAccountException();
		}
		if (!sysUser.getStatus()) {
			throw new LockedAccountException();
		}
		// 此处无需对比密码是否正确，只需传入正确的用户名密码，shrio会自行处理
		AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(sysUser.getUsername(), sysUser.getPassword(),
				this.getName());
		setSession(Constants.SHIRO_USER, sysUser);
		return authcInfo;
	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * @param key
	 * @param value
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}

}
