package com.ezen.mall.domain.common.database;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {
    private String driver;
    private String url;
    private String username;
    private String password;

    private static final ConnectionFactory instance = new ConnectionFactory();

    private DataSource dataSource;

    private ConnectionFactory(){
        loadProperties();
        createDataSource();
    }

    private void loadProperties() {
        Properties prop = new Properties();
        InputStream in = getClass().getResourceAsStream("/config/db.properties");
        try {
            prop.load(in);
            this.driver = prop.getProperty("database.driver");
            this.url = prop.getProperty("database.url");
            this.username = prop.getProperty("database.username");
            this.password = prop.getProperty("database.password");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createDataSource(){
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);

        dataSource.setInitialSize(5); // 커넥트풀 최소값
        dataSource.setMaxTotal(10); // 커넥트풀 최대값
        dataSource.setMaxIdle(5); // 커넥트풀 조정값
        dataSource.setMaxWaitMillis(5000);  // 대기시간 2초 설정
        this.dataSource = dataSource;
    }

    public static ConnectionFactory getInstance(){
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
