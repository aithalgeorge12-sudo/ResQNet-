<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Emergency Contacts & Hospital Directory — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Safety Contacts Directory</p>
            <h2 class="section-title">Emergency Contacts &amp; Regional Hospitals</h2>
            <p class="section-subtitle">Manage your personal life-safety contacts and access regional authorized emergency hospitals with click-to-call options.</p>
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

        <!-- SECTION 1: PERSONAL EMERGENCY CONTACTS -->
        <div style="background:var(--navy-card); border:1px solid var(--navy-border); border-radius:var(--radius-lg); padding:24px; margin-bottom:35px;">
            <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:12px; margin-bottom:18px;">
                <h3 style="color:#ffffff; font-size:1.3rem;">My Registered Emergency Contacts</h3>
                <span style="font-size:0.85rem; color:#94a3b8;">Primary contact is prioritized during automated alerts</span>
            </div>

            <c:choose>
                <c:when test="${not empty contacts}">
                    <div class="table-responsive">
                        <table class="resq-table">
                            <thead>
                                <tr>
                                    <th>Priority</th>
                                    <th>Contact Name</th>
                                    <th>Relationship</th>
                                    <th>Phone Number</th>
                                    <th>Click-to-Call</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${contacts}">
                                    <tr>
                                        <td>
                                            <c:if test="${c.primary}">
                                                <span style="background:rgba(220,38,38,0.2); color:#ef4444; padding:3px 8px; border-radius:4px; font-weight:800; font-size:0.75rem;">
                                                    PRIMARY
                                                </span>
                                            </c:if>
                                            <c:if test="${not c.primary}">
                                                <span style="color:#94a3b8; font-size:0.8rem;">Secondary</span>
                                            </c:if>
                                        </td>
                                        <td><strong>${c.contactName}</strong></td>
                                        <td>${c.relationship}</td>
                                        <td>${c.phone}</td>
                                        <td>
                                            <a href="tel:${c.phone}" class="call-btn-pill" style="display:inline-flex;" data-name="${c.contactName}">
                                                📞 Call
                                            </a>
                                        </td>
                                        <td>
                                            <form action="${pageContext.request.contextPath}/emergency-contacts" method="POST" style="display:inline;" onsubmit="return confirm('Remove contact ${c.contactName}?');">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="contactId" value="${c.contactId}">
                                                <button type="submit" class="btn btn-outline-red btn-sm" style="padding:4px 8px;">
                                                    Remove
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
                    <p style="color:#94a3b8;">No contacts added yet. Add your trusted emergency contacts below.</p>
                </c:otherwise>
            </c:choose>

            <!-- ADD NEW CONTACT INLINE FORM -->
            <div style="background:rgba(255,255,255,0.03); border:1px dashed #334e68; border-radius:8px; padding:20px; margin-top:24px;">
                <h4 style="color:#ffffff; margin-bottom:12px;">+ Add New Emergency Contact</h4>
                <form action="${pageContext.request.contextPath}/emergency-contacts" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="form-grid-3">
                        <div class="form-group" style="margin-bottom:0;">
                            <label for="contactName" style="color:#e2e8f0;">Full Name <span class="req">*</span></label>
                            <input type="text" id="contactName" name="contactName" class="form-control" placeholder="Contact's Name" required>
                        </div>
                        <div class="form-group" style="margin-bottom:0;">
                            <label for="relationship" style="color:#e2e8f0;">Relationship <span class="req">*</span></label>
                            <input type="text" id="relationship" name="relationship" class="form-control" placeholder="e.g. Parent / Spouse / Neighbor" required>
                        </div>
                        <div class="form-group" style="margin-bottom:0;">
                            <label for="phone" style="color:#e2e8f0;">Phone Number <span class="req">*</span></label>
                            <input type="tel" id="phone" name="phone" class="form-control" placeholder="+91 9876500000" required>
                        </div>
                    </div>
                    <div style="display:flex; justify-content:space-between; align-items:center; margin-top:14px; flex-wrap:wrap; gap:12px;">
                        <label style="display:flex; align-items:center; gap:8px; color:#e2e8f0; font-size:0.9rem; cursor:pointer;">
                            <input type="checkbox" name="isPrimary" value="true">
                            Set as primary emergency contact
                        </label>
                        <button type="submit" class="btn btn-primary btn-sm">
                            Add Contact to Safety Network
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- SECTION 2: REGIONAL HOSPITALS DIRECTORY (SAMPLE DATA LABELED) -->
        <div style="background:var(--navy-card); border:1px solid var(--navy-border); border-radius:var(--radius-lg); padding:24px;">
            <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:12px; margin-bottom:18px;">
                <div>
                    <h3 style="color:#ffffff; font-size:1.3rem;">Regional Emergency Hospitals &amp; Trauma Centers</h3>
                    <p style="color:#94a3b8; font-size:0.85rem;">(Demonstration hospital network — clearly marked sample data)</p>
                </div>
            </div>

            <div class="table-responsive">
                <table class="resq-table">
                    <thead>
                        <tr>
                            <th>Hospital Code</th>
                            <th>Hospital Facility</th>
                            <th>City / Address</th>
                            <th>Emergency 24/7</th>
                            <th>Ambulance Desk</th>
                            <th>Doctor in Charge</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="h" items="${hospitals}">
                            <tr>
                                <td><span style="font-weight:700; color:#38bdf8;">${h.hospitalCode}</span></td>
                                <td>
                                    <strong>${h.hospitalName}</strong>
                                    <c:if test="${h.sampleData}">
                                        <span style="font-size:0.7rem; color:#f59e0b; background:rgba(245,158,11,0.15); padding:2px 6px; border-radius:3px; margin-left:4px;">Sample Data</span>
                                    </c:if>
                                </td>
                                <td>${h.address}, ${h.city}</td>
                                <td>
                                    <a href="tel:${h.emergencyHelpline}" class="call-btn-pill" style="display:inline-flex; background:#0284c7;" data-name="${h.hospitalName}">
                                        📞 ${h.emergencyHelpline}
                                    </a>
                                </td>
                                <td>
                                    <a href="tel:${h.ambulancePhone}" class="call-btn-pill" style="display:inline-flex; background:#10b981;" data-name="${h.hospitalName} Ambulance">
                                        🚑 ${h.ambulancePhone}
                                    </a>
                                </td>
                                <td>${h.doctorInCharge}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
