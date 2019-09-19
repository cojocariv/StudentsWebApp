package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cp.BisCommand;
import org.apache.log4j.Logger;

public class AjaxControllerServlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";
    static Logger logger = Logger.getLogger(AjaxControllerServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);

        PrintWriter out = response.getWriter();
        String strAjaxResponseText = "";
        String commandCP = null;
        commandCP = request.getParameter("ParameterActionCommand");
        if (commandCP != null) {
            if (!(commandCP.trim().equalsIgnoreCase(""))) {
                String StrCommandClass = "com.bis.cp.”+commandCP+“CP";
                try {
                    Class myClass = Class.forName(StrCommandClass);
                    BisCommand bisCommand = (BisCommand) myClass.newInstance();
                    strAjaxResponseText = bisCommand.execute(request, response);
                } catch (ClassNotFoundException cnfe) {
                    logger.error(cnfe.getMessage());
                } catch (InstantiationException inse) {
                    logger.error(inse.getMessage());
                } catch (Exception excep) {
                    logger.error(excep.getMessage());
                }
            } else {
                logger.fatal("Action command is missing.");
            }

        } else {
            logger.fatal("Action Command is null.");
        }
        out.println(strAjaxResponseText);
        out.close();
    }
}
