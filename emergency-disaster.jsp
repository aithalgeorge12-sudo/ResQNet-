<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Natural Disasters & Relief — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Emergency Module 5</p>
            <h2 class="section-title">Natural Disaster Safety &amp; Rescue Requests</h2>
            <p class="section-subtitle">Read targeted survival protocols for floods, earthquakes, landslides, and cyclonic storms. Dispatch rescue and shelter requests directly to regional disaster control desks.</p>
        </div>

        <!-- QUICK HELPLINES STRIP -->
        <div style="display:flex; justify-content:space-between; align-items:center; background:linear-gradient(135deg, #064e3b, #022c22); border:1px solid #059669; border-radius:12px; padding:20px; margin-bottom:30px; flex-wrap:wrap; gap:16px;">
            <div>
                <h3 style="color:#ffffff; font-size:1.3rem;">🌊 Disaster Response &amp; Evacuation Hotline</h3>
                <p style="color:#a7f3d0; font-size:0.95rem; margin-top:4px;">National Disaster Response Force (NDRF) and State Relief Desks.</p>
            </div>
            <div style="display:flex; gap:12px;">
                <a href="tel:1078" class="btn btn-primary" style="background:#059669;" data-name="Disaster Management">
                    🌊 NDRF Helpline (1078)
                </a>
                <a href="tel:112" class="btn btn-secondary" data-name="National Emergency">
                    🚨 SOS 112
                </a>
            </div>
        </div>

        <!-- DISASTER PREPAREDNESS & SAFETY TABS -->
        <div class="first-aid-container">
            <h3 style="color:#ffffff; margin-bottom:14px; font-size:1.2rem;">Select Disaster Category for Safety Protocols:</h3>
            <div class="aid-nav-tabs">
                <button type="button" class="disaster-tab-btn aid-tab-btn active" data-target="tab-flood" data-title="Flood Emergency">
                    🌊 Floods
                </button>
                <button type="button" class="disaster-tab-btn aid-tab-btn" data-target="tab-earthquake" data-title="Earthquake Emergency">
                    🏚️ Earthquakes
                </button>
                <button type="button" class="disaster-tab-btn aid-tab-btn" data-target="tab-landslide" data-title="Landslide Emergency">
                    ⛰️ Landslides
                </button>
                <button type="button" class="disaster-tab-btn aid-tab-btn" data-target="tab-cyclone" data-title="Cyclone & Severe Storm">
                    🌪️ Cyclones &amp; Storms
                </button>
            </div>

            <!-- TAB 1: Flood -->
            <div id="tab-flood" class="disaster-tab-content aid-tab-content active">
                <h4 style="color:#34d399; margin-bottom:8px;">🌊 Flood Survival Protocol</h4>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. Move to Higher Ground:</strong> Never stay in basements or ground floor rooms as water levels rise rapidly.</li>
                    <li class="first-aid-step"><strong>2. Turn Off Utilities:</strong> Disconnect electricity and gas supply mains before water enters the premises.</li>
                    <li class="first-aid-step do-not-step"><strong>3. NEVER Walk or Drive Through Floodwater:</strong> Just 15 cm (6 inches) of moving water can knock down an adult; 30 cm (1 foot) can float a car.</li>
                    <li class="first-aid-step warning-step"><strong>4. Avoid Downed Power Lines:</strong> Electrocution is a primary hidden danger in flooded waters.</li>
                </ul>
            </div>

            <!-- TAB 2: Earthquake -->
            <div id="tab-earthquake" class="disaster-tab-content aid-tab-content">
                <h4 style="color:#facc15; margin-bottom:8px;">🏚️ Earthquake Survival: Drop, Cover, Hold On</h4>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. DROP:</strong> Drop onto your hands and knees to prevent being knocked over.</li>
                    <li class="first-aid-step"><strong>2. COVER:</strong> Crawl under a sturdy desk or table. Cover your head and neck with your arms.</li>
                    <li class="first-aid-step"><strong>3. HOLD ON:</strong> Hold on to your shelter until shaking stops completely.</li>
                    <li class="first-aid-step do-not-step"><strong>4. DO NOT RUN OUTSIDE:</strong> Most injuries occur from falling bricks, glass, and facade tiles when running out of buildings.</li>
                </ul>
            </div>

            <!-- TAB 3: Landslide -->
            <div id="tab-landslide" class="disaster-tab-content aid-tab-content">
                <h4 style="color:#fb923c; margin-bottom:8px;">⛰️ Landslide &amp; Mudflow Precautions</h4>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. Listen for Unusual Sounds:</strong> Rumbling noises, cracking trees, or sudden mud seeping in slopes signal movement.</li>
                    <li class="first-aid-step"><strong>2. Evacuate Path of Slide:</strong> Move quickly away from the path of flow to stable high ground across the slide.</li>
                    <li class="first-aid-step warning-step"><strong>3. Curl into a Ball:</strong> If escape is impossible, curl into a tight ball and protect your head.</li>
                </ul>
            </div>

            <!-- TAB 4: Cyclone -->
            <div id="tab-cyclone" class="disaster-tab-content aid-tab-content">
                <h4 style="color:#38bdf8; margin-bottom:8px;">🌪️ Cyclone &amp; Severe Storm Preparedness</h4>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. Secure Windows:</strong> Shutter or board windows. Move to the strongest interior room without glass.</li>
                    <li class="first-aid-step"><strong>2. Emergency Kit:</strong> Keep battery torches, canned food, drinking water (3L per person per day), and vital medications in waterproof bags.</li>
                    <li class="first-aid-step do-not-step"><strong>3. Beware the Eye of the Storm:</strong> If winds suddenly stop, DO NOT go outside. The opposite hurricane winds will resume violently shortly.</li>
                </ul>
            </div>
        </div>

        <!-- DISASTER RELIEF REQUEST FORM -->
        <div class="form-shell">
            <div class="form-card">
                <div class="form-header">
                    <h3>Submit Disaster Rescue &amp; Relief Request</h3>
                    <p style="color:#64748b; font-size:0.9rem;">
                        This alert signals search and rescue personnel, NDRF units, and relief distribution centers.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/emergency/disaster" method="POST">
                    <input type="hidden" id="selectedDisasterInput" name="disasterType" value="Flood Emergency">

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="severity">Crisis Severity <span class="req">*</span></label>
                            <select id="severity" name="severity" class="form-control" required>
                                <option value="Critical" selected>🔴 Critical (Immediate Life Threat / Submerged)</option>
                                <option value="High">🟠 High (Trapped / Structural Damage)</option>
                                <option value="Medium">🟡 Medium (Shelter / Food / Water Needed)</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="reliefNeeded">Primary Assistance Needed <span class="req">*</span></label>
                            <select id="reliefNeeded" name="reliefNeeded" class="form-control" required>
                                <option value="Boat / Air Rescue (Trapped on roof/water)" selected>Boat / Air Rescue (Trapped on roof/water)</option>
                                <option value="Medical Evacuation for Injured/Elderly">Medical Evacuation for Injured/Elderly</option>
                                <option value="Emergency Food &amp; Potable Water">Emergency Food &amp; Potable Water</option>
                                <option value="Shelter &amp; Blanket Provision">Shelter &amp; Blanket Provision</option>
                                <option value="Clear Road Blockage / Fallen Trees">Clear Road Blockage / Fallen Trees</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Disaster Situation &amp; Headcount <span class="req">*</span></label>
                        <textarea id="description" name="description" class="form-control" placeholder="Specify number of individuals trapped (adults, children, elderly), current water depth or damage severity, building floor level..." required></textarea>
                    </div>

                    <!-- GEOLOCATION SECTION -->
                    <div class="form-group">
                        <label for="locationInput">Exact Location / Coordinates <span class="req">*</span></label>
                        <div style="display:flex; gap:10px; margin-bottom:8px; flex-wrap:wrap;">
                            <input type="text" id="locationInput" name="location" class="form-control" style="flex:1;" placeholder="Village, ward, rooftop landmark, or click GPS" required>
                            <button type="button" class="geo-btn btn-fetch-location">
                                📍 Share My GPS Location
                            </button>
                        </div>
                        <input type="hidden" id="latitudeInput" name="latitude">
                        <input type="hidden" id="longitudeInput" name="longitude">
                        <span id="geoStatusBadge" class="geo-status-badge"></span>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block" style="padding:15px; font-size:1.1rem; background:#059669;">
                        🌊 Send Natural Disaster Rescue Alert
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
