package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionUtils {

    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection == null) {
            connection = createConnection();
        }
        return connection;
    }

    private static Connection createConnection() {
        String databaseUrl;
        String databaseUser;
        String databasePassword;
        try (InputStream is = ConnectionUtils.class.getClassLoader().getResourceAsStream("db.properties")) {
            Properties p = new Properties();
            p.load(is);

            databaseUrl = p.getProperty("jdbc.url");
            databaseUser = p.getProperty("jdbc.username");
            databasePassword = p.getProperty("jdbc.password");

            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException("Fail to load postgresql driver", e);
            }
            try {
                java.sql.Connection connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePassword);
                connection.setAutoCommit(true);
                return connection;

            } catch (SQLException e) {
                throw new RuntimeException("Error occurred  while creating statement", e);
            }
        } catch (IOException e) {
            throw new RuntimeException("Fail to read from property file", e);
        }
    }

}
