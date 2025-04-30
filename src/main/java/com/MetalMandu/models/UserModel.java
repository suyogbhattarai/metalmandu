package com.MetalMandu.models;

public class UserModel {
	    private int id;
	    private String userName;
	    private String email;
	    private String password;
	    private boolean isActive;
	    private boolean isStaff;
	    private boolean isAdmin;
	    private String firstName;
	    private String lastName;
	    private String address;
	    private String phoneNumber;

    // Constructors
    public UserModel() {}

    public UserModel(int id, String userName, String email, String password, boolean isActive,
                     boolean isStaff, boolean isAdmin, String firstName, String lastName,
                     String address, String phoneNumber) {
        this.id = id;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.isActive = isActive;
        this.isStaff = isStaff;
        this.isAdmin = isAdmin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }
    
    public UserModel( String userName, String email, String password) {

this.userName = userName;
this.email = email;
this.password = password;

}
    
    public UserModel( String userName, String password) {

    	this.userName = userName;
    	
    	this.password = password;

    	}

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public boolean isStaff() {
        return isStaff;
    }

    public void setStaff(boolean staff) {
        isStaff = staff;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}

