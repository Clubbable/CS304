/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mantracker.cs304.models.PaymentMethod;

/**
 *
 * @author marti
 */
public class DebitPaymentMethod {
    String cardNumber;
    String accountType;

    public DebitPaymentMethod(String cardNumber, String accountType) {
        this.cardNumber = cardNumber;
        this.accountType = accountType;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getAccountType() {
        return accountType;
    }

}
