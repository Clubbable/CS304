/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mantracker.cs304.models.User;

/**
 *
 * @author marti
 */
public class Customer extends User{

    String address;
    
    public Customer(int userId, String userName, String password, String name, String address) {
        super(userId, userName, password, name);
        this.address = address;
    }

    public String getAddress() {
        return address;
    }
    
}
