package com.MetalMandu.models;

public class ProductModel {
    private int id;
    private String name;
    private String description;
    private double price;
    private int stockQuantity;
    private String material;
    private String dimensions;
    private String image; // ✅ NEW FIELD
    private int categoryID;
    private int brandID;

    // Constructors
    public ProductModel() {}

    public ProductModel(int id, String name, String description, double price, int stockQuantity,
                        String material, String dimensions, String image,
                        int categoryID, int brandID) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.material = material;
        this.dimensions = dimensions;
        this.image = image;
        this.categoryID = categoryID;
        this.brandID = brandID;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public String getMaterial() { return material; }
    public void setMaterial(String material) { this.material = material; }

    public String getDimensions() { return dimensions; }
    public void setDimensions(String dimensions) { this.dimensions = dimensions; }

    public String getImage() { return image; } 
    public void setImage(String image) { this.image = image; } 

    public int getCategoryID() { return categoryID; }
    public void setCategoryID(int categoryID) { this.categoryID = categoryID; }

    public int getBrandID() { return brandID; }
    public void setBrandID(int brandID) { this.brandID = brandID; }
}
