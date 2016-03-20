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
public class SupplierFeedBack extends Feedback{

    int supplierUserId;
    
    public SupplierFeedBack(int feedBackID, DateTime feedBackDate, String feedBackComment, int rateStar, int customerUserId, int supplierUserId) {
        super(feedBackID, feedBackDate, feedBackComment, rateStar, customerUserId);
        this.supplierUserId = supplierUserId;
    }

    public int getSupplierUserId() {
        return supplierUserId;
    }
    
}
