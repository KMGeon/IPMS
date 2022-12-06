package kr.or.ddit;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnectTest {
    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    // DB 경로
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "project";
    private static final String PASSWORD = "java";

    @Test
    public void testConnection() throws Exception {
        // DBMS에게 DB 연결 드라이버의 위치를 알려주기 위한 메소드
        Class.forName(DRIVER);
        try {
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}