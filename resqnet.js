/**
 * ResQNet: Smart Emergency Response & Assistance System
 * Client-side Interactivity, Geolocation, First-Aid Navigation & Validations
 */

document.addEventListener("DOMContentLoaded", function () {
    initFirstAidTabs();
    initDisasterTabs();
    initGeolocationButtons();
    initPhotoPreviews();
    initPasswordValidations();
    initClickToCallModals();
});

/**
 * 1. Medical First-Aid Tab Switcher
 */
function initFirstAidTabs() {
    const tabButtons = document.querySelectorAll(".aid-tab-btn");
    if (!tabButtons.length) return;

    tabButtons.forEach(button => {
        button.addEventListener("click", function () {
            const targetId = this.getAttribute("data-target");

            // Remove active from all tabs & content
            tabButtons.forEach(b => b.classList.remove("active"));
            document.querySelectorAll(".aid-tab-content").forEach(c => c.classList.remove("active"));

            // Activate clicked tab
            this.classList.add("active");
            const targetContent = document.getElementById(targetId);
            if (targetContent) {
                targetContent.classList.add("active");
            }

            // Sync hidden subCategory form field if present
            const subCategoryInput = document.getElementById("selectedSubCategoryInput");
            if (subCategoryInput) {
                subCategoryInput.value = this.getAttribute("data-title") || "Medical Emergency";
            }
        });
    });
}

/**
 * 2. Natural Disaster Tab Switcher
 */
function initDisasterTabs() {
    const tabButtons = document.querySelectorAll(".disaster-tab-btn");
    if (!tabButtons.length) return;

    tabButtons.forEach(button => {
        button.addEventListener("click", function () {
            const targetId = this.getAttribute("data-target");

            tabButtons.forEach(b => b.classList.remove("active"));
            document.querySelectorAll(".disaster-tab-content").forEach(c => c.classList.remove("active"));

            this.classList.add("active");
            const targetContent = document.getElementById(targetId);
            if (targetContent) {
                targetContent.classList.add("active");
            }

            const subCategoryInput = document.getElementById("selectedDisasterInput");
            if (subCategoryInput) {
                subCategoryInput.value = this.getAttribute("data-title") || "Natural Disaster";
            }
        });
    });
}

/**
 * 3. Geolocation Permission & Coordinate Autofill
 */
