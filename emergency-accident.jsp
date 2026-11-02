<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Accident Emergency & Trauma Dispatch — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Emergency Module 3</p>
            <h2 class="section-title">Road &amp; Vehicle Accident Emergency</h2>
            <p class="section-subtitle">File real-time vehicular and pedestrian collision reports. Instantly log notification alerts to your registered primary emergency contact and regional trauma hospital intake.</p>
        </div>

        <!-- NOTIFICATION WORKFLOW & CONTACT STATUS CARD -->
        <div style="background:var(--navy-card); border:1px solid var(--navy-border); border-radius:12px; padding:22px; margin-bottom:30px;">
            <h3 style="color:#ffffff; margin-bottom:12px; font-size:1.15rem;">Automated Notification Dispatch Workflow</h3>
            <p style="color:#cbd5e1; font-size:0.95rem; margin-bottom:14px;">
                Submitting this report immediately activates our in-website notification engine:
            </p>
            <div style="display:grid; grid-template-columns:repeat(auto-fit, minmax(280px, 1fr)); gap:16px;">
                <!-- Workflow Box 1 -->
                <div style="background:rgba(255,255,255,0.04); padding:16px; border-radius:8px; border-left:3px solid #ef4444;">
                    <h4 style="color:#ef4444; margin-bottom:4px;">1. Primary Emergency Contact Alert</h4>
                    <c:choose>
                        <c:when test="${not empty primaryContact}">
                            <p style="font-size:0.9rem; color:#f8fafc;">
                                <strong>Contact:</strong> ${primaryContact.contactName} (${primaryContact.relationship})<br>
                                <strong>Phone:</strong> ${primaryContact.phone}
                            </p>
                            <a href="tel:${primaryContact.phone}" class="call-btn-pill" style="display:inline-flex; margin-top:8px;" data-name="${primaryContact.contactName}">
                                📞 Direct Call Contact
                            </a>
                        </c:when>
                        <c:otherwise>
                            <p style="font-size:0.85rem; color:#fbbf24;">
                                No emergency contact registered in session. Log in or add one in profile to auto-alert contacts.
                            </p>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Workflow Box 2 -->
                <div style="background:rgba(255,255,255,0.04); padding:16px; border-radius:8px; border-left:3px solid #38bdf8;">
                    <h4 style="color:#38bdf8; margin-bottom:4px;">2. Trauma Hospital Intake</h4>
                    <p style="font-size:0.9rem; color:#f8fafc;">
                        Dispatched into the Hospital Trauma Desk portal with your blood group (<strong style="color:#ef4444;">${user != null ? user.medicalDetails.bloodGroup : 'Pending Input'}</strong>) and known medical conditions.
                    </p>
                    <a href="tel:108" class="call-btn-pill" style="display:inline-flex; margin-top:8px; background:#0284c7;" data-name="Ambulance Service">
                        🚑 Call Ambulance 108
                    </a>
                </div>

                <!-- Workflow Box 3 -->
                <div style="background:rgba(255,255,255,0.04); padding:16px; border-radius:8px; border-left:3px solid #10b981;">
                    <h4 style="color:#10b981; margin-bottom:4px;">3. In-Website Notification Log</h4>
                    <p style="font-size:0.85rem; color:#cbd5e1;">
                        Audit records logged to database. <em style="color:#94a3b8;">(External SMS dispatch requires Twilio / AWS SNS gateway credentials configured in NotificationService).</em>
                    </p>
                </div>
            </div>
        </div>

        <!-- ACCIDENT REPORTING FORM -->
        <div class="form-shell">
            <div class="form-card">
                <div class="form-header">
                    <h3>Accident Emergency Intake Form</h3>
                    <p style="color:#64748b; font-size:0.9rem;">
                        All submitted data is stored securely in MySQL with PreparedStatements and protected authorization.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/emergency/accident" method="POST" enctype="multipart/form-data">
                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="accidentType">Accident Category <span class="req">*</span></label>
                            <select id="accidentType" name="accidentType" class="form-control" required>
                                <option value="Road / Vehicle Collision" selected>Road / Vehicle Collision</option>
                                <option value="Motorcycle / Two-Wheeler Crash">Motorcycle / Two-Wheeler Crash</option>
                                <option value="Pedestrian Hit &amp; Run">Pedestrian Hit &amp; Run</option>
                                <option value="Industrial / Machinery Accident">Industrial / Machinery Accident</option>
                                <option value="Severe Fall from Height">Severe Fall from Height</option>
                                <option value="Train / Railway Track Accident">Train / Railway Track Accident</option>
                                <option value="Other Severe Trauma">Other Severe Trauma</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="severity">Severity Rating <span class="req">*</span></label>
                            <select id="severity" name="severity" class="form-control" required>
                                <option value="Critical" selected>🔴 Critical (Severe Trauma / Life at Risk)</option>
                                <option value="High">🟠 High (Heavy damage / Blood loss)</option>
                                <option value="Medium">🟡 Medium (Injuries present / Stable)</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="injuredCondition">Injured Person's Condition <span class="req">*</span></label>
                            <select id="injuredCondition" name="injuredCondition" class="form-control" required>
                                <option value="Critical - Severe Bleeding / Head Injury" selected>Critical - Severe Bleeding / Head Injury</option>
                                <option value="Unconscious but breathing">Unconscious but breathing</option>
                                <option value="Trapped inside crushed vehicle">Trapped inside crushed vehicle</option>
                                <option value="Conscious with fractures">Conscious with fractures</option>
                                <option value="Minor injuries / Shock">Minor injuries / Shock</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="vehiclesInvolved">Vehicles Involved</label>
                            <input type="text" id="vehiclesInvolved" name="vehiclesInvolved" class="form-control" placeholder="e.g. 2 Cars + 1 Motorcycle, Truck collision">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Detailed Incident Description <span class="req">*</span></label>
                        <textarea id="description" name="description" class="form-control" placeholder="Describe the scene, road conditions, number of injured individuals, trapped persons, or hazardous fuel leaks..." required></textarea>
                    </div>

                    <!-- GEOLOCATION SECTION -->
                    <div class="form-group">
                        <label for="locationInput">Incident Location / Road Landmark <span class="req">*</span></label>
                        <div style="display:flex; gap:10px; margin-bottom:8px; flex-wrap:wrap;">
                            <input type="text" id="locationInput" name="location" class="form-control" style="flex:1;" placeholder="Highway name, intersection, kilometer marker, or click GPS button" required>
                            <button type="button" class="geo-btn btn-fetch-location">
                                📍 Share My GPS Location
                            </button>
                        </div>
                        <input type="hidden" id="latitudeInput" name="latitude">
                        <input type="hidden" id="longitudeInput" name="longitude">
                        <span id="geoStatusBadge" class="geo-status-badge"></span>
                    </div>

                    <!-- PHOTO UPLOAD SECTION -->
                    <div class="form-group">
                        <label for="accidentImage">Upload Scene Photograph (Optional, Max 5MB)</label>
                        <input type="file" id="accidentImage" name="accidentImage" class="form-control input-photo-upload" accept="image/jpeg,image/png,image/webp">
                        <small class="form-hint">Photos help attending EMTs assess trauma scale before arriving on site.</small>
                        <div id="photoPreviewContainer" style="display:none; margin-top:12px;">
                            <img id="photoPreviewImg" src="" alt="Preview" style="max-height:180px; border-radius:8px; border:1px solid #cbd5e1;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="hospitalId">Designated Regional Trauma Center</label>
                        <select id="hospitalId" name="hospitalId" class="form-control">
                            <c:forEach var="h" items="${hospitals}">
                                <option value="${h.hospitalId}">${h.hospitalName} (${h.city}) — Ambulance: ${h.ambulancePhone}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block" style="padding:15px; font-size:1.1rem; margin-top:14px; background:#b91c1c;">
                        🚨 Submit Accident Report &amp; Alert Trauma Responders
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
