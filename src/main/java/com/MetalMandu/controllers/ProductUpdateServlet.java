package com.MetalMandu.controllers;

import com.MetalMandu.models.ProductModel;
import com.MetalMandu.service.updateProduct;
import com.MetalMandu.util.ImageUtil;
import com.MetalMandu.util.ValidationUtil;
import com.MetalMandu.models.CategoryModel;
import com.MetalMandu.models.BrandModel;
import com.MetalMandu.service.CategoryService;
import com.MetalMandu.service.ProductService;
import com.MetalMandu.service.BrandService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class ProductUpdateServlet
 */
@WebServlet("/update-product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProductUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final updateProduct updateProductService = new updateProduct();
    private CategoryService categoryService;
    private ProductService productService;
    private BrandService brandService;
    private final ImageUtil imageUtil = new ImageUtil();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateServlet() {
        super();
        this.categoryService = new CategoryService();
        this.productService = new ProductService();
        this.brandService = new BrandService();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Fetch all the necessary data
        List<CategoryModel> categories = categoryService.getTopCategories();
        List<ProductModel> products = productService.getAllProducts();
        List<BrandModel> brands = brandService.getAllBrand();
    
        Map<Integer, String> categoryMap = new HashMap<>();
        for (CategoryModel category : categories) {
            categoryMap.put(category.getId(), category.getName());
        }

        Map<Integer, String> brandMap = new HashMap<>();
        for (BrandModel brand : brands) {
            brandMap.put(brand.getId(), brand.getName());
        }
        
        req.setAttribute("categories", categories);
        req.setAttribute("brands", brands);
        req.setAttribute("products", products);
        req.setAttribute("categoryMap", categoryMap);
        req.setAttribute("brandMap", brandMap);
        
        // Check for session messages and transfer them to request attributes
        HttpSession session = req.getSession();
        if (session.getAttribute("successUpdate") != null) {
            req.setAttribute("successUpdate", session.getAttribute("successUpdate"));
            session.removeAttribute("successUpdate"); // Clear after use
        }
        
        if (session.getAttribute("errorUpdate") != null) {
            req.setAttribute("errorUpdate", session.getAttribute("errorUpdate"));
            session.removeAttribute("errorUpdate"); // Clear after use
        }
    
        req.getRequestDispatcher("/WEB-INF/Pages/products.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Validate and extract product model
            String validationMessage = validateUpdateForm(req);
            if (validationMessage != null) {
                handleError(req, resp, validationMessage);
                return;
            }

            ProductModel productModel = extractProductModel(req);
            Boolean isUpdated = updateProductService.updateProductDetails(productModel);

            if (isUpdated == null) {
                handleError(req, resp, "Our server is under maintenance. Please try again later!");
            } else if (isUpdated) {
                // Check if a new image was uploaded
                Part imagePart = req.getPart("image");
                if (imagePart != null && imagePart.getSize() > 0) {
                    try {
                        if (uploadImage(req)) {
                            handleSuccess(req, resp, "Product updated successfully!");
                        } else {
                            handleError(req, resp, "Could not upload the image. Product data updated, but image remains unchanged.");
                        }
                    } catch (IOException | ServletException e) {
                        handleError(req, resp, "An error occurred while uploading the image. Product data updated, but image remains unchanged.");
                        e.printStackTrace();
                    }
                } else {
                    // No new image uploaded, just data update
                    handleSuccess(req, resp, "Product updated successfully!");
                }
            } else {
                handleError(req, resp, "Could not update the product. Please try again later!");
            }
        } catch (Exception e) {
            handleError(req, resp, "An unexpected error occurred: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private String validateUpdateForm(HttpServletRequest req) {
        String id = req.getParameter("productId");
        String name = req.getParameter("name");    
        String priceStr = req.getParameter("price");
        String stockStr = req.getParameter("stock");
        String material = req.getParameter("material");
        String dimensions = req.getParameter("dimensions");
        String brandStr = req.getParameter("brand");
        String categoryStr = req.getParameter("category");
        String description = req.getParameter("description");
        
        // Check for product ID (required for update)
        if (ValidationUtil.isNullOrEmpty(id)) {
            return "Product ID is required for update.";
        }
        
        // Validate other fields
        if (ValidationUtil.isNullOrEmpty(name)) {
            return "Name cannot be empty";
        }

        if (!ValidationUtil.isValidPrice(priceStr)) {
            return "Please enter a valid price";
        }

        if (!ValidationUtil.isValidStockNumber(stockStr)) {
            return "Please enter a valid stock Number.";
        }

        if (ValidationUtil.isNullOrEmpty(material)) {
            return "Material cannot be empty";
        }

        if (ValidationUtil.isNullOrEmpty(dimensions)) {
            return "Dimension cannot be empty.";
        }
        
        if (ValidationUtil.isNullOrEmpty(brandStr)) {
            return "Brand should not be empty";
        }
        
        if (ValidationUtil.isNullOrEmpty(categoryStr)) {
            return "Category should not be empty";
        }
        
        if (ValidationUtil.isNullOrEmpty(description)) {
            return "Description cannot be empty.";
        }
        

        // Check if image was uploaded and validate it
        try {
            Part image = req.getPart("image");
            if (image != null && image.getSize() > 0) {
                if (!ValidationUtil.isValidImageExtension(image))
                    return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
            }
        
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            return "Error handling image file. Please ensure the file is valid.";
        }

        return null; // All validations passed
    }

    private ProductModel extractProductModel(HttpServletRequest req) throws Exception {
        int id = Integer.parseInt(req.getParameter("productId"));
        String name = req.getParameter("name");    
        String priceStr = req.getParameter("price");
        String stockStr = req.getParameter("stock");
        String material = req.getParameter("material");
        String dimensions = req.getParameter("dimensions");
        String brandStr = req.getParameter("brand");
        String categoryStr = req.getParameter("category");
        String description = req.getParameter("description");
        
        double price = 0.0;
        int stock = 0;

        try {
            price = Double.parseDouble(priceStr);
            stock = Integer.parseInt(stockStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new Exception("Invalid price or stock format");
        }

        // Get the new image if uploaded, otherwise keep existing
        Part imagePart = req.getPart("image");
        String imageUrl = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            imageUrl = imageUtil.getImageNameFromPart(imagePart);
        } else {
            // Get the existing image URL from a hidden field
            imageUrl = req.getParameter("existingImage");
        }
        
        int brandId = getBrandIdByName(brandStr);
        int categoryId = getCategoryIdByName(categoryStr);
        
        // Check if valid IDs were found
        if (brandId == -1) {
            throw new Exception("Brand not found: " + brandStr);
        }
        
        if (categoryId == -1) {
            throw new Exception("Category not found: " + categoryStr);
        }

        // Create a product model with the ID for update
        ProductModel product = new ProductModel(name, description, price, stock,
                material, dimensions, imageUrl, categoryId, brandId);
        product.setId(id);  // Set the ID for the update operation
        
        return product;
    }
    
    private int getBrandIdByName(String brandName) {
        List<BrandModel> brands = brandService.getAllBrand();
        for (BrandModel brand : brands) {
            if (brand.getName().equalsIgnoreCase(brandName)) {
                return brand.getId();
            }
        }
        return -1; // Brand not found
    }

    private int getCategoryIdByName(String categoryName) {
        List<CategoryModel> categories = categoryService.getTopCategories();
        for (CategoryModel category : categories) {
            if (category.getName().equalsIgnoreCase(categoryName)) {
                return category.getId();
            }
        }
        return -1; // Category not found
    }

    private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
        Part image = req.getPart("image");
        if (image != null && image.getSize() > 0) {
            return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "product");
        }
        return true; // No new image to upload
    }

    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        // Store message in session instead of request
        HttpSession session = req.getSession();
        session.setAttribute("successUpdate", message);
        resp.sendRedirect(req.getContextPath() + "/update-product");
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        // Store message in session instead of request
        HttpSession session = req.getSession();
        session.setAttribute("errorUpdate", message);
        resp.sendRedirect(req.getContextPath() + "/update-product");
    }
}