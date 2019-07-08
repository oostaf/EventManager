package servlet;

import dto.SearchParamsDTO;
import model.Event;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import service.EventService;
import service.EventServiceImp;
import service.SearchService;
import service.SearchServiceImp;

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

@WebServlet(urlPatterns = {"/searchEvents"})
public class AdminSearchEventsServlet extends HttpServlet {

    Logger logger = LoggerFactory.getLogger(AdminSearchEventsServlet.class);

    public AdminSearchEventsServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchPrice = request.getParameter("searchPrice");
            String searchDates = request.getParameter("searchDates");
            String searchText = request.getParameter("searchText");
            String searchBy = request.getParameter("searchBy");
            if (searchBy.isEmpty()) {
                request.setAttribute("selectValue", "default");
            } else {
                request.setAttribute("selectValue", searchBy);
            }
            request.setAttribute("searchDates", searchDates);
            request.setAttribute("searchText", searchText);

            SearchParamsDTO searchParamsDTO = new SearchParamsDTO();

            if (!searchText.isEmpty()) {
                switch (searchBy) {
                    case "default":
                    case "searchByName": {
                        searchParamsDTO.setName(searchText);
                        break;
                    }
                    case "searchByAddress": {
                        searchParamsDTO.setAddress(searchText);
                        break;
                    }
                    case "searchByDescription": {
                        searchParamsDTO.setDescription(searchText);
                        break;
                    }
                }
            }

            //Parse cost params
            if (!searchPrice.isEmpty()) {
                String[] searchPriceSplit = searchPrice.split("-");
                String minSelectedEventsCost = searchPriceSplit[0].replaceAll("\\D+", "");
                String maxSelectedEventsCost = searchPriceSplit[1].replaceAll("\\D+", "");
                request.setAttribute("maxSelectedEventsCost", maxSelectedEventsCost);
                request.setAttribute("minSelectedEventsCost", minSelectedEventsCost);
                //Set cost params in dto
                searchParamsDTO.setLowerCost(Double.valueOf(minSelectedEventsCost));
                searchParamsDTO.setHigherCost(Double.valueOf(maxSelectedEventsCost));
            }

            //Parse dates params
            if (!searchDates.isEmpty()) {
                String[] searchDatesSplit = searchDates.replaceAll("\\s+", "").split("to");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm");
                LocalDateTime endedFormattedDate = LocalDateTime.parse(searchDatesSplit[1] + " 00:00", formatter);
                LocalDateTime startedFormattedDate = LocalDateTime.parse(searchDatesSplit[0] + " 00:00", formatter);
                //Set dates params to dto
                searchParamsDTO.setStartDate(startedFormattedDate);
                searchParamsDTO.setEndDate(endedFormattedDate);
            }

            EventService eventService = new EventServiceImp();
            double maxEventsCost = eventService.getMaxEventsCost();
            request.setAttribute("maxEventsCost", maxEventsCost);

            SearchService searchService = new SearchServiceImp();
            List<Event> events = searchService.searchEventsDynamically(searchParamsDTO);
            request.setAttribute("eventList", events);
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/adminEventListView.jsp");
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
