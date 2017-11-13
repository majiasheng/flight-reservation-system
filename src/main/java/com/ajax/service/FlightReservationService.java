/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ajax.service;

import com.ajax.model.Flight;
import com.ajax.model.FlightSearchForm;
import com.ajax.persistence.FlightReservationManager;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author majiasheng
 */
@Service
public class FlightReservationService {
    
    @Autowired
    FlightReservationManager flightReservationManager;
    
    public List<Flight> searchFlight(FlightSearchForm flightSearchForm) {
        
        System.out.println("TODO: query database for results");
        
        //TODO: sanitize inputs/args ?
        
        flightReservationManager.searchFlight(flightSearchForm);
        
        return null;
    }
    
    public boolean bookFlight(Flight flight) {
        return flightReservationManager.bookFlight(flight);
    }

    public boolean handleBid(Map<String, String> requestParams) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        //TODO:set up some return status: 0 low bid, 1 success, -1:ERROR
    }
    
}