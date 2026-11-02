<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="ResQNet — Smart Emergency Response & Assistance System" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <!-- HERO SECTION -->
    <header class="hero-section">
        <div class="hero-badge">
            <span class="pulse-dot"></span>
            24/7 Smart Emergency Response Network
        </div>
        <h1 class="hero-title">
            Immediate Help. <span>Zero Hesitation.</span>
        </h1>
        <p class="hero-description">
            ResQNet connects citizens facing critical crises with instant first-aid guidance, automated hospital trauma alerts, and verified emergency contact notifications.
        </p>
        <div class="hero-actions">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                        Go to Emergency Dashboard
                    </a>
                    <a href="${pageContext.request.contextPath}/profile" class="btn btn-secondary">
                        View My Medical Profile
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">
                        Register Free Account
                    </a>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">
                        User Login
                    </a>
                    <a href="${pageContext.request.contextPath}/emergency/accident" class="btn btn-outline-red">
                        Report Emergency As Guest
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </header>

    <!-- QUICK EMERGENCY HOTLINES -->
    <div class="emergency-hotline-bar">
        <div class="hotline-cards-wrapper">
            <a href="tel:112" class="hotline-card" data-name="National Emergency">
                <div class="hotline-icon">🚨</div>
                <div class="hotline-info">
                    <h4>National SOS</h4>
                    <p>112</p>
                </div>
            </a>
            <a href="tel:108" class="hotline-card ambulance" data-name="Ambulance Service">
                <div class="hotline-icon">🚑</div>
                <div class="hotline-info">
                    <h4>Ambulance</h4>
                    <p>108</p>
                </div>
            </a>
            <a href="tel:101" class="hotline-card fire" data-name="Fire Department">
                <div class="hotline-icon">🚒</div>
                <div class="hotline-info">
                    <h4>Fire &amp; Rescue</h4>
                    <p>101</p>
                </div>
            </a>
            <a href="tel:100" class="hotline-card police" data-name="Police Control">
                <div class="hotline-icon">👮</div>
                <div class="hotline-info">
                    <h4>Police</h4>
                    <p>100</p>
                </div>
            </a>
        </div>
    </div>

    <!-- MAIN BODY: SIX EMERGENCY TILES -->
    <main class="main-container">
        <div class="section-header">
            <p class="section-tag">Rapid Response Modules</p>
            <h2 class="section-title">Select Emergency Category</h2>
            <p class="section-subtitle">Choose the category matching your situation for targeted first-aid protocols, location sharing, and direct response dispatch.</p>
        </div>

        <div class="emergency-tiles-grid">
            <!-- 1. Medical Emergency -->
            <a href="${pageContext.request.contextPath}/emergency/medical" class="emergency-tile tile-medical">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🏥</div>
                        <span class="tile-badge">Immediate Care</span>
                    </div>
                    <h3 class="tile-title">Medical Emergency</h3>
                    <p class="tile-desc">Instant first-aid steps for snake bites, heart attack symptoms, unconscious persons, and severe breathing difficulties.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Open Guidance &amp; Alert &rarr;</span>
                    <span style="font-size:0.8rem; color:#ef4444; font-weight:700;">Ambulance: 108</span>
                </div>
            </a>

            <!-- 2. Fire Emergency -->
            <a href="${pageContext.request.contextPath}/emergency/fire" class="emergency-tile tile-fire">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🔥</div>
                        <span class="tile-badge">Fire &amp; Rescue</span>
                    </div>
                    <h3 class="tile-title">Fire Emergency</h3>
                    <p class="tile-desc">Report building, electrical, kitchen, or wildfire blazes. Access PASS extinguisher protocol and evacuation procedures.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Report Fire Blaze &rarr;</span>
                    <span style="font-size:0.8rem; color:#fb923c; font-weight:700;">Fire: 101</span>
                </div>
            </a>

            <!-- 3. Accident Emergency -->
            <a href="${pageContext.request.contextPath}/emergency/accident" class="emergency-tile tile-accident">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🚗</div>
                        <span class="tile-badge">Crash / Trauma</span>
                    </div>
                    <h3 class="tile-title">Accident Emergency</h3>
                    <p class="tile-desc">Report vehicle collisions, pedestrian injuries, or industrial accidents. Upload scene photos and notify trauma hospitals.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">File Accident Report &rarr;</span>
                    <span style="font-size:0.8rem; color:#facc15; font-weight:700;">Trauma SOS</span>
                </div>
            </a>

            <!-- 4. Crime & Personal Safety -->
            <a href="${pageContext.request.contextPath}/emergency/crime" class="emergency-tile tile-crime">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🛡️</div>
                        <span class="tile-badge">Police / Safety</span>
                    </div>
                    <h3 class="tile-title">Crime &amp; Personal Safety</h3>
                    <p class="tile-desc">Report harassment, robbery, imminent threats, or suspicious activity. Optional anonymous reporting to protect victim identity.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Get Police Support &rarr;</span>
                    <span style="font-size:0.8rem; color:#22d3ee; font-weight:700;">Police: 100</span>
                </div>
            </a>

            <!-- 5. Natural Disasters -->
            <a href="${pageContext.request.contextPath}/emergency/disaster" class="emergency-tile tile-disaster">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🌊</div>
                        <span class="tile-badge">Disaster Relief</span>
                    </div>
                    <h3 class="tile-title">Natural Disasters</h3>
                    <p class="tile-desc">Actionable safety precautions and relief requests for floods, earthquakes, landslides, and severe cyclonic storms.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">View Safety &amp; Evacuation &rarr;</span>
                    <span style="font-size:0.8rem; color:#34d399; font-weight:700;">NDRF: 1078</span>
                </div>
            </a>

            <!-- 6. Other Emergencies -->
            <a href="${pageContext.request.contextPath}/emergency/other" class="emergency-tile tile-other">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">⚡</div>
                        <span class="tile-badge">General Crisis</span>
                    </div>
                    <h3 class="tile-title">Other Emergencies</h3>
                    <p class="tile-desc">Submit any unlisted urgent crisis report with location details, description, and scene photo for customized response.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Submit Custom Alert &rarr;</span>
                    <span style="font-size:0.8rem; color:#c084fc; font-weight:700;">Control Desk</span>
                </div>
            </a>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
