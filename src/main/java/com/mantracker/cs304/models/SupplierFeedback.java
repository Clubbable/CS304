/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mantracker.cs304.models;

/**
 *
 * @author syltaxue
 */
public class SupplierFeedback {
    int feedbackID;
    String feedbackDate;
    String feedbackComment;
    int rateStar;
    String supplierUserID;
    String feedbackTitle;
    String customerUserID;
    String lastName;
    String firstName;

    public SupplierFeedback(int feedbackID, String feedbackDate, String feedbackComment, int rateStar, String supplierUserID, String feedbackTitle, String customerUserID, String lastName, String firstName) {
        this.feedbackID = feedbackID;
        this.feedbackDate = feedbackDate;
        this.feedbackComment = feedbackComment;
        this.rateStar = rateStar;
        this.supplierUserID = supplierUserID;
        this.feedbackTitle = feedbackTitle;
        this.customerUserID = customerUserID;
        this.lastName = lastName;
        this.firstName = firstName;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public String getFeedbackDate() {
        return feedbackDate;
    }

    public String getFeedBackComment() {
        return feedbackComment;
    }

    public int getRateStar() {
        return rateStar;
    }

    public String getSupplierUserID() {
        return supplierUserID;
    }
   
    public String getFeedbackTitle() {
        return feedbackTitle;
    }
    
    public String getCustomerUserID () {
        return customerUserID;
    }
    
    public String getFirstName () {
        return firstName;
    }
    
    public String getLastName () {
        return lastName;
    }
}
