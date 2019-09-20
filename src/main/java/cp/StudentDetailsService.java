package cp;

import db.DatabaseService;


import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import static cp.LoadStudentCP.logger;


public class StudentDetailsService {
    public String loadStudent(String strStudentId) {

        String strStudentSummary = "";
        String strFirstName = "";
        String strMiddleName = "";
        String strLastName = "";
        String strFullName = "";
        String strGrade = "";
        String strSection = "";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        if (strStudentId != null) {
            StringBuffer sbQuery = new StringBuffer("SELECT FIRST_NAME, MIDDLE_NAME, LAST_NAME, GRADE, SECTION FROM STUDENT_DETAILS WHERE STUDENT_ID=’");
            sbQuery.append(strStudentId + "’");
            DatabaseService databaseService = new DatabaseService();
            connection = databaseService.getDBConnection();
            try {
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sbQuery.toString());
                resultSet.next(); // Expecting only one record.
                strFirstName = resultSet.getString("FIRST_NAME");
                strMiddleName = resultSet.getString("MIDDLE_NAME");
                strLastName = resultSet.getString("LAST_NAME");
                strGrade = resultSet.getString("GRADE");
                strSection = resultSet.getString("SECTION");
                if (strFirstName != null) {
                    strFullName = strFirstName;
                }
                if (strMiddleName != null) {
                    strFullName = strFullName + " " + strMiddleName;
                }
                if (strLastName != null) {
                    strFullName = strFullName + " " + strLastName;
                }
                strStudentSummary = strFullName + "&nbsp;&nbsp;|&nbsp;&nbsp;" + strGrade + "-" + strSection + "&nbsp;&nbsp;|&nbsp;&nbsp;" + strStudentId;

            } catch (SQLException e) {
                logger.error(e.getMessage());
            } finally {
                databaseService.closeDBResouces(statement, resultSet);
                databaseService.releaseDBConnection();
            }
        }else {
            logger.error("Student id is null");
        }
        return strStudentSummary;
    }
}

//page 147