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
    String price;
    int supplierUserId;

    public Product(int productId, String description, String title, String price, int supplierUserId) {
        this.productId = productId;
        this.description = description;
        this.title = title;
        this.price = price;
        this.supplierUserId = supplierUserId;
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

    public String getPrice() {
        return price;
    }

    public int getSupplierUserId() {
        return supplierUserId;
    }
    
}
