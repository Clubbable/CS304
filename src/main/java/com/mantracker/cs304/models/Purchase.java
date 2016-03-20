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
    
    int shippingNumber;
    String custShippingAddress;
    String supShippingAddress;
    int orderNumber;
    int productId;
    String cardNumber;
    int customerUserId;
    DateTime purchaseDate;

    public Purchase(int shippingNumber, String custAddress, String supAddress, int orderNumber, int productId, String cardNumber, int customerUserId, DateTime purchaseDate) {
        this.shippingNumber = shippingNumber;
        this.custShippingAddress = custAddress;
        this.supShippingAddress = supAddress;
        this.orderNumber = orderNumber;
        this.productId = productId;
        this.cardNumber = cardNumber;
        this.customerUserId = customerUserId;
        this.purchaseDate = purchaseDate;
    }

    public int getShippingNumber() {
        return shippingNumber;
    }

    public String getCustAddress() {
        return custShippingAddress;
    }

    public String getSupAddress() {
        return supShippingAddress;
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
