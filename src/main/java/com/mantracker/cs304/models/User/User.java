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
public class User {
    int userId;
    String userName;
    String password;
    String name;

    public User(int userId, String userName, String password, String name) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.name = name;
    }

    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }
    
}
