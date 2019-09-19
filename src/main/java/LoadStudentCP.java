import cp.BisCP;
import cp.BisCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;

public class LoadStudentCP extends BisCP implements BisCommand {
    static Logger logger = Logger.getLogger(LoadStudentCP.class.getSimpleName());

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }
}