function initGeolocationButtons() {
    const geoButtons = document.querySelectorAll(".btn-fetch-location");
    geoButtons.forEach(btn => {
        btn.addEventListener("click", function () {
            const statusBadge = document.getElementById("geoStatusBadge");
            const latInput = document.getElementById("latitudeInput");
            const lngInput = document.getElementById("longitudeInput");
            const locationInput = document.getElementById("locationInput");

            if (!navigator.geolocation) {
                if (statusBadge) {
                    statusBadge.textContent = "Geolocation is not supported by your browser.";
                    statusBadge.style.color = "#ef4444";
                }
                return;
            }

            if (statusBadge) {
                statusBadge.textContent = "Requesting GPS permission from device...";
                statusBadge.style.color = "#38bdf8";
            }

            navigator.geolocation.getCurrentPosition(
                function (position) {
                    const lat = position.coords.latitude.toFixed(6);
                    const lng = position.coords.longitude.toFixed(6);

                    if (latInput) latInput.value = lat;
                    if (lngInput) lngInput.value = lng;

                    if (statusBadge) {
                        statusBadge.textContent = `Coordinates captured: ${lat}, ${lng} (Accuracy: ~${Math.round(position.coords.accuracy)}m)`;
                        statusBadge.style.color = "#10b981";
                    }

                    // Pre-fill location box if empty
                    if (locationInput && (!locationInput.value || locationInput.value.trim() === "")) {
                        locationInput.value = `GPS: ${lat}, ${lng}`;
                    }

                    // Attempt reverse geocoding via OpenStreetMap Nominatim
                    fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${lat}&lon=${lng}&zoom=18&addressdetails=1`)
                        .then(res => res.json())
                        .then(data => {
                            if (data && data.display_name && locationInput) {
                                locationInput.value = data.display_name;
                            }
                        })
                        .catch(() => {
                            // If offline or CORS restricted, keep GPS coordinates
                        });
                },
                function (error) {
                    let msg = "Location access denied by user.";
                    switch (error.code) {
                        case error.PERMISSION_DENIED:
                            msg = "Permission denied: please enable location in browser settings.";
                            break;
                        case error.POSITION_UNAVAILABLE:
                            msg = "Location unavailable. Please enter address manually.";
                            break;
                        case error.TIMEOUT:
                            msg = "Location request timed out. Please enter address manually.";
                            break;
                    }
                    if (statusBadge) {
                        statusBadge.textContent = msg;
                        statusBadge.style.color = "#f59e0b";
                    }
                },
                { enableHighAccuracy: true, timeout: 10000, maximumAge: 30000 }
            );
        });
    });
}

/**
 * 4. Image Upload Validation & Live Preview
 */
function initPhotoPreviews() {
    const fileInputs = document.querySelectorAll(".input-photo-upload");
    fileInputs.forEach(input => {
        input.addEventListener("change", function () {
            const previewContainer = document.getElementById("photoPreviewContainer");
            const previewImg = document.getElementById("photoPreviewImg");
            const file = this.files[0];

            if (!file) {
                if (previewContainer) previewContainer.style.display = "none";
                return;
            }

            // Max file size: 5MB
            if (file.size > 5 * 1024 * 1024) {
                alert("File size exceeds 5MB limit. Please select a smaller photo.");
                this.value = "";
                if (previewContainer) previewContainer.style.display = "none";
                return;
            }

            if (!file.type.startsWith("image/")) {
                alert("Please select an image file (JPG, PNG, or WEBP).");
                this.value = "";
                if (previewContainer) previewContainer.style.display = "none";
                return;
            }

            if (previewContainer && previewImg) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    previewImg.src = e.target.result;
                    previewContainer.style.display = "block";
                };
                reader.readAsDataURL(file);
            }
        });
    });
}

/**
 * 5. Password Confirmation & Real-time Validation
 */
function initPasswordValidations() {
    const regForm = document.getElementById("registrationForm");
    if (!regForm) return;

    regForm.addEventListener("submit", function (e) {
        const password = document.getElementById("password")?.value || "";
        const confirmPassword = document.getElementById("confirmPassword")?.value || "";
        const phone = document.getElementById("phone")?.value || "";
        const contactPhone = document.getElementById("contactPhone")?.value || "";

        if (password.length < 6) {
            alert("Password must be at least 6 characters long.");
            e.preventDefault();
            return false;
        }

        if (password !== confirmPassword) {
            alert("Passwords do not match. Please re-enter.");
            e.preventDefault();
            return false;
        }

        const phoneRegex = /^[+]?[0-9\s\-()]{7,25}$/;
        if (!phoneRegex.test(phone.trim())) {
            alert("Please enter a valid phone number.");
            e.preventDefault();
            return false;
        }

        if (!phoneRegex.test(contactPhone.trim())) {
            alert("Please enter a valid primary emergency contact phone number.");
            e.preventDefault();
            return false;
        }
    });
}

/**
 * 6. Explicit Click-to-Call Confirmation
 * (Does not automatically dial without user explicit confirmation)
 */
function initClickToCallModals() {
    const callLinks = document.querySelectorAll("a[href^='tel:']");
    callLinks.forEach(link => {
        link.addEventListener("click", function (e) {
            const phoneNum = this.getAttribute("href").replace("tel:", "");
            const contactName = this.getAttribute("data-name") || "Emergency Helpline";
            const confirmCall = confirm(`Call ${contactName} at ${phoneNum} now?`);
            if (!confirmCall) {
                e.preventDefault();
            }
        });
    });
}
