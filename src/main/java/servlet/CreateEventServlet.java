package servlet;

import model.Event;
import model.Location;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import service.EventService;
import service.EventServiceImp;
import service.LocationService;
import service.LocationServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = {"/createEvent"})
public class CreateEventServlet extends HttpServlet {
    Logger logger = LoggerFactory.getLogger(CreateEventServlet.class);
    LocationService locationService;

    public CreateEventServlet() {
        super();
        locationService = new LocationServiceImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //For typeahead
            List<Location> locations = locationService.getAllLocations();
            request.setAttribute("locations", locations);

            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/createEventView.jsp");
            dispatcher.forward(request, response);
        }catch (Exception exc){
            logger.info("Exception was received during create event page loading:", exc);
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/oops.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String address = request.getParameter("location");
            double cost = Double.parseDouble(request.getParameter("price"));
            String dateFromRequest = request.getParameter("date");

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm");
            LocalDateTime formatDateTime = LocalDateTime.parse(dateFromRequest, formatter);

            Location location = new Location();
            location.setAddress(address);
            locationService.addLocation(location);
            location = locationService.getLocationByAddress(address);

            Event event = new Event();
            event.setName(name);
            event.setDescription(description);
            event.setLocation(location);
            event.setCost(cost);
            event.setDate(formatDateTime);

            EventService eventService = new EventServiceImp();
            eventService.addEvent(event);

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
