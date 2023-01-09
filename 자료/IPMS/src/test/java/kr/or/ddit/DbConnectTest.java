package kr.or.ddit;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnectTest {
    // MySQL Connector 의 클래스. DB 연결 드라이버 정의
    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    // DB 경로
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "kmg";
    private static final String PASSWORD = "1234";
    @Test
    public void testConnection() throws Exception {
        Class.forName(DRIVER);
        try {
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
