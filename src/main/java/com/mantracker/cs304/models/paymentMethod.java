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
public class paymentMethod {
    String cardNumber;
    String cardType;
    String accountType;
    String expireDate;
    String ownerID;

    public paymentMethod (String cardNumber, String ownerID, String cardType, String accountType, String expireDate) {
        this.cardNumber = cardNumber;
        this.ownerID = ownerID;
        this.cardType = cardType;
        this.accountType = accountType;
        this.expireDate = expireDate;
    }
    public String getOwnerID() {
        return ownerID;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getCardType() {
        return cardType;
    }
    
    public String getAccountType() {
        return accountType;
    }
    
    public String getExpireDate() {
        return expireDate;
    }
}
