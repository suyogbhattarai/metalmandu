document.addEventListener('DOMContentLoaded', function() {
            const placeOrderBtn = document.getElementById('place-order-btn');
            const orderModal = document.getElementById('order-modal');
            const confirmBtn = document.getElementById('confirm-btn');
            const deliveryForm = document.getElementById('delivery-form');
            const successMessage = document.getElementById('success-message');
            const requiredFields = document.querySelectorAll('input[required]');
            
            // Open modal when Place Order is clicked
            placeOrderBtn.addEventListener('click', function() {
                orderModal.style.display = 'flex';
            });
            
            // Close modal when clicking outside
            orderModal.addEventListener('click', function(e) {
                if (e.target === orderModal) {
                    orderModal.style.display = 'none';
                }
            });
            
            // Check if all required fields are filled
            function checkRequiredFields() {
                let allFilled = true;
                requiredFields.forEach(field => {
                    if (!field.value.trim()) {
                        allFilled = false;
                    }
                });
                
                confirmBtn.disabled = !allFilled;
            }
            
            // Add event listeners to all required fields
            requiredFields.forEach(field => {
                field.addEventListener('input', checkRequiredFields);
            });
            
            // Handle form submission
            deliveryForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Get the quantity
                const quantity = document.getElementById('quantity').value;
                
                // Show success message
                successMessage.style.display = 'block';
                
                // Close modal
                orderModal.style.display = 'none';
                
                // After 10 seconds, fade out success message and hide it
                setTimeout(function() {
                    successMessage.style.opacity = '0';
                    setTimeout(function() {
                        successMessage.style.display = 'none';
                        successMessage.style.opacity = '1';
                    }, 500);
                }, 10000);
                
                // Reset form
                deliveryForm.reset();
                
                // Disable confirm button again
                confirmBtn.disabled = true;
            });
        });/**
 * 
 */