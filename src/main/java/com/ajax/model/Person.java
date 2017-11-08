package com.ajax.model;

/**
 *
 * @author majiasheng
 */
public class Person {

    // count for person id (used in creations)
    public static int count = 0;

    protected String firstName;
    protected String lastName;
    protected String phone;
    protected Address address;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

}