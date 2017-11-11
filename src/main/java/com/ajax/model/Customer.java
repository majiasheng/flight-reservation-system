package com.ajax.model;

public class Customer extends Person {

    // counter for account number
    public static int count = 0;

    protected String email;
    private long creditCard;
    private int rating;
    private final int accNum;

    public Customer() {
        // rating is default as 0
        accNum = count++;
        rating = 0;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAccNum() {
        return accNum;
    }

//    public void setAccNum(int accNum) {
//        this.accNum = accNum;
//    }
    public long getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(long creditCard) {
        this.creditCard = creditCard;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Username: " + userName + "\n"
                + "Full name: " + firstName + " " + lastName + "\n"
                + "Email: " + email + "\n"
                + "Address :" + address.toString();

    }
}
