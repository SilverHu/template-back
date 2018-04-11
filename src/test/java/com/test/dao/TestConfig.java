package com.test.dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.test.main.TestBase;

public class TestConfig  extends TestBase{
	private static ApplicationContext ctx ;
	
	// 通过静态代码块的方式,让程序加载spring的配置文件
	static {
		ctx = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	}
	/** 测试spring容器是否实例化了数据源 。如果实例化了，说明Spring容器整合没问题 */
	@Test
	public void testDataSouce() throws SQLException {
		DataSource dataSouce = (DataSource) ctx.getBean("dataSource");
		System.out.println("数据源："+ dataSouce);
		System.out.println("连接："+ dataSouce.getConnection());
	}
}
