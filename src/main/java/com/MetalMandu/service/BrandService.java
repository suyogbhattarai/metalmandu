package com.MetalMandu.service;

import com.MetalMandu.dao.BrandDAO;
import com.MetalMandu.models.BrandModel;
import java.util.List;

public class BrandService {
    private BrandDAO brandDAO;

    public BrandService() {
        this.brandDAO = new BrandDAO();
    }

    /**
     * Retrieves the first 7 categories from the database
     * @return List of up to 7 categories
     */
    public List<BrandModel> getAllBrand( ) {
        return brandDAO.getAllBrand();
    }
}