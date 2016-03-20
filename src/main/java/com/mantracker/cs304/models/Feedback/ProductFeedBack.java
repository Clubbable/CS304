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
public class ProductFeedBack extends Feedback{

    int productId;
    
    public ProductFeedBack(int feedBackID, DateTime feedBackDate, String feedBackComment, int rateStar, int customerUserId, int productId) {
        super(feedBackID, feedBackDate, feedBackComment, rateStar, customerUserId);
        this.productId = productId;
    }

    public int getProductId() {
        return productId;
    }
    
}
