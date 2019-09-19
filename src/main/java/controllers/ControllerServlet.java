package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cp.BisCommand;
import org.apache.log4j.Logger;


public class ControllerServlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";
    static Logger logger = Logger.getLogger(ControllerServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String commandCP = null;
        String view = null;
        commandCP = request.getParameter("ParameterActionCommand");
        if (commandCP != null) {
            String StrCommandClass = "com.bis.cp. " + commandCP + " CP";
            try {
                Class myClass = Class.forName(StrCommandClass);
                BisCommand bisCommand = (BisCommand) myClass.newInstance();
                view = bisCommand.execute(request, response);
                if (view == null || view.trim().equalsIgnoreCase("")) {
                    view = "BisError";      // Add error message in session and display that in the jsp.
                    logger.debug("A null value returned for view");
                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/BisHome.jsp?prmDynInclPage=" + view);
                requestDispatcher.forward(request, response);

            } catch (ClassNotFoundException cnfe) {
                logger.error(cnfe);
            } catch (InstantiationException inse) {
                logger.error(inse.getMessage());
            } catch (Exception excep) {
                logger.error(excep.getMessage());
            }
        } else {
            logger.fatal("Action command is null");
        }

    }
}
