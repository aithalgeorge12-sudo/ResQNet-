<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="My Emergency Reports & Live Tracking — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Incident Audit &amp; Real-time Status</p>
            <h2 class="section-title">My Emergency Reports</h2>
            <p class="section-subtitle">Track the live dispatch progress, assigned hospital intake status, and review automated notification records.</p>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <span>✅ ${successMessage}</span>
            </div>
        </c:if>

        <!-- SINGLE DETAILED REPORT CARD (IF SELECTED OR JUST SUBMITTED) -->
        <c:if test="${not empty report}">
            <div style="background:var(--navy-card); border:2px solid var(--navy-border); border-radius:var(--radius-lg); padding:26px; margin-bottom:35px; box-shadow:var(--shadow-lg);">
                <div style="display:flex; justify-content:space-between; align-items:flex-start; flex-wrap:wrap; gap:12px; margin-bottom:16px;">
                    <div>
                        <span class="status-badge status-${report.status == 'Resolved' ? 'resolved' : 'dispatched'}" style="font-size:0.9rem; padding:6px 14px;">
                            Status: ${report.status}
                        </span>
                        <h3 style="color:#ffffff; font-size:1.6rem; margin-top:8px;">
                            ${report.category} Incident — <span style="color:#f87171;">${report.subCategory}</span>
                        </h3>
                        <p style="color:#94a3b8; font-size:0.9rem;">Tracking ID: <strong style="color:#38bdf8;">${report.reportTrackingId}</strong> | Reported at: ${report.createdAt}</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary btn-sm">
                        &larr; Back to Dashboard
                    </a>
                </div>

                <div class="form-grid-2" style="margin-top:20px;">
                    <div style="background:rgba(255,255,255,0.03); padding:16px; border-radius:8px;">
                        <h4 style="color:#38bdf8; margin-bottom:8px;">Location &amp; GPS Coordinates</h4>
                        <p style="font-size:0.95rem;"><strong>Address:</strong> ${report.incidentLocation}</p>
                        <c:if test="${not empty report.latitude and not empty report.longitude}">
                            <p style="font-size:0.9rem; color:#a7f3d0; margin-top:4px;">
                                📍 Latitude: ${report.latitude}, Longitude: ${report.longitude}
                            </p>
                        </c:if>
                        <p style="font-size:0.95rem; margin-top:8px;"><strong>Severity:</strong> <span style="color:#f87171; font-weight:700;">${report.severity}</span></p>
                        <c:if test="${not empty report.injuredCondition and report.injuredCondition != 'Unknown'}">
                            <p style="font-size:0.95rem;"><strong>Patient Condition:</strong> ${report.injuredCondition}</p>
                        </c:if>
                    </div>

                    <div style="background:rgba(255,255,255,0.03); padding:16px; border-radius:8px;">
                        <h4 style="color:#34d399; margin-bottom:8px;">Incident Description</h4>
                        <p style="font-size:0.95rem; color:#e2e8f0; line-height:1.6;">${report.description}</p>
                        <c:if test="${not empty report.assignedHospital}">
                            <p style="font-size:0.95rem; margin-top:12px;">
                                🏥 <strong>Assigned Hospital:</strong> ${report.assignedHospital.hospitalName}
                            </p>
                        </c:if>
                    </div>
                </div>

                <!-- PHOTO ATTACHMENTS (IF ANY) -->
                <c:if test="${not empty report.attachments}">
                    <div style="margin-top:20px; padding-top:16px; border-top:1px solid rgba(255,255,255,0.08);">
                        <h4 style="color:#ffffff; margin-bottom:12px;">Attached Incident Photos:</h4>
                        <div style="display:flex; gap:16px; flex-wrap:wrap;">
                            <c:forEach var="att" items="${report.attachments}">
                                <div style="background:#0f172a; border:1px solid #334e68; border-radius:8px; padding:10px; text-align:center;">
                                    <a href="${pageContext.request.contextPath}/${att.filePath}" target="_blank">
                                        <img src="${pageContext.request.contextPath}/${att.filePath}" alt="${att.fileName}" style="max-height:160px; max-width:240px; border-radius:4px; object-fit:cover;">
                                    </a>
                                    <p style="font-size:0.8rem; color:#94a3b8; margin-top:6px;">${att.fileName}</p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>

                <!-- NOTIFICATION AUDIT TRAIL LOGS -->
                <div style="margin-top:24px; padding-top:16px; border-top:1px solid rgba(255,255,255,0.08);">
                    <h4 style="color:#ffffff; margin-bottom:12px;">Notification Delivery Audit Trail:</h4>
                    <c:choose>
                        <c:when test="${not empty report.notifications}">
                            <div class="table-responsive">
                                <table class="resq-table">
                                    <thead>
                                        <tr>
                                            <th>Recipient</th>
                                            <th>Contact / Helpline</th>
                                            <th>Message Log</th>
                                            <th>System Delivery Status</th>
                                            <th>Timestamp</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="n" items="${report.notifications}">
                                            <tr>
                                                <td><strong>${n.recipientType}</strong><br><span style="font-size:0.8rem; color:#94a3b8;">${n.recipientName}</span></td>
                                                <td>${n.recipientPhone}</td>
                                                <td style="font-size:0.85rem; max-width:320px;">${n.messageContent}</td>
                                                <td>
                                                    <span class="status-badge status-dispatched">${n.deliveryStatus}</span>
                                                    <div style="font-size:0.75rem; color:#94a3b8; margin-top:2px;">${n.gatewayNote}</div>
                                                </td>
                                                <td>${n.sentAt}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p style="color:#94a3b8; font-size:0.9rem;">Notification logs are preparing...</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:if>

        <!-- ALL USER REPORTS TABLE -->
        <div style="background:var(--navy-card); border:1px solid var(--navy-border); border-radius:var(--radius-lg); padding:24px;">
            <h3 style="color:#ffffff; margin-bottom:16px;">All My Incident Reports</h3>
            <c:choose>
                <c:when test="${not empty userReports}">
                    <div class="table-responsive">
                        <table class="resq-table">
                            <thead>
                                <tr>
                                    <th>Tracking Ref</th>
                                    <th>Category</th>
                                    <th>Sub-Type</th>
                                    <th>Location</th>
                                    <th>Severity</th>
                                    <th>Live Status</th>
                                    <th>Reported Time</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="r" items="${userReports}">
                                    <tr>
                                        <td><strong style="color:#38bdf8;">${r.reportTrackingId}</strong></td>
                                        <td>${r.category}</td>
                                        <td>${r.subCategory}</td>
                                        <td>${r.incidentLocation}</td>
                                        <td><span style="color:#ef4444; font-weight:700;">${r.severity}</span></td>
                                        <td>
                                            <span class="status-badge status-${r.status == 'Resolved' ? 'resolved' : 'dispatched'}">
                                                ${r.status}
                                            </span>
                                        </td>
                                        <td>${r.createdAt}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/my-reports?id=${r.reportId}" class="btn btn-secondary btn-sm">
                                                View Audit
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <p style="color:#94a3b8; padding:20px 0; text-align:center;">
                        You have not submitted any emergency reports yet.
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
