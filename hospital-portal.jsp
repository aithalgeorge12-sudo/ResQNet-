<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Hospital Response Desk Portal — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag" style="color:#38bdf8;">Authorized Hospital Personnel Only</p>
            <h2 class="section-title">Hospital Emergency Intake Portal</h2>
            <p class="section-subtitle">Real-time emergency intake dashboard for hospital trauma coordinators, ER physicians, and ambulance dispatch teams.</p>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <span>✅ ${successMessage}</span>
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <span>⚠️ ${errorMessage}</span>
            </div>
        </c:if>

        <!-- STATE 1: NOT LOGGED IN AS HOSPITAL STAFF -> SHOW LOGIN FORM -->
        <c:if test="${empty sessionScope.hospitalStaff}">
            <div class="form-shell">
                <div class="form-card compact">
                    <div class="form-header" style="text-align:center;">
                        <div style="font-size:36px; margin-bottom:8px;">🏥</div>
                        <h2>Hospital Staff Login</h2>
                        <p style="color:#64748b; font-size:0.9rem;">
                            Enter your authorized hospital staff code or email to access the incoming trauma queue.
                        </p>
                    </div>

                    <!-- Clear demo credential hint for testing -->
                    <div style="background:#f0f9ff; border:1px solid #bae6fd; border-radius:8px; padding:12px; margin-bottom:18px; font-size:0.85rem; color:#0369a1;">
                        <strong>🔑 Sample Demo Hospital Credentials:</strong><br>
                        • Staff Code: <code style="font-weight:700;">STAFF-101</code><br>
                        • Password: <code style="font-weight:700;">hospital123</code><br>
                        <em>(Hospital: City Care Trauma Hospital - Sample Data)</em>
                    </div>

                    <form action="${pageContext.request.contextPath}/hospital-portal" method="POST">
                        <input type="hidden" name="action" value="login">

                        <div class="form-group">
                            <label for="identifier">Staff Code or Hospital Email <span class="req">*</span></label>
                            <input type="text" id="identifier" name="identifier" class="form-control" placeholder="e.g. STAFF-101 or staff@hospital.com" required autofocus>
                        </div>

                        <div class="form-group">
                            <label for="password">Password <span class="req">*</span></label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Enter staff password" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block" style="padding:14px; background:#0284c7;">
                            🏥 Authenticate &amp; Access Intake Queue
                        </button>
                    </form>
                </div>
            </div>
        </c:if>

        <!-- STATE 2: LOGGED IN AS HOSPITAL STAFF -> SHOW LIVE TRAUMA INTAKE QUEUE -->
        <c:if test="${not empty sessionScope.hospitalStaff}">
            <c:set var="staff" value="${sessionScope.hospitalStaff}" />

            <!-- STAFF HEADER INFO BAR -->
            <div style="background:linear-gradient(135deg, #0e3b5e, #102a43); border:1px solid #38bdf8; border-radius:12px; padding:20px; margin-bottom:30px; display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:16px;">
                <div>
                    <h3 style="color:#ffffff; font-size:1.4rem;">${staff.hospital.hospitalName}</h3>
                    <p style="color:#94a3b8; font-size:0.9rem;">
                        Logged In Staff: <strong style="color:#38bdf8;">${staff.staffName}</strong> (${staff.role}) | Code: <strong>${staff.staffCode}</strong>
                    </p>
                    <p style="color:#a7f3d0; font-size:0.85rem;">Helpline: ${staff.hospital.emergencyHelpline} | Ambulance: ${staff.hospital.ambulancePhone}</p>
                </div>

                <div style="display:flex; gap:10px;">
                    <a href="${pageContext.request.contextPath}/hospital-portal" class="btn btn-secondary btn-sm">
                        🔄 Refresh Queue
                    </a>
                    <a href="${pageContext.request.contextPath}/hospital-portal?action=logout" class="btn btn-primary btn-sm" style="background:#dc2626;">
                        Staff Logout
                    </a>
                </div>
            </div>

            <!-- INTAKE QUEUE TABLE -->
            <div style="background:var(--navy-card); border:1px solid var(--navy-border); border-radius:var(--radius-lg); padding:24px;">
                <h3 style="color:#ffffff; margin-bottom:16px;">Active Incident Dispatch &amp; Ambulance Queue</h3>

                <c:choose>
                    <c:when test="${not empty allReports}">
                        <div class="table-responsive">
                            <table class="resq-table">
                                <thead>
                                    <tr>
                                        <th>Ref ID</th>
                                        <th>Category</th>
                                        <th>Patient / Reporter</th>
                                        <th>Incident Location</th>
                                        <th>Severity</th>
                                        <th>Live Status</th>
                                        <th>Update Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="rep" items="${allReports}">
                                        <tr>
                                            <td><strong style="color:#38bdf8;">${rep.reportTrackingId}</strong></td>
                                            <td>
                                                <strong>${rep.category}</strong><br>
                                                <span style="font-size:0.8rem; color:#94a3b8;">${rep.subCategory}</span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${rep.anonymous}">
                                                        <span style="color:#94a3b8; font-style:italic;">Anonymous Citizen</span>
                                                    </c:when>
                                                    <c:when test="${not empty rep.reporter}">
                                                        <strong>${rep.reporter.fullName}</strong><br>
                                                        <a href="tel:${rep.reporter.phone}" style="font-size:0.8rem; color:#38bdf8;">📞 ${rep.reporter.phone}</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color:#94a3b8;">Guest Citizen</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                ${rep.incidentLocation}
                                                <c:if test="${not empty rep.latitude}">
                                                    <br><small style="color:#a7f3d0;">📍 ${rep.latitude}, ${rep.longitude}</small>
                                                </c:if>
                                            </td>
                                            <td>
                                                <span style="color:#ef4444; font-weight:700;">${rep.severity}</span><br>
                                                <small style="color:#cbd5e1;">${rep.injuredCondition}</small>
                                            </td>
                                            <td>
                                                <span class="status-badge status-${rep.status == 'Resolved' ? 'resolved' : 'dispatched'}">
                                                    ${rep.status}
                                                </span>
                                            </td>
                                            <td>
                                                <!-- STATUS UPDATER FORM -->
                                                <form action="${pageContext.request.contextPath}/hospital-portal" method="POST" style="display:flex; gap:6px;">
                                                    <input type="hidden" name="action" value="update-status">
                                                    <input type="hidden" name="reportId" value="${rep.reportId}">
                                                    <select name="newStatus" class="form-control" style="padding:6px; font-size:0.85rem; width:150px;">
                                                        <option value="Hospital Notified" ${rep.status == 'Hospital Notified' ? 'selected' : ''}>Hospital Notified</option>
                                                        <option value="Ambulance Dispatched" ${rep.status == 'Ambulance Dispatched' ? 'selected' : ''}>Ambulance Dispatched</option>
                                                        <option value="En Route" ${rep.status == 'En Route' ? 'selected' : ''}>En Route</option>
                                                        <option value="Resolved" ${rep.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                                                    </select>
                                                    <button type="submit" class="btn btn-secondary btn-sm" style="padding:6px 10px;">
                                                        Set
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p style="color:#94a3b8; text-align:center; padding:30px;">
                            No active incident reports in trauma queue right now.
                        </p>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
