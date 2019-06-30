package servlet;

import model.Event;
import service.EventService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(urlPatterns = {"/createEvent"})
public class CreateEventServlet extends HttpServlet {

    public CreateEventServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/createEventView.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        double cost = Double.parseDouble(request.getParameter("price"));
        String dateFromRequest = request.getParameter("date");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm");
        LocalDateTime formatDateTime = LocalDateTime.parse(dateFromRequest, formatter);

        Event event = new Event();
        event.setName(name);
        event.setDescription(description);
        event.setAddress(address);
        event.setCost(cost);
        event.setDate(formatDateTime);

        EventService eventService = new EventService();
        eventService.addEvent(event);

        request.setAttribute("event", event);

        response.sendRedirect(request.getContextPath() + "/eventList");
    }

}
