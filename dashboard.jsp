<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Emergency Command Dashboard — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <!-- USER STATUS & PRIMARY EMERGENCY CONTACT BAR -->
        <div class="dashboard-user-bar">
            <div class="user-welcome-info">
                <h2>Welcome back, ${user.fullName}</h2>
                <p>Blood Group: <strong style="color:#ef4444;">${user.medicalDetails.bloodGroup}</strong> | City: <strong>${user.address}</strong></p>
                <p style="font-size:0.85rem; color:#94a3b8; margin-top:4px;">
                    Conditions: <em>${user.medicalDetails.medicalConditions}</em> | Allergies: <em>${user.medicalDetails.allergies}</em>
                </p>
            </div>

            <div style="display:flex; align-items:center; gap:12px; flex-wrap:wrap;">
                <c:choose>
                    <c:when test="${not empty primaryContact}">
                        <div class="user-emergency-badge">
                            <div>
                                <span class="contact-rel">Primary Contact (${primaryContact.relationship})</span>
                                <div class="contact-name">${primaryContact.contactName}</div>
                            </div>
                            <a href="tel:${primaryContact.phone}" class="call-btn-pill" data-name="${primaryContact.contactName}">
                                📞 Call Now
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="user-emergency-badge" style="border-color:#f59e0b;">
                            <span style="color:#fbbf24; font-size:0.85rem;">⚠️ No primary emergency contact registered.</span>
                            <a href="${pageContext.request.contextPath}/profile" class="btn btn-sm btn-secondary">Add Contact</a>
                        </div>
                    </c:otherwise>
                </c:choose>

                <a href="${pageContext.request.contextPath}/profile" class="btn btn-secondary btn-sm">
                    ✏️ Edit Profile
                </a>
            </div>
        </div>

        <!-- QUICK EMERGENCY ACTION STRIP -->
        <div style="display:flex; gap:12px; margin-bottom:30px; flex-wrap:wrap;">
            <a href="tel:112" class="btn btn-primary" style="flex:1; min-width:180px;" data-name="National SOS">
                🚨 National SOS 112
            </a>
            <a href="tel:108" class="btn btn-secondary" style="flex:1; min-width:180px; border-color:#10b981;" data-name="Ambulance Service">
                🚑 Ambulance 108
            </a>
            <a href="tel:101" class="btn btn-secondary" style="flex:1; min-width:180px; border-color:#f97316;" data-name="Fire Control">
                🚒 Fire Rescue 101
            </a>
            <a href="tel:100" class="btn btn-secondary" style="flex:1; min-width:180px; border-color:#38bdf8;" data-name="Police Control">
                👮 Police 100
            </a>
        </div>

        <!-- SIX LARGE CLICKABLE EMERGENCY TILES -->
        <div class="section-header" style="text-align:left; margin-bottom:20px;">
            <p class="section-tag">Emergency Command Tiles</p>
            <h2 class="section-title">Select Crisis Action</h2>
        </div>

        <div class="emergency-tiles-grid">
            <!-- Tile 1: Medical -->
            <a href="${pageContext.request.contextPath}/emergency/medical" class="emergency-tile tile-medical">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🏥</div>
                        <span class="tile-badge">Immediate First Aid</span>
                    </div>
                    <h3 class="tile-title">1. Medical Emergency</h3>
                    <p class="tile-desc">Instant first-aid steps for snake bites, heart attack symptoms, unconscious persons, and severe breathing difficulties.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Start First Aid &amp; Report &rarr;</span>
                    <span style="font-size:0.85rem; color:#ef4444; font-weight:700;">Dial 108</span>
                </div>
            </a>

            <!-- Tile 2: Fire -->
            <a href="${pageContext.request.contextPath}/emergency/fire" class="emergency-tile tile-fire">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🔥</div>
                        <span class="tile-badge">Fire &amp; Evacuation</span>
                    </div>
                    <h3 class="tile-title">2. Fire Emergency</h3>
                    <p class="tile-desc">Report building blazes, electrical fires, and gas leaks. Upload incident photo, alert fire dispatch, and review PASS protocol.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Report Fire &rarr;</span>
                    <span style="font-size:0.85rem; color:#fb923c; font-weight:700;">Dial 101</span>
                </div>
            </a>

            <!-- Tile 3: Accident -->
            <a href="${pageContext.request.contextPath}/emergency/accident" class="emergency-tile tile-accident">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🚗</div>
                        <span class="tile-badge">Collision / Crash</span>
                    </div>
                    <h3 class="tile-title">3. Accident Emergency</h3>
                    <p class="tile-desc">Vehicle collisions and pedestrian injuries. Capture GPS, upload photo, and automatically prepare alert for your contact and trauma hospital.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Report Accident &rarr;</span>
                    <span style="font-size:0.85rem; color:#facc15; font-weight:700;">Trauma SOS</span>
                </div>
            </a>

            <!-- Tile 4: Crime & Safety -->
            <a href="${pageContext.request.contextPath}/emergency/crime" class="emergency-tile tile-crime">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🛡️</div>
                        <span class="tile-badge">Police Protection</span>
                    </div>
                    <h3 class="tile-title">4. Crime and Personal Safety</h3>
                    <p class="tile-desc">Harassment, threats, robbery, or suspicious activity. Submit anonymous or identified reports directly to local police desks.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Report Incident &rarr;</span>
                    <span style="font-size:0.85rem; color:#22d3ee; font-weight:700;">Dial 100</span>
                </div>
            </a>

            <!-- Tile 5: Natural Disasters -->
            <a href="${pageContext.request.contextPath}/emergency/disaster" class="emergency-tile tile-disaster">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">🌊</div>
                        <span class="tile-badge">Rescue &amp; Shelter</span>
                    </div>
                    <h3 class="tile-title">5. Natural Disasters</h3>
                    <p class="tile-desc">Floods, earthquakes, landslides, and cyclones. Survival guidance, evacuation checklists, and NDRF relief request reporting.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Disaster Action &rarr;</span>
                    <span style="font-size:0.85rem; color:#34d399; font-weight:700;">Dial 1078</span>
                </div>
            </a>

            <!-- Tile 6: Other Emergencies -->
            <a href="${pageContext.request.contextPath}/emergency/other" class="emergency-tile tile-other">
                <div>
                    <div class="tile-top">
                        <div class="tile-icon">⚡</div>
                        <span class="tile-badge">Custom SOS</span>
                    </div>
                    <h3 class="tile-title">6. Other Emergencies</h3>
                    <p class="tile-desc">General crises, chemical hazards, animal encounters, or structural distress with location tracking and photo attachment.</p>
                </div>
                <div class="tile-footer">
                    <span class="tile-cta">Report Crisis &rarr;</span>
                    <span style="font-size:0.85rem; color:#c084fc; font-weight:700;">Control Desk</span>
                </div>
            </a>
        </div>

        <!-- RECENT EMERGENCY REPORTS STATUS STRIP -->
        <c:if test="${not empty userReports}">
            <div style="background:var(--navy-card); border:1px solid var(--navy-border); border-radius:var(--radius-lg); padding:24px; margin-top:20px;">
                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:16px;">
                    <h3 style="color:#ffffff; font-size:1.2rem;">Your Recent Emergency Reports</h3>
                    <a href="${pageContext.request.contextPath}/my-reports" style="color:var(--blue-accent); font-size:0.9rem; font-weight:600;">View All Reports &rarr;</a>
                </div>
                <div class="table-responsive">
                    <table class="resq-table">
                        <thead>
                            <tr>
                                <th>Tracking ID</th>
                                <th>Category</th>
                                <th>Sub-Category</th>
                                <th>Location</th>
                                <th>Status</th>
                                <th>Date/Time</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rep" items="${userReports}" begin="0" end="4">
                                <tr>
                                    <td><strong>${rep.reportTrackingId}</strong></td>
                                    <td>${rep.category}</td>
                                    <td>${rep.subCategory}</td>
                                    <td>${rep.incidentLocation}</td>
                                    <td>
                                        <span class="status-badge status-${rep.status == 'Resolved' ? 'resolved' : 'dispatched'}">
                                            ${rep.status}
                                        </span>
                                    </td>
                                    <td>${rep.createdAt}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/my-reports?id=${rep.reportId}" class="btn btn-secondary btn-sm">
                                            Details
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
