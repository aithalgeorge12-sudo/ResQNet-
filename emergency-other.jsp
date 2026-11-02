<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Other Emergencies & Crisis Intake — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Emergency Module 6</p>
            <h2 class="section-title">Other Emergencies &amp; Custom Crisis Intake</h2>
            <p class="section-subtitle">Report chemical spillages, industrial gas leaks, wild animal intrusions, building collapses, or any urgent crisis not listed above.</p>
        </div>

        <div class="form-shell">
            <div class="form-card">
                <div class="form-header">
                    <h3>Report Uncategorized Emergency Incident</h3>
                    <p style="color:#64748b; font-size:0.9rem;">
                        Our response dispatch algorithms review all custom reports and forward them to specialized municipal and police disaster divisions.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/emergency/other" method="POST" enctype="multipart/form-data">
                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="emergencyType">Emergency Type / Subject <span class="req">*</span></label>
                            <input type="text" id="emergencyType" name="emergencyType" class="form-control" placeholder="e.g. Hazardous Chemical Leak / Dangerous Animal Encounter" required>
                        </div>

                        <div class="form-group">
                            <label for="severity">Severity Assessment <span class="req">*</span></label>
                            <select id="severity" name="severity" class="form-control" required>
                                <option value="Critical">🔴 Critical (Life in immediate danger)</option>
                                <option value="High" selected>🟠 High (Substantial injury / hazard)</option>
                                <option value="Medium">🟡 Medium (Potentially dangerous)</option>
                                <option value="Low">🟢 Low (Advisory / Non-urgent)</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="callerContact">Callback Contact Phone Number <span class="req">*</span></label>
                        <input type="tel" id="callerContact" name="callerContact" class="form-control" placeholder="e.g. +91 9876543210" value="${user != null ? user.phone : ''}" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Detailed Situation Description <span class="req">*</span></label>
                        <textarea id="description" name="description" class="form-control" placeholder="Explain the hazard, who is affected, physical symptoms, and immediate risks in detail..." required></textarea>
                    </div>

                    <!-- GEOLOCATION SECTION -->
                    <div class="form-group">
                        <label for="locationInput">Incident Location / Address <span class="req">*</span></label>
                        <div style="display:flex; gap:10px; margin-bottom:8px; flex-wrap:wrap;">
                            <input type="text" id="locationInput" name="location" class="form-control" style="flex:1;" placeholder="Building, area, street landmark, or click GPS" required>
                            <button type="button" class="geo-btn btn-fetch-location">
                                📍 Share My GPS Location
                            </button>
                        </div>
                        <input type="hidden" id="latitudeInput" name="latitude">
                        <input type="hidden" id="longitudeInput" name="longitude">
                        <span id="geoStatusBadge" class="geo-status-badge"></span>
                    </div>

                    <!-- OPTIONAL PHOTO UPLOAD -->
                    <div class="form-group">
                        <label for="photo">Optional Incident Photo (Max 5MB)</label>
                        <input type="file" id="photo" name="photo" class="form-control input-photo-upload" accept="image/jpeg,image/png,image/webp">
                        <div id="photoPreviewContainer" style="display:none; margin-top:12px;">
                            <img id="photoPreviewImg" src="" alt="Preview" style="max-height:180px; border-radius:8px; border:1px solid #cbd5e1;">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block" style="padding:15px; font-size:1.1rem; background:#7e22ce;">
                        ⚡ Transmit Emergency Report
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
