package com.MetalMandu.models;

public class BrandModel {
    private int id;
    private String name;
    private String originCountry;

    // Constructors
    public BrandModel() {}

    public BrandModel(int id, String name, String originCountry) {
        this.id = id;
        this.name = name;
        this.originCountry = originCountry;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getOriginCountry() { return originCountry; }
    public void setOriginCountry(String originCountry) { this.originCountry = originCountry; }
}
