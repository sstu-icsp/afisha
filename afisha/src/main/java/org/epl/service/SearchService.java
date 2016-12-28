package org.epl.service;

import org.epl.model.Event;

import java.util.List;

public interface SearchService {
    List <Event> searchEvent(String param);
    List <Event> searchEventByTypeId(int id);
}
