// products.js - Updated with edit and delete functionality

document.addEventListener('DOMContentLoaded', function() {
  // Get the modal
  const modal = document.getElementById('productModal');
  
  // Get the button that opens the modal
  const addBtn = document.getElementById('addProductBtn');
  
  // Get the <span> element that closes the modal
  const closeBtn = document.querySelector('.close');
  
  // Get the cancel button
  const cancelBtn = document.getElementById('cancelBtn');
  
  // Get all update buttons
  const updateButtons = document.querySelectorAll('.edit');
  
  // Get all delete buttons
  const deleteButtons = document.querySelectorAll('.delete');
  
  // Form elements
  const productForm = document.getElementById('productForm');
  const modalTitle = document.getElementById('modalTitle');
  const productIdInput = document.getElementById('productId');
  const nameInput = document.getElementById('name');
  const priceInput = document.getElementById('price');
  const stockInput = document.getElementById('stock');
  const materialInput = document.getElementById('material');
  const dimensionsInput = document.getElementById('dimensions');
  const brandSelect = document.getElementById('brand');
  const categorySelect = document.getElementById('category');
  const descriptionInput = document.getElementById('description');
  const imageInput = document.getElementById('image');
  const imagePreview = document.getElementById('image-preview');
  const fileName = document.getElementById('file-name');

  // When the user clicks the add button, open the modal
  addBtn.onclick = function() {
    // Clear form for new product
    resetForm();
    modalTitle.textContent = 'Add Product';
    productForm.action = 'http://localhost:8080/MetalMandu/products'; 
    modal.style.display = 'block';
  }
  
  // Add event listeners to all update buttons
  updateButtons.forEach(button => {
    button.addEventListener('click', function() {
      // Get the row that contains this button
      const row = this.closest('tr');
      
      // Extract product data from the row
      const productId = row.cells[1].textContent;
      const productName = row.cells[2].textContent;
      const productPrice = row.cells[3].textContent;
      const productStock = row.cells[4].textContent;
      const productMaterial = row.cells[5].textContent;
      const productDimensions = row.cells[6].textContent;
      const productCategory = row.cells[7].textContent;
      const productBrand = row.cells[8].textContent;
      
      // Get product description, brand, category, and image via AJAX
      fetchProductDetails(productId);
      
      // Set modal title to update
      modalTitle.textContent = 'Update Product';
      
      // Fill form with product data
      productIdInput.value = productId;
      nameInput.value = productName;
      priceInput.value = productPrice;
      stockInput.value = productStock;
      materialInput.value = productMaterial;
      dimensionsInput.value = productDimensions;
      categorySelect.value = productCategory;
      brandSelect.value = productBrand;
      
      // Set the form action to update-product
      productForm.action = 'http://localhost:8080/MetalMandu/update-product';
      
      // Show the modal
      modal.style.display = 'block';
    });
  });
  
  // Add event listeners to all delete buttons
  deleteButtons.forEach(button => {
    button.addEventListener('click', function() {
      const productId = this.getAttribute('data-id');
      
      // Show confirmation dialog
      if (confirm('Are you sure you want to delete this product?')) {
        deleteProduct(productId);
      }
    });
  });
  
  // Function to delete a product
  function deleteProduct(productId) {
    // Create a form dynamically
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = `${window.location.origin}/MetalMandu/delete-product`;
    
    // Create hidden input field for product ID
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'productId';
    input.value = productId;
    
    // Append the input to the form and the form to the body
    form.appendChild(input);
    document.body.appendChild(form);
    
    // Submit the form
    form.submit();
  }
  
  // Function to fetch additional product details
  function fetchProductDetails(productId) {
    // This function would be implemented for AJAX calls to fetch 
    // additional details like description and image
    // Example implementation would use fetch API or XMLHttpRequest
    console.log("Fetching details for product ID:", productId);
    // For now, this is a placeholder
  }
  
  // When the user clicks on <span> (x), close the modal
  closeBtn.onclick = function() {
    modal.style.display = 'none';
  }
  
  // When the user clicks on Cancel, close the modal
  cancelBtn.onclick = function() {
    modal.style.display = 'none';
  }
  
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = 'none';
    }
  }
  
  // Handle form submission
  productForm.addEventListener('submit', function(e) {
    // Form validation could be added here
    // For now, the form will submit normally
    console.log("Form submitted");
  });
  
  // Reset form to default values
  function resetForm() {
    productForm.reset();
    productIdInput.value = '';
    imagePreview.innerHTML = '<span class="no-image">No image selected</span>';
    fileName.textContent = 'No file chosen';
    
    // Clear all error messages
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(error => {
      error.style.display = 'none';
    });
    
    // Remove error class from all inputs
    const formInputs = document.querySelectorAll('.form-control');
    formInputs.forEach(input => {
      input.classList.remove('error');
    });
  }
  
  // Image preview functionality
  imageInput.addEventListener('change', function(e) {
    const file = e.target.files[0];
    fileName.textContent = file ? file.name : 'No file chosen';
    
    imagePreview.innerHTML = '';
    
    if (file) {
      const img = document.createElement('img');
      img.src = URL.createObjectURL(file);
      img.onload = function() {
        URL.revokeObjectURL(this.src);
      }
      imagePreview.appendChild(img);
    } else {
      imagePreview.innerHTML = '<span class="no-image">No image selected</span>';
    }
  });
});