package main.java.com.academy.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * This class handles database connection
 *
 * @author Riyaz J
 * @version 1.1
 */
public class Database implements AutoCloseable {

    private static Connection connection = null;

    /**
     * This method creates database connection for the given driver, url, username and, password and returns the
     * connection objects.
     *
     * @return Connection
     */
    public static Connection getConnection() {

        try {

            Properties prop = new Database().getProperties();

            final String driver = prop.getProperty("db.driver");

            final String url = prop.getProperty("db.url");

            final String username = prop.getProperty("db.user");

            final String pass = prop.getProperty("db.password");

            Class.forName(driver);

            connection = DriverManager.getConnection(url, username, pass);

        } catch (Exception e) {

            e.printStackTrace();
        }
        return connection;
    }

    /**
     * This method get the properties from config.properties files and load the properties into the Properties object
     * and returns the object.
     *
     * @return Properties
     * @throws IOException
     */
    public Properties getProperties() throws IOException {

        Properties prop = new Properties();
        prop.load(this.getClass().getClassLoader()
                .getResourceAsStream("/config.properties"));

        return prop;
    }

    /**
     * This method closes the database connection if the connection is null.
     *
     * @throws Exception
     */
    @Override
    public void close() throws Exception {

        if (connection != null)
            connection.close();
    }
}
