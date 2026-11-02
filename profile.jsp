<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="My Details & Medical Profile — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="form-shell">
            <div class="form-card">
                <div class="form-header" style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:12px;">
                    <div>
                        <h2>My Profile &amp; Medical Details</h2>
                        <p style="color:#64748b; font-size:0.95rem; margin-top:4px;">
                            Review and update your personal identity, medical conditions, and emergency contacts.
                        </p>
                    </div>
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary btn-sm">
                        &larr; Back to Dashboard
                    </a>
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

                <form action="${pageContext.request.contextPath}/profile" method="POST">
                    <!-- SECTION 1: Personal Details -->
                    <h3 class="form-section-title">
                        <span class="badge-num">1</span> Account &amp; Personal Info
                    </h3>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="fullName">Full Name <span class="req">*</span></label>
                            <input type="text" id="fullName" name="fullName" class="form-control" value="${user.fullName}" required>
                        </div>
                        <div class="form-group">
                            <label for="dob">Date of Birth <span class="req">*</span></label>
                            <input type="date" id="dob" name="dob" class="form-control" value="${user.dob}" required>
                        </div>
                    </div>

                    <div class="form-grid-3">
                        <div class="form-group">
                            <label for="gender">Gender <span class="req">*</span></label>
                            <select id="gender" name="gender" class="form-control" required>
                                <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                                <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number <span class="req">*</span></label>
                            <input type="tel" id="phone" name="phone" class="form-control" value="${user.phone}" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address (Login ID)</label>
                            <input type="email" id="email" class="form-control" value="${user.email}" disabled style="background:#f1f5f9; cursor:not-allowed;">
                            <small class="form-hint">Email is your unique identifier and cannot be changed.</small>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address">Residential Address <span class="req">*</span></label>
                        <input type="text" id="address" name="address" class="form-control" value="${user.address}" required>
                    </div>

                    <!-- SECTION 2: Medical Details -->
                    <h3 class="form-section-title">
                        <span class="badge-num">2</span> Medical Profile &amp; Clinical Conditions
                    </h3>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="bloodGroup">Blood Group <span class="req">*</span></label>
                            <select id="bloodGroup" name="bloodGroup" class="form-control" required>
                                <option value="A+" ${user.medicalDetails.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                                <option value="A-" ${user.medicalDetails.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                                <option value="B+" ${user.medicalDetails.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                                <option value="B-" ${user.medicalDetails.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                                <option value="AB+" ${user.medicalDetails.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                                <option value="AB-" ${user.medicalDetails.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                                <option value="O+" ${user.medicalDetails.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                                <option value="O-" ${user.medicalDetails.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="allergies">Known Allergies (Food, Meds, Latex)</label>
                            <input type="text" id="allergies" name="allergies" class="form-control" value="${user.medicalDetails.allergies}">
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="diseases">Existing Chronic Diseases</label>
                            <input type="text" id="diseases" name="diseases" class="form-control" value="${user.medicalDetails.diseases}">
                        </div>
                        <div class="form-group">
                            <label for="medicalConditions">Medical Conditions / Implants</label>
                            <input type="text" id="medicalConditions" name="medicalConditions" class="form-control" value="${user.medicalDetails.medicalConditions}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="currentMedications">Current Medications</label>
                        <input type="text" id="currentMedications" name="currentMedications" class="form-control" value="${user.medicalDetails.currentMedications}">
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="doctorName">Consulting Doctor's Name</label>
                            <input type="text" id="doctorName" name="doctorName" class="form-control" value="${user.medicalDetails.consultingDoctorName}">
                        </div>
                        <div class="form-group">
                            <label for="doctorPhone">Doctor's Phone Number</label>
                            <input type="tel" id="doctorPhone" name="doctorPhone" class="form-control" value="${user.medicalDetails.consultingDoctorPhone}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="otherMedicalInfo">Other Emergency Medical Notes</label>
                        <textarea id="otherMedicalInfo" name="otherMedicalInfo" class="form-control">${user.medicalDetails.otherMedicalInfo}</textarea>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block" style="padding:14px; margin-top:10px;">
                        💾 Save Updated Profile &amp; Medical Details
                    </button>
                </form>

                <!-- SECTION 3: Current Registered Contacts Display -->
                <div style="margin-top:40px; padding-top:20px; border-top:2px solid #e2e8f0;">
                    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:14px;">
                        <h3 style="color:#0f172a;">Registered Emergency Contacts</h3>
                        <a href="${pageContext.request.contextPath}/emergency-contacts" class="btn btn-secondary btn-sm">
                            Manage Contacts &rarr;
                        </a>
                    </div>

                    <c:choose>
                        <c:when test="${not empty contacts}">
                            <div class="table-responsive">
                                <table class="resq-table">
                                    <thead>
                                        <tr>
                                            <th>Type</th>
                                            <th>Name</th>
                                            <th>Relationship</th>
                                            <th>Phone</th>
                                            <th>Quick Call</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="c" items="${contacts}">
                                            <tr>
                                                <td>
                                                    <c:if test="${c.primary}">
                                                        <span style="color:#ef4444; font-weight:800; font-size:0.8rem;">PRIMARY</span>
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
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p style="color:#64748b;">No emergency contacts found. <a href="${pageContext.request.contextPath}/emergency-contacts" style="color:#dc2626;">Add one now</a>.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
