	package com.MetalMandu.controllers;
	import com.MetalMandu.models.BrandModel;
	import com.MetalMandu.service.AddProductService;
	import com.MetalMandu.util.ImageUtil;
	import com.MetalMandu.util.ValidationUtil;
	import com.MetalMandu.models.CategoryModel;
	import com.MetalMandu.models.ProductModel;
	
	import com.MetalMandu.service.BrandService;
	import com.MetalMandu.service.CategoryService;
	import com.MetalMandu.service.ProductService;
	import java.util.Map;
	import java.util.HashMap;
	
	import jakarta.servlet.ServletException;
	import jakarta.servlet.annotation.MultipartConfig;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
	import java.io.IOException;
	import java.util.List;
	
	import jakarta.servlet.http.Part;
	
	/**
	 * Servlet implementation class productsServlet
	 */
	@WebServlet("/products")
	@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50) // 50MB
	public class productsServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		 private CategoryService categoryService;
		   private ProductService productService;
		   private final ImageUtil imageUtil = new ImageUtil();
	   	private final AddProductService addProductService = new AddProductService();
		   private BrandService brandService;
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public productsServlet() {
	        super();
	        this.categoryService = new CategoryService();
	        this.productService = new ProductService();
	        this.brandService = new BrandService();
	      
	        // TODO Auto-generated constructor stub
	    }
	
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
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
		
				System.out.println("categories"+categories);
				System.out.println("brands"+brands);
				System.out.println("prooducts"+products);
			req.getRequestDispatcher("/WEB-INF/Pages/products.jsp").forward(req, resp); // <--- Path is correct
	
		}
	
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
			try {
				// Validate and extract student model
				String validationMessage = validateAddingForm(req);
				if (validationMessage != null) {
					handleError(req, resp, validationMessage);
					return;
				}
	
				ProductModel productModel = extractProductModel(req);
				Boolean isAdded = addProductService.addProduct(productModel);
	
				if (isAdded == null) {
					handleError(req, resp, "Our server is under maintenance. Please try again later!");
				} else if (isAdded) {
					try {
						if (uploadImage(req)) {
							handleSuccess(req, resp, "Your product is successfully added!");
						} else {
							handleError(req, resp, "Could not upload the image. Please try again later!");
						}
					} catch (IOException | ServletException e) {
						handleError(req, resp, "An error occurred while uploading the image. Please try again later!");
						e.printStackTrace(); // Log the exception
					}
				} else {
					handleError(req, resp, "Could not add your account. Please try again later!");
				}
			} catch (Exception e) {
				handleError(req, resp, "An unexpected error occurred. Please try again later!");
				e.printStackTrace(); // Log the exception
			}
			
		}
	
		private String validateAddingForm(HttpServletRequest req) {
			String name = req.getParameter("name");	
			String priceStr = req.getParameter("price");
			String stockStr = req.getParameter("stock");
			String material = req.getParameter("material");
			String dimensions = req.getParameter("dimensions");
			String brandStr = req.getParameter("brand");
			System.out.println("brand"+brandStr);
			
			String categoryStr = req.getParameter("category");
			if (categoryStr != null) {
			    categoryStr = categoryStr.trim();
			}
			
			
			if (brandStr != null) {
			    brandStr = brandStr.trim();
			}
			System.out.println("category"+categoryStr);
			String description = req.getParameter("description");
	
			// Check for null or empty fields first
			if (ValidationUtil.isNullOrEmpty(brandStr))
				return " Brand is required.";
			if (ValidationUtil.isNullOrEmpty(stockStr))
				return "Stock is required.";
			if (ValidationUtil.isNullOrEmpty(priceStr))
				return "Price is required.";
	
	
	
			
		
	
			// Validate fields
		
			if ( ValidationUtil.isNullOrEmpty(name)) {
	           return "Name cannot be empty";
	          
	        }
	
	        if ( !ValidationUtil.isValidPrice(priceStr)) {
	            return "please enter a valid price";
	           
	        }
	
	        if (!ValidationUtil.isValidStockNumber(stockStr)) {
	            return  "Please enter a valid stock Number.";
	        
	        }
	
	        if (ValidationUtil.isNullOrEmpty(material)) {
	           return  "Material cannot be empty";
	           
	        }
	
	        if (ValidationUtil.isNullOrEmpty(dimensions)) {
	            return  "Dimension cannot be empty.";
	           
	        }
	        
	        if (ValidationUtil.isNullOrEmpty(brandStr)) {
	            return  "Brand should not be empty";
	           
	        }
	        
	        if (ValidationUtil.isNullOrEmpty(categoryStr)) {
	            return  "Category should not be empty";
	           
	        }
	        
	  
	
	        
	        if (ValidationUtil.isNullOrEmpty(description)) {
	            return "Description cannot be empty.";
	           
	        }
	
			try {
				Part image = req.getPart("image");
				System.out.println("image extention"+image);
				if (!ValidationUtil.isValidImageExtension(image))
					return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
			} catch (IOException | ServletException e) {
				 e.printStackTrace();
				return "Error handling image file. Please ensure the file is valid.";
			}
	
			return null; // All validations passed
		}
	
		private ProductModel extractProductModel(HttpServletRequest req) throws Exception {
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
			    // Handle parsing error: log it, set default, or return an error
			    e.printStackTrace();
			    // Optionally return or show error to user
			}
	
	
			Part image = req.getPart("image");
			String imageUrl = imageUtil.getImageNameFromPart(image);
			
		    int brandId = getBrandIdByName(brandStr);
		    int categoryId = getCategoryIdByName(categoryStr);
		    
		    // Check if valid IDs were found
		    if (brandId == -1) {
		        throw new Exception("Brand not found: " + brandStr);
		    }
		    
		    if (categoryId == -1) {
		        throw new Exception("Category not found: " + categoryStr);
		    }

		
	    	
	
	
			return new ProductModel( name, description, price, stock,
		            material, dimensions,imageUrl,
		            categoryId,  brandId);
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
			return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "product");
		}
	
		private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message)
				throws ServletException, IOException {
			// Set attributes for the JSP
			req.setAttribute("success", message);
			
			// Load fresh data for the view
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
			
			// Forward to JSP (only once)
			req.getRequestDispatcher("/WEB-INF/Pages/products.jsp").forward(req, resp);
		}
	
		private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
				throws ServletException, IOException {
			// Set error message and form data for retention
			req.setAttribute("error", message);
			req.setAttribute("name", req.getParameter("name"));
			req.setAttribute("price", req.getParameter("price"));
			req.setAttribute("stock", req.getParameter("stock"));
			req.setAttribute("material", req.getParameter("material"));
			req.setAttribute("dimensions", req.getParameter("dimensions"));
			req.setAttribute("brand", req.getParameter("brand"));
			req.setAttribute("category", req.getParameter("category"));
			req.setAttribute("image", req.getParameter("image"));
			req.setAttribute("description", req.getParameter("description"));
			
			// Load fresh data for the view
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
			
			// Forward to JSP (only once)
			req.getRequestDispatcher("/WEB-INF/Pages/products.jsp").forward(req, resp);
		}
	}