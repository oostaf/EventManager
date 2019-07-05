package servlet;

import model.Event;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import service.EventLocationService;
import service.EventLocationServiceImp;
import service.EventService;
import service.EventServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/eventList"})
public class EventListServlet extends HttpServlet {
    Logger logger = LoggerFactory.getLogger(EventListServlet.class);

    public EventListServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            EventLocationService eventLocationService = new EventLocationServiceImp();
            List<Event> list = eventLocationService.getAllEventsJoinLocation();
            request.setAttribute("eventList", list);

            EventService eventService = new EventServiceImp();
            double maxEventsCost = eventService.getMaxEventsCost();
            request.setAttribute("maxEventsCost", maxEventsCost);
            request.setAttribute("minSelectedEventsCost", 0);
            request.setAttribute("maxSelectedEventsCost", maxEventsCost);
            request.setAttribute("selectValue", "default");

            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/eventListView.jsp");
            dispatcher.forward(request, response);
        } catch (Exception exc) {
            logger.info("Exception was received during create event page loading:", exc);
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/oops.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
