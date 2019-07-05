package service;

import dao.SearchParamsDao;
import dao.SearchParamsDaoImp;
import dto.SearchParamsDTO;
import model.Event;

import java.util.List;

public class SearchServiceImp implements SearchService {
    SearchParamsDao searchParamsDao;

    public SearchServiceImp(){
        searchParamsDao = new SearchParamsDaoImp();
    }

    @Override
    public List<Event> searchEventsByName(SearchParamsDTO searchParamsDTO) {
        return searchParamsDao.searchEventsByName(searchParamsDTO);
    }

    @Override
    public List<Event> searchEventsDynamically(SearchParamsDTO searchParamsDTO) {
        return searchParamsDao.searchEventsDynamically(searchParamsDTO);
    }
}
