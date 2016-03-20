/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mantracker.cs304.models.Feedback;

import org.joda.time.DateTime;

/**
 *
 * @author marti
 */
public class Feedback {
    int feedBackID;
    DateTime feedBackDate;
    String feedBackComment;
    int rateStar;
    int customerUserId;

    public Feedback(int feedBackID, DateTime feedBackDate, String feedBackComment, int rateStar, int customerUserId) {
        this.feedBackID = feedBackID;
        this.feedBackDate = feedBackDate;
        this.feedBackComment = feedBackComment;
        this.rateStar = rateStar;
        this.customerUserId = customerUserId;
    }

    public int getFeedBackID() {
        return feedBackID;
    }

    public DateTime getFeedBackDate() {
        return feedBackDate;
    }

    public String getFeedBackComment() {
        return feedBackComment;
    }

    public int getRateStar() {
        return rateStar;
    }

    public int getCustomerUserId() {
        return customerUserId;
    }
    
}
