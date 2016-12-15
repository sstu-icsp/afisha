package org.epl.service;

import org.epl.model.Event;

import java.util.List;

/**
 * Created by Nodyke on 14.12.2016.
 */
public interface SearchService {
    List <Event> searchEvent(String param);
}
