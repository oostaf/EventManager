package servlet;

import model.Event;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import service.EventServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(urlPatterns = {"/editEvent"})
public class EditEventServlet extends HttpServlet {

    Logger logger = LoggerFactory.getLogger(CreateEventServlet.class);

    public EditEventServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(request.getParameter("id"));
        EventServiceImp eventServiceImp = new EventServiceImp();
        Event event = eventServiceImp.getEventByID(eventId);
        if (event == null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/oops.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("event", event);

            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/editEventView.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String address = request.getParameter("address");
            double cost = Double.parseDouble(request.getParameter("cost"));
            String dateFromRequest = request.getParameter("date");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm");
            LocalDateTime formatDateTime = LocalDateTime.parse(dateFromRequest, formatter);

            EventServiceImp eventServiceImp = new EventServiceImp();
            Event event = eventServiceImp.getEventByID(eventId);
            event.setName(name);
            event.setDescription(description);
            event.setAddress(address);
            event.setCost(cost);
            event.setDate(formatDateTime);

            eventServiceImp.updateEvent(event);

            request.setAttribute("event", event);
            response.sendRedirect(request.getContextPath() + "/eventList");
        } catch (Exception exc) {
            logger.info("Exception was received during event adding:", exc);
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/oops.jsp");
            dispatcher.forward(request, response);
        }
    }

}
