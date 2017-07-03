package com.board;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import com.board.support.DB1;
import com.board.support.DB2;
import com.board.support.DB3;


public abstract class DatabaseConfig {
	
	protected void configureSqlSessionFactory(SqlSessionFactoryBean sessionFactoryBean, DataSource dataSource) throws IOException{
		sessionFactoryBean.setDataSource(dataSource);
		
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		sessionFactoryBean.setMapperLocations(resolver.getResources("classpath:mappers/*.xml"));
	}

}

@Configuration
@MapperScan(basePackages = "com.board.mapper", annotationClass = DB1.class, sqlSessionFactoryRef = "db1SqlSessionFactory")
class Db1DatabaseConfig extends DatabaseConfig {

	@Bean(name = "db1DataSource", destroyMethod = "close")
	@Primary
	@ConfigurationProperties(prefix = "spring.db1.datasource")
	public DataSource db1DataSource() {
		return DataSourceBuilder.create().build();
	}
	
	@Bean(name = "db1SqlSessionFactory")
	@Primary
	public SqlSessionFactory db1SqlSessionFactory(@Qualifier("db1DataSource") DataSource db1DataSource, ApplicationContext applicationContext) throws Exception{
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
		configureSqlSessionFactory(sessionFactoryBean, db1DataSource);
		return sessionFactoryBean.getObject();
	}
	
	@Bean
	public PlatformTransactionManager transactionManager(@Qualifier("db1DataSource") DataSource db1DataSource){
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(db1DataSource);
		transactionManager.setGlobalRollbackOnParticipationFailure(false);
		return transactionManager;
	}
	
}

@Configuration
@MapperScan(basePackages = "com.board.mapper", annotationClass = DB2.class, sqlSessionFactoryRef = "db2SqlSessionFactory")
class Db2DatabaseConfig extends DatabaseConfig {

	@Bean(name = "db2DataSource", destroyMethod = "close")
	@ConfigurationProperties(prefix = "spring.db2.datasource")
	public DataSource db2DataSource() {
		return DataSourceBuilder.create().build();
	}
	
	@Bean(name = "db2SqlSessionFactory")
	public SqlSessionFactory db2SqlSessionFactory(@Qualifier("db2DataSource") DataSource db2DataSource, ApplicationContext applicationContext) throws Exception{
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
		configureSqlSessionFactory(sessionFactoryBean, db2DataSource);
		return sessionFactoryBean.getObject();
	}
}

@Configuration
@MapperScan(basePackages = "com.board.mapper", annotationClass = DB3.class, sqlSessionFactoryRef = "db3SqlSessionFactory")
class Db3DatabaseConfig extends DatabaseConfig {

	@Bean(name = "db3DataSource", destroyMethod = "close")
	@ConfigurationProperties(prefix = "spring.db3.datasource")
	public DataSource db3DataSource() {
		return DataSourceBuilder.create().build();
	}
	
	@Bean(name = "db3SqlSessionFactory")
	public SqlSessionFactory db2SqlSessionFactory(@Qualifier("db3DataSource") DataSource db3DataSource, ApplicationContext applicationContext) throws Exception{
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
		configureSqlSessionFactory(sessionFactoryBean, db3DataSource);
		return sessionFactoryBean.getObject();
	}
	
}