package cp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class LoadStudentCP extends BisCP implements BisCommand {

    static Logger logger = Logger.getLogger(LoadStudentCP.class);

    public LoadStudentCP() {
        super();
    }

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String strStudentId = null;
        HttpSession session = null;
        strStudentId = request.getParameter("txtStdId");
        session = request.getSession();
        if (strStudentId != null) {
            try {
                StudentDetailsService studentDetailsService = new StudentDetailsService();
                strAjaxResponseText = studentDetailsService.loadStudent(strStudentId);
                session.setAttribute("StudentId", strStudentId);
            } catch (Exception e) {
                logger.error(e.getMessage());
            }
        }
        return strAjaxResponseText;
    }
}

