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
public class PurchaseCount {
    String title;
    String userName;
    int purchaseAmount;

    public PurchaseCount(String title, String userName, int purchaseAmount) {
        this.title = title;
        this.userName = userName;
        this.purchaseAmount = purchaseAmount;
    }

    public String getTitle() {
        return title;
    }

    public String getUserName() {
        return userName;
    }

    public int getPurchaseAmount() {
        return purchaseAmount;
    }
    
}
