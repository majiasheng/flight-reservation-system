package com.ajax.persistence;

import com.ajax.model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Repository;

@Repository
public class FlightReservationDAO {
    public List<Flight> searchFlight(FlightSearchForm flightSearchForm) {
        Connection conn = MySQLConnection.connect();
        try {
            
	        // TODO: add leg info
	        PreparedStatement stmt =
		        conn.prepareStatement("SELECT F." + Constants.AIRLINEID_FIELD +
			        ", F." + Constants.FLIGHTNO_FIELD + " FROM " +
			        Constants.FLIGHT_TABLE +" F;");
	        ResultSet rs = stmt.executeQuery();
            conn.commit();
            //TODO: query data base for result
            
            //TODO: do not show flights that are full in the search result (Andrew)
        
            
        } catch (SQLException ex) {
            Logger.getLogger(FlightReservationDAO.class.getName()).log(Level.SEVERE, "SQL Error", ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(FlightReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }

    public List<Airport> getAirports() {
    	List<Airport> airports = new ArrayList<>();
	    try {
		    Connection conn = MySQLConnection.connect();
		    PreparedStatement stmt =
			    conn.prepareStatement("SELECT * FROM " + Constants.AIRPORT_TABLE + ";");
		    ResultSet rs = stmt.executeQuery();
		    while(rs.next())
		    	airports.add(new Airport(rs.getString(Constants.AIRPORT_ID), rs.getString(Constants.AIRPORT_NAME),
					    rs.getString(Constants.AIRPORT_CITY), rs.getString(Constants.AIRPORT_COUNTRY)));

//		    airports.forEach(System.out::println);
		    conn.close();
	    } catch (SQLException ex) {
		    Logger.getLogger(FlightReservationDAO.class.getName()).log(Level.SEVERE, "SQL Error", ex);
	    }
    	return airports;
    }

    public boolean bookFlight(Flight flight) {

        //TODO: do book flight
        return false;
    }

}
