package org.epl.service;

import org.epl.dao.EventDao;
import org.epl.model.Event;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.datetime.joda.JodaDateTimeFormatAnnotationFormatterFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Nodyke on 14.12.2016.
 */
@Service
@Transactional
public class SearchServiceImpl implements SearchService
{
    @Autowired private EventDao eventDao;
    @Override
    public List<Event> searchEvent(String param)
    {
        List <Event> events=new ArrayList<Event>();
        events.addAll(eventDao.findByTitle(param));

        return events;
    }

    @Override
    public List<Event> searchEventById(int id) {
        return eventDao.findByTypeId(id);
    }
}
