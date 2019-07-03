package dao;

import dto.SearchParamsDTO;
import model.Event;

import java.sql.Date;
import java.util.List;

public interface SearchParamsDao {

    List<Event> searchEventsByName(SearchParamsDTO searchParamsDTO);
    List<Event> searchEventsByAddress(SearchParamsDTO searchParamsDTO);
    List<Event> filterEventsByCost(SearchParamsDTO searchParamsDTO);
    List<Event> filterEventsByDate(SearchParamsDTO searchParamsDTO);
}
