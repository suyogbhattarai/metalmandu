document.addEventListener('DOMContentLoaded', function () {
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabPanes = document.querySelectorAll('.tab-pane');

    function activateTab(tabName) {
        tabButtons.forEach(btn => {
            const isActive = btn.getAttribute('data-tab') === tabName;
            btn.classList.toggle('active-profile', isActive);
        });

        tabPanes.forEach(pane => {
            const isActive = pane.id === tabName;
            pane.classList.toggle('active-profile', isActive);
        });
    }

    // Tab button click
    tabButtons.forEach(button => {
        button.addEventListener('click', function () {
            const tabToActivate = this.getAttribute('data-tab');
            activateTab(tabToActivate);
        });
    });

    // Cancel button → back to profile
    const cancelButtons = document.querySelectorAll('.cancel-btn');
    cancelButtons.forEach(button => {
        button.addEventListener('click', function () {
            activateTab('profile');
        });
    });

    // Maintain tab state after reload based on messages
    let tabWithMessage = null;

    tabPanes.forEach(pane => {
        const hasError = pane.querySelector('.error-message');
        const hasSuccess = pane.querySelector('.success-message');

        if (hasError || hasSuccess) {
            tabWithMessage = pane.id;
        }
    });

    if (tabWithMessage) {
        activateTab(tabWithMessage);
    } else {
        activateTab('profile'); // Default
    }
});


document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
    e.preventDefault(); // Stop the page from reloading

    const formData = new FormData(this);

    fetch('/changepassword', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(html => {
        document.body.innerHTML = html; // or update only a section
    })
    .catch(err => console.error('Error:', err));
});
