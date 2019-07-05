package servlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import service.EventService;
import service.EventServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/deactivateEvent"})
public class DeactivateEventServlet extends HttpServlet {

    Logger logger = LoggerFactory.getLogger(DeactivateEventServlet.class);

    public DeactivateEventServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("id"));
            EventService eventService = new EventServiceImp();
            eventService.deactivateEvent(eventId);
            response.sendRedirect(request.getContextPath() + "/eventList");
        } catch (Exception exc) {
            logger.error("Error while event deactivating", exc);
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/oops.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
