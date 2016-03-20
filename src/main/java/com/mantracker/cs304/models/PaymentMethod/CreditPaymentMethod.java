/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mantracker.cs304.models.PaymentMethod;

import org.joda.time.DateTime;

/**
 *
 * @author marti
 */
public class CreditPaymentMethod {
    String cardNumber;
    DateTime expireDate;

    public CreditPaymentMethod(String cardNumber, DateTime expireDate) {
        this.cardNumber = cardNumber;
        this.expireDate = expireDate;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public DateTime getExpireDate() {
        return expireDate;
    }
    
}
