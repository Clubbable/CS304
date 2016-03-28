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
    String customerUserId;
    String purchaseDate;
    String firstName;
    String lastName;
    String title;
    float price;
    String supplierUserID;

    public Purchase(String ShippingAddress, int orderNumber, int productId, float price, String supplierUserID, String cardNumber, String customerUserId, String purchaseDate, String firstName, String lastName, String title) {
        this.ShippingAddress = ShippingAddress;
        this.orderNumber = orderNumber;
        this.productId = productId;
        this.customerUserId = customerUserId;
        this.purchaseDate = purchaseDate;
        this.firstName = firstName;
        this.lastName = lastName;
        this.title = title;
        this.price = price;
        this.supplierUserID = supplierUserID;
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

    public String getCustomerUserId() {
        return customerUserId;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }
    
    public String getLastName() {
        return lastName;
    }
    
    public String getFirstName() {
        return firstName;
    }
    
    public String getTitle() {
        return title;
    }
    
    public float getPrice() {
        return price;
    }
    
    public String getSupplierUserID () {
        return supplierUserID;
    }
}
