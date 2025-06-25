/**
 * Password Confirmation Validation - Submit Only
 * Author: Your Name
 * Description: Validates password confirmation only on form submission
 */


// Initialize validation when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    
    // Only validate on form submission
    if (form) {
        form.addEventListener('submit', function(e) {
            if (!validatePasswordOnSubmit()) {
                e.preventDefault();
                return false;
            }
        });
    }
    
    // Optional: Hide error message when user starts typing in confirm password
    const confirmPasswordInput = document.getElementById('confirmPassword');
    if (confirmPasswordInput) {
        confirmPasswordInput.addEventListener('input', function() {
            const errorDiv = document.getElementById('passwordError');
            if (errorDiv && errorDiv.style.display === 'block') {
                errorDiv.style.display = 'none';
            }
        });
    }
});
