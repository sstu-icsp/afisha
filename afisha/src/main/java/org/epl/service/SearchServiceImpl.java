package org.epl.service;

import org.epl.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class SearchServiceImpl implements SearchService {
    @Autowired private EventService eventService;
    @Override
    public List<Event> searchEvent(String param) {
        List <Event> events=new ArrayList<Event>();
        events.addAll(eventService.findByTitle(param));
        return events;
    }

    @Override
    public List<Event> searchEventByTypeId(int id) {
        return eventService.findByTypeId(id);
    }
}
