/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mantracker.cs304.models;

/**
 *
 * @author marti
 */
public class Product {
    int productId;
    String description;
    String title;
    String type;
    Float price;
    String supplierUserId;
    int productAmount;
    String firstName;
    String lastName;

    public Product(int productId, String description, String title, Float price, String type, String supplierUserId, String lastName, String firstName, int productAmount) {
        this.productId = productId;
        this.description = description;
        this.title = title;
        this.price = price;
        this.type = type;
        this.supplierUserId = supplierUserId;
        this.lastName = lastName;
        this.firstName = firstName;
        this.productAmount = productAmount;
    }

    public int getProductId() {
        return productId;
    }

    public String getDescription() {
        return description;
    }

    public String getTitle() {
        return title;
    }

    public Float getPrice() {
        return price;
    }

    public String getSupplierUserId() {
        return supplierUserId;
    }
   
    public String getType() {
        return type;
    }
    
    public String getLastName () {
        return lastName;
    }
    
    public String getFirstName () {
        return firstName;
    }

    public int getProductAmount() {
        return productAmount;
    }
    
    
}
