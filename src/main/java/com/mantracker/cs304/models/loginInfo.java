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
public class loginInfo {
    String username;
    String password;
    String firstName;
    String lastName;
    boolean loginStatus;

    public loginInfo(String username, String password, boolean loginStatus, String firstName, String lastName) {
        this.username = username;
        this.password = password;
        this.lastName = lastName;
        this.firstName = firstName;
        this.loginStatus = loginStatus;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public boolean getLoginStatus() {
        return loginStatus;
    }
    
    public String getFirstName() {
        return firstName;
    }
    
    public String getLastName() {
        return lastName;
    }
}
