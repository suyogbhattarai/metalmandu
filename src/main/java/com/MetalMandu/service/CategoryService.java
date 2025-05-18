package com.MetalMandu.service;

import com.MetalMandu.dao.CategoryDAO;
import com.MetalMandu.models.CategoryModel;
import java.util.List;

public class CategoryService {
    private CategoryDAO categoryDAO;

    public CategoryService() {
        this.categoryDAO = new CategoryDAO();
    }

    /**
     * Retrieves the first 7 categories from the database
     * @return List of up to 7 categories
     */
    public List<CategoryModel> getTopCategories( ) {
        return categoryDAO.getTopCategories();
    }
}