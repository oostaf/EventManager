package service;

import dto.SearchParamsDTO;
import model.Event;

import java.util.List;

public interface SearchService {

    List<Event> searchEventsByName(SearchParamsDTO searchParamsDTO);

    List<Event> searchEventsDynamically(SearchParamsDTO searchParamsDTO);

}
