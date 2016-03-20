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
public class Supplier extends User{

    String region;
    
    public Supplier(int userId, String userName, String password, String name, String region) {
        super(userId, userName, password, name);
        this.region = region;
    }

    public String getRegion() {
        return region;
    }
    
}
