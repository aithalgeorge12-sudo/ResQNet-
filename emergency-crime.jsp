<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Crime & Personal Safety — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Emergency Module 4</p>
            <h2 class="section-title">Crime &amp; Personal Safety Response</h2>
            <p class="section-subtitle">Report harassment, robbery, imminent physical threats, or suspicious behavior. Includes privacy protection and anonymous reporting.</p>
        </div>

        <!-- QUICK HELPLINES STRIP -->
        <div style="display:flex; justify-content:space-between; align-items:center; background:linear-gradient(135deg, #0e3b5e, #082f49); border:1px solid #0284c7; border-radius:12px; padding:20px; margin-bottom:30px; flex-wrap:wrap; gap:16px;">
            <div>
                <h3 style="color:#ffffff; font-size:1.3rem;">🛡️ In Imminent Danger? Contact Police Right Away</h3>
                <p style="color:#bae6fd; font-size:0.95rem; margin-top:4px;">Move toward well-lit public areas, open stores, or groups of bystanders.</p>
            </div>
            <div style="display:flex; gap:12px;">
                <a href="tel:100" class="btn btn-primary" style="background:#0284c7;" data-name="Police Control">
                    👮 Police Control (100)
                </a>
                <a href="tel:112" class="btn btn-secondary" data-name="National Emergency">
                    🚨 SOS 112
                </a>
                <a href="tel:1091" class="btn btn-secondary" style="border-color:#ec4899; color:#f472b6;" data-name="Women Helpline">
                    🚺 Women Helpline (1091)
                </a>
            </div>
        </div>

        <!-- PERSONAL SAFETY GUIDELINES -->
        <div class="first-aid-container">
            <h3 style="color:#ffffff; margin-bottom:14px; font-size:1.2rem;">Immediate Safety Guidelines</h3>
            <div style="display:grid; grid-template-columns:repeat(auto-fit, minmax(280px, 1fr)); gap:18px;">
                <div style="background:rgba(255,255,255,0.05); padding:18px; border-radius:10px; border-left:4px solid #38bdf8;">
                    <h4 style="color:#38bdf8; margin-bottom:8px;">🏃 Being Followed / Stalked</h4>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Never head straight home or to isolated corners.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Cross the street, head into an open cafe, hotel lobby, or station.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Call your primary contact or police on loud speaker.</p>
                </div>

                <div style="background:rgba(255,255,255,0.05); padding:18px; border-radius:10px; border-left:4px solid #ef4444;">
                    <h4 style="color:#ef4444; margin-bottom:8px;">⚠️ Armed Robbery / Theft</h4>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Do NOT resist physical demands for material items.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Keep hands visible and avoid sudden movements.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Mentally note suspect appearance: height, clothing, tattoos, vehicle.</p>
                </div>

                <div style="background:rgba(255,255,255,0.05); padding:18px; border-radius:10px; border-left:4px solid #f59e0b;">
                    <h4 style="color:#f59e0b; margin-bottom:8px;">🔊 Harassment in Transit</h4>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Make loud, clear verbal boundaries: "Back off, stop touching me."</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Alert bus drivers, train conductors, or nearby passengers.</p>
                    <p style="font-size:0.9rem; color:#cbd5e1;">• Share live trip GPS with your trusted emergency contacts.</p>
                </div>
            </div>
        </div>

        <!-- CRIME REPORTING FORM -->
        <div class="form-shell">
            <div class="form-card">
                <div class="form-header">
                    <h3>Report Crime or Safety Threat</h3>
                    <p style="color:#64748b; font-size:0.9rem;">
                        You may file this report under your verified identity or check the anonymous toggle to shield your name and medical records.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/emergency/crime" method="POST">
                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="crimeType">Incident Nature <span class="req">*</span></label>
                            <select id="crimeType" name="crimeType" class="form-control" required>
                                <option value="Harassment / Eve Teasing" selected>Harassment / Eve Teasing</option>
                                <option value="Theft / Robbery / Snatching">Theft / Robbery / Snatching</option>
                                <option value="Direct Physical Threats / Intimidation">Direct Physical Threats / Intimidation</option>
                                <option value="Suspicious Activity / Loitering">Suspicious Activity / Loitering</option>
                                <option value="Domestic Violence / Dispute">Domestic Violence / Dispute</option>
                                <option value="Cyber Harassment / Blackmail">Cyber Harassment / Blackmail</option>
                                <option value="Other Crime Threat">Other Crime Threat</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="severity">Threat Level <span class="req">*</span></label>
                            <select id="severity" name="severity" class="form-control" required>
                                <option value="Critical">🔴 Imminent Danger (Weapon present / Under Attack)</option>
                                <option value="High" selected>🟠 High (Hostile confrontation / Following)</option>
                                <option value="Medium">🟡 Medium (Theft already occurred / Suspicious)</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Incident Description &amp; Suspect Details <span class="req">*</span></label>
                        <textarea id="description" name="description" class="form-control" placeholder="Describe what occurred, number of perpetrators, clothing, vehicle number plate, direction they fled, and weapons if visible..." required></textarea>
                    </div>

                    <!-- GEOLOCATION SECTION -->
                    <div class="form-group">
                        <label for="locationInput">Incident Location / Current Position <span class="req">*</span></label>
                        <div style="display:flex; gap:10px; margin-bottom:8px; flex-wrap:wrap;">
                            <input type="text" id="locationInput" name="location" class="form-control" style="flex:1;" placeholder="Exact street, shop landmark, bus stop name, or click GPS button" required>
                            <button type="button" class="geo-btn btn-fetch-location">
                                📍 Share My GPS Location
                            </button>
                        </div>
                        <input type="hidden" id="latitudeInput" name="latitude">
                        <input type="hidden" id="longitudeInput" name="longitude">
                        <span id="geoStatusBadge" class="geo-status-badge"></span>
                    </div>

                    <!-- ANONYMOUS TOGGLE OPTION -->
                    <div style="background:#f1f5f9; border:1px solid #cbd5e1; border-radius:8px; padding:16px; margin-bottom:20px;">
                        <label style="display:flex; align-items:center; gap:10px; font-weight:700; color:#0f172a; cursor:pointer;">
                            <input type="checkbox" name="isAnonymous" value="true" style="width:18px; height:18px;">
                            Protect My Identity (Submit As Anonymous Report)
                        </label>
                        <p style="font-size:0.8rem; color:#64748b; margin-top:4px; margin-left:28px;">
                            When checked, your personal name and medical conditions will be omitted from the report, displaying as "Anonymous Citizen" to responders.
                        </p>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block" style="padding:15px; font-size:1.1rem; background:#0284c7;">
                        🛡️ Submit Crime Report &amp; Alert Police Control
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
