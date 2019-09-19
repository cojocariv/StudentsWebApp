package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class DatabaseService {
    private static DataSource dataSource = null;
    private static Connection connection = null;
    static Logger logger = Logger.getLogger(DatabaseService.class);

    public DatabaseService() {
    }

    private static void lookUpDataSource() {
        if (dataSource == null) {
            try {
                Context initialContext = new InitialContext();
                Context envContext = (Context) initialContext.lookup("java:/comp/env");
                if (initialContext != null) {
                    dataSource = (DataSource) envContext.lookup(BisConstants.BisDataSource);
                } else {
                    logger.error("Initial context is null");
                }
            } catch (NamingException e) {
                logger.error("Failed to look up data source. " + e.getMessage());
            }
        }
    }

    public static void releaseDBConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                logger.error(e.getMessage());
            }
        }
    }

    public static void closeDBResouces(Statement statement, ResultSet resultSet) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
        } catch (SQLException sqle) {
            logger.error(sqle.getMessage());
        }
    }

    public static Connection getDBConnection() {
        if (dataSource == null) {
            lookUpDataSource();
        }
        try {
            if (connection == null || connection.isClosed()) {
                connection = dataSource.getConnection();
            }
        } catch (SQLException sqle) {
            logger.error(sqle.getMessage());
        }
        return connection;
    }
}


//---->>> pagina 115