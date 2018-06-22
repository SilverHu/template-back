package com.framework.shiro;

import java.text.MessageFormat;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.config.Ini;
import org.apache.shiro.config.Ini.Section;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.sys.entity.SysPermission;
import com.sys.service.SysPermissionService;

/**
 * Shiro拦截器扩展类
 * 
 * @author silverhu
 *
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {

	@Autowired
	private SysPermissionService sysPermissionService;

	private String filterChainDefinitions;

	public static final String PREMISSION_STRING = "perms[\"{0}\"]";

	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	/**
	 * 从数据库获取访问权限配置
	 */
	@Override
	public Section getObject() throws Exception {
		Ini ini = new Ini();
		ini.load(filterChainDefinitions);
		Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);  
		
		// 配置url访问限制
		List<SysPermission> permissionList = sysPermissionService.findAll();
		for (SysPermission sysPermission : permissionList) {
			if (StringUtils.isNotBlank(sysPermission.getPermission())
					&& StringUtils.isNotBlank(sysPermission.getUrlpattern())) {
				section.put(sysPermission.getUrlpattern(),
						MessageFormat.format(PREMISSION_STRING, sysPermission.getPermission()));
			}
		}
		section.put("/**","authc");
        return section; 
	}

	@Override
	public Class<?> getObjectType() {
		// TODO Auto-generated method stub
		return this.getClass();
	}

}
