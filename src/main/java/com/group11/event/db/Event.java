/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group11.event.db;

import com.group11.config.MysqlConnect;
import com.mysql.cj.jdbc.CallableStatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author ishan
 */
public class Event {
    private String announcementId;
    private String description;
    private String publishDate;
    private String title;
    private String venue;
    private String publisher;

    public Event(String announcementId, String description, String publishDate, String title, String venue, String publisher) {
        this.announcementId = announcementId;
        this.description = description;
        this.publishDate = publishDate;
        this.title = title;
        this.venue = venue;
        this.publisher = publisher;
    }
    
    

    /**
     * @return the announcementId
     */
    public String getAnnouncementId() {
        return announcementId;
    }

    /**
     * @param announcementId the announcementId to set
     */
    public void setAnnouncementId(String announcementId) {
        this.announcementId = announcementId;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the publishDate
     */
    public String getPublishDate() {
        return publishDate;
    }

    /**
     * @param publishDate the publishDate to set
     */
    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the venue
     */
    public String getVenue() {
        return venue;
    }

    /**
     * @param venue the venue to set
     */
    public void setVenue(String venue) {
        this.venue = venue;
    }

    /**
     * @return the publisher
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * @param publisher the publisher to set
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }


    public static boolean addStaffMember(
        String description,
        String publishDate,
        String title,
        String venue,
        String publisher
             ) {
        try {
            Connection conn = MysqlConnect.ConnectDB();
            // validate staff member
            String query = "INSERT INTO announcement(description,publish_date,title,venue,publisher) VALUES(?,?,?,?,?);";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);
            stmt.setString(1, description);
            stmt.setString(2, publishDate);
            stmt.setString(3, title);
            stmt.setString(4, venue);
            stmt.setString(5, publisher);
            System.out.println(stmt.execute());
            conn.close();
            return true;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "", 1);
            return false;
        }
    }
    
    public static ArrayList<Event> getEventTable() {
        ArrayList<Event> eventList = new ArrayList<Event>();
        try {
            Connection conn = MysqlConnect.ConnectDB();

            String query = "select * from announcement";
            PreparedStatement stmt = (PreparedStatement)conn.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Event eventItem = new Event(rs.getString("announcement_id"), rs.getString("description"),
                        rs.getString("publish_date"), rs.getString("title"), rs.getString("venue"),
                        rs.getString("publisher"));
                eventList.add(eventItem);
            }
            return eventList;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), e.getMessage(), 0);
            return null;
        }
    }
    
    
}
