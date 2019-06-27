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
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy'T'HH:mm");
        java.util.Date date = null;
        try {
            date = simpleDateFormat.parse(dateFromRequest);
        } catch (ParseException e) {
            throw new RuntimeException("Fail to parse date from UI", e);
        }
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());

        Event event = new Event();
        event.setName(name);
        event.setDescription(description);
        event.setAddress(address);
        event.setCost(cost);
        event.setDate(sqlDate);

        EventService eventService = new EventService();
        eventService.addEvent(event);

        request.setAttribute("event", event);

        response.sendRedirect(request.getContextPath() + "/eventList");
    }

}
