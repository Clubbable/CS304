/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mantracker.cs304.models;

import org.joda.time.DateTime;

/**
 *
 * @author marti
 */
public class Purchase {
    
    String ShippingAddress;
    int orderNumber;
    int productId;
    String cardNumber;
    int customerUserId;
    DateTime purchaseDate;

    public Purchase(String ShippingAddress, int orderNumber, int productId, String cardNumber, int customerUserId, DateTime purchaseDate) {
        this.ShippingAddress = ShippingAddress;
        this.orderNumber = orderNumber;
        this.productId = productId;
        this.cardNumber = cardNumber;
        this.customerUserId = customerUserId;
        this.purchaseDate = purchaseDate;
    }


    public String getShippingAddress() {
        return ShippingAddress;
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public int getProductId() {
        return productId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public int getCustomerUserId() {
        return customerUserId;
    }

    public DateTime getPurchaseDate() {
        return purchaseDate;
    }
    
    
}
