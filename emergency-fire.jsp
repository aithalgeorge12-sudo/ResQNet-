<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Fire Emergency & Rescue — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Emergency Module 2</p>
            <h2 class="section-title">Fire Emergency &amp; Safety Protocol</h2>
            <p class="section-subtitle">Report blazing fires, gas leaks, and trapped individuals. Immediately alert fire control and review the life-saving PASS protocol.</p>
        </div>

        <!-- FIRE EMERGENCY QUICK HELPLINES STRIP -->
        <div style="display:flex; justify-content:space-between; align-items:center; background:linear-gradient(135deg, #7c2d12, #451a03); border:1px solid #ea580c; border-radius:12px; padding:20px; margin-bottom:30px; flex-wrap:wrap; gap:16px;">
            <div>
                <h3 style="color:#ffffff; font-size:1.3rem;">🔥 Active Fire Detected? Evacuate Immediately!</h3>
                <p style="color:#fed7aa; font-size:0.95rem; margin-top:4px;">Do not pause to collect personal belongings. Crawl low under smoke.</p>
            </div>
            <div style="display:flex; gap:12px;">
                <a href="tel:101" class="btn btn-primary" data-name="Fire Department">
                    🚒 Call Fire Dept (101)
                </a>
                <a href="tel:112" class="btn btn-secondary" data-name="National Emergency">
                    🚨 SOS 112
                </a>
            </div>
        </div>

        <!-- ESSENTIAL FIRE PRECAUTIONS & PASS PROTOCOL -->
        <div class="first-aid-container">
            <h3 style="color:#ffffff; margin-bottom:14px; font-size:1.2rem;">Essential Fire Safety Precautions</h3>
            <div style="display:grid; grid-template-columns:repeat(auto-fit, minmax(280px, 1fr)); gap:18px;">
                <!-- Card 1: PASS Method -->
                <div style="background:rgba(255,255,255,0.05); padding:18px; border-radius:10px; border-left:4px solid #f97316;">
                    <h4 style="color:#fb923c; margin-bottom:8px;">🧯 Using an Extinguisher: P.A.S.S.</h4>
                    <p style="font-size:0.9rem; color:#cbd5e1;"><strong>P - PULL</strong> the safety pin from the handle.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;"><strong>A - AIM</strong> low at the base of the fire, not the flames.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;"><strong>S - SQUEEZE</strong> the trigger slowly and evenly.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;"><strong>S - SWEEP</strong> side to side until extinguished.</p>
                </div>

                <!-- Card 2: Stop, Drop and Roll -->
                <div style="background:rgba(255,255,255,0.05); padding:18px; border-radius:10px; border-left:4px solid #ef4444;">
                    <h4 style="color:#f87171; margin-bottom:8px;">🔥 Clothes on Fire: Stop, Drop, Roll</h4>
                    <p style="font-size:0.9rem; color:#cbd5e1;"><strong>STOP:</strong> Do NOT run. Running feeds oxygen to the fire.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;"><strong>DROP:</strong> Drop flat to the floor and cover face with hands.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;"><strong>ROLL:</strong> Roll back and forth continuously to smother the flames.</p>
                </div>

                <!-- Card 3: Smoke Evacuation -->
                <div style="background:rgba(255,255,255,0.05); padding:18px; border-radius:10px; border-left:4px solid #38bdf8;">
                    <h4 style="color:#38bdf8; margin-bottom:8px;">🚪 Smoke &amp; Door Checks</h4>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Feel closed doors with the back of hand before opening.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• If door is warm, DO NOT OPEN. Use another escape route.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Stay low to the floor where cleaner, breathable air remains.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Never use elevators during a building fire.</p>
                </div>
            </div>
        </div>

        <!-- FIRE INCIDENT REPORT FORM -->
        <div class="form-shell">
            <div class="form-card">
                <div class="form-header">
                    <h3>Report Fire Emergency</h3>
                    <p style="color:#64748b; font-size:0.9rem;">
                        Transmit blaze details and optional photographic evidence directly to fire rescue teams and nearby trauma centers.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/emergency/fire" method="POST" enctype="multipart/form-data">
                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="fireType">Type of Fire <span class="req">*</span></label>
                            <select id="fireType" name="fireType" class="form-control" required>
                                <option value="Residential Building Fire" selected>Residential Building Fire</option>
                                <option value="Commercial / Office Fire">Commercial / Office Fire</option>
                                <option value="Electrical Fire">Electrical Fire</option>
                                <option value="Kitchen / LPG Gas Cylinder Blaze">Kitchen / LPG Gas Cylinder Blaze</option>
                                <option value="Vehicle / Automobile Fire">Vehicle / Automobile Fire</option>
                                <option value="Industrial / Chemical Blaze">Industrial / Chemical Blaze</option>
                                <option value="Forest / Wildfire">Forest / Wildfire</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="severity">Severity / Threat Level <span class="req">*</span></label>
                            <select id="severity" name="severity" class="form-control" required>
                                <option value="Critical" selected>🔴 Critical (Spreading rapidly / Threat to Life)</option>
                                <option value="High">🟠 High (Large active flames)</option>
                                <option value="Medium">🟡 Medium (Contained / Moderate smoke)</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="trappedCount">Estimated Trapped / Injured Persons</label>
                            <input type="text" id="trappedCount" name="trappedCount" class="form-control" placeholder="e.g. 2 people trapped on 3rd floor (or 'None')">
                        </div>
                        <div class="form-group">
                            <label for="hospitalId">Nearest Trauma Center Alert</label>
                            <select id="hospitalId" name="hospitalId" class="form-control">
                                <c:forEach var="h" items="${hospitals}">
                                    <option value="${h.hospitalId}">${h.hospitalName} (${h.city})</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Fire Description &amp; Hazards <span class="req">*</span></label>
                        <textarea id="description" name="description" class="form-control" placeholder="Describe fire source, smoke color/thickness, presence of gas cylinders, chemicals, or blocked exits..." required></textarea>
                    </div>

                    <!-- GEOLOCATION SECTION -->
                    <div class="form-group">
                        <label for="locationInput">Incident Location / Building Address <span class="req">*</span></label>
                        <div style="display:flex; gap:10px; margin-bottom:8px; flex-wrap:wrap;">
                            <input type="text" id="locationInput" name="location" class="form-control" style="flex:1;" placeholder="Building name, street, nearby landmark, or use GPS" required>
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
                        <label for="photo">Optional Photo of Fire Scene (Max 5MB)</label>
                        <input type="file" id="photo" name="photo" class="form-control input-photo-upload" accept="image/jpeg,image/png,image/webp">
                        <small class="form-hint">Only capture photos from a completely safe distance. Do not risk safety for photos.</small>
                        <div id="photoPreviewContainer" style="display:none; margin-top:12px;">
                            <img id="photoPreviewImg" src="" alt="Preview" style="max-height:180px; border-radius:8px; border:1px solid #cbd5e1;">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block" style="padding:15px; font-size:1.1rem; margin-top:14px; background:#ea580c;">
                        🚒 Dispatch Fire Emergency Report Now
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
