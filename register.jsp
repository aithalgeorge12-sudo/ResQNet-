<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Register Account — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="form-shell">
            <div class="form-card">
                <div class="form-header">
                    <h2>Create Your ResQNet Emergency Profile</h2>
                    <p style="color:#64748b; font-size:0.95rem; margin-top:6px;">
                        Registering once stores your medical conditions and primary contacts securely in MySQL, enabling instant 1-click notification when an emergency strikes.
                    </p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">
                        <span>⚠️ ${errorMessage}</span>
                    </div>
                </c:if>

                <form id="registrationForm" action="${pageContext.request.contextPath}/register" method="POST">

                    <!-- SECTION 1: Personal & Account Credentials -->
                    <h3 class="form-section-title">
                        <span class="badge-num">1</span> Personal &amp; Account Information
                    </h3>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="fullName">Full Name <span class="req">*</span></label>
                            <input type="text" id="fullName" name="fullName" class="form-control" placeholder="e.g. John Doe" value="${user.fullName}" required>
                        </div>
                        <div class="form-group">
                            <label for="dob">Date of Birth <span class="req">*</span></label>
                            <input type="date" id="dob" name="dob" class="form-control" value="${dobStr}" required>
                        </div>
                    </div>

                    <div class="form-grid-3">
                        <div class="form-group">
                            <label for="gender">Gender <span class="req">*</span></label>
                            <select id="gender" name="gender" class="form-control" required>
                                <option value="">-- Select Gender --</option>
                                <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                                <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number <span class="req">*</span></label>
                            <input type="tel" id="phone" name="phone" class="form-control" placeholder="e.g. +91 9876543210" value="${user.phone}" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address <span class="req">*</span></label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="john@example.com" value="${user.email}" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address">Residential Address <span class="req">*</span></label>
                        <input type="text" id="address" name="address" class="form-control" placeholder="Street, Apt, City, Pincode" value="${user.address}" required>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="password">Account Password <span class="req">*</span></label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Minimum 6 characters" minlength="6" required>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password <span class="req">*</span></label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Repeat your password" minlength="6" required>
                        </div>
                    </div>

                    <!-- SECTION 2: Medical Details & Health Conditions -->
                    <h3 class="form-section-title">
                        <span class="badge-num">2</span> Vital Medical Profile (Life-Saving Details)
                    </h3>
                    <p style="color:#64748b; font-size:0.85rem; margin-bottom:14px;">
                        This vital data will be shared with the attending ambulance trauma unit during a reported emergency.
                    </p>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="bloodGroup">Blood Group <span class="req">*</span></label>
                            <select id="bloodGroup" name="bloodGroup" class="form-control" required>
                                <option value="">-- Select Blood Group --</option>
                                <option value="A+" ${medical.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                                <option value="A-" ${medical.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                                <option value="B+" ${medical.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                                <option value="B-" ${medical.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                                <option value="AB+" ${medical.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                                <option value="AB-" ${medical.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                                <option value="O+" ${medical.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                                <option value="O-" ${medical.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="allergies">Allergies (Medicines, Foods, Latex)</label>
                            <input type="text" id="allergies" name="allergies" class="form-control" placeholder="e.g. Penicillin, Peanuts, Sulfa (or 'None')" value="${medical.allergies}">
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="diseases">Existing Diseases</label>
                            <input type="text" id="diseases" name="diseases" class="form-control" placeholder="e.g. Diabetes Type 2, Hypertension, Asthma" value="${medical.diseases}">
                        </div>
                        <div class="form-group">
                            <label for="medicalConditions">Medical Conditions / Implants</label>
                            <input type="text" id="medicalConditions" name="medicalConditions" class="form-control" placeholder="e.g. Pacemaker, Epilepsy, Heart Stent" value="${medical.medicalConditions}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="currentMedications">Current Daily Medications</label>
                        <input type="text" id="currentMedications" name="currentMedications" class="form-control" placeholder="e.g. Metformin 500mg, Aspirin 75mg daily" value="${medical.currentMedications}">
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="doctorName">Consulting Doctor's Name</label>
                            <input type="text" id="doctorName" name="doctorName" class="form-control" placeholder="Dr. Jane Smith" value="${medical.consultingDoctorName}">
                        </div>
                        <div class="form-group">
                            <label for="doctorPhone">Doctor's Phone Number</label>
                            <input type="tel" id="doctorPhone" name="doctorPhone" class="form-control" placeholder="e.g. +91 9123456780" value="${medical.consultingDoctorPhone}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="otherMedicalInfo">Other Crucial Health Information</label>
                        <textarea id="otherMedicalInfo" name="otherMedicalInfo" class="form-control" placeholder="Any special instructions for EMTs or ER doctors">${medical.otherMedicalInfo}</textarea>
                    </div>

                    <!-- SECTION 3: Emergency Contacts -->
                    <h3 class="form-section-title">
                        <span class="badge-num">3</span> Emergency Contacts
                    </h3>

                    <!-- Primary Emergency Contact -->
                    <div style="background:#f8fafc; border:1px solid #e2e8f0; border-radius:8px; padding:16px; margin-bottom:18px;">
                        <h4 style="color:#0f172a; font-size:0.95rem; margin-bottom:10px;">
                            Primary Emergency Contact <span style="color:#dc2626;">(Will be alerted first)</span>
                        </h4>
                        <div class="form-grid-3">
                            <div class="form-group">
                                <label for="contactName">Contact Name <span class="req">*</span></label>
                                <input type="text" id="contactName" name="contactName" class="form-control" placeholder="e.g. Sarah Doe" value="${primaryContact.contactName}" required>
                            </div>
                            <div class="form-group">
                                <label for="relationship">Relationship <span class="req">*</span></label>
                                <input type="text" id="relationship" name="relationship" class="form-control" placeholder="e.g. Spouse / Parent / Sibling" value="${primaryContact.relationship}" required>
                            </div>
                            <div class="form-group">
                                <label for="contactPhone">Phone Number <span class="req">*</span></label>
                                <input type="tel" id="contactPhone" name="contactPhone" class="form-control" placeholder="e.g. +91 9876501234" value="${primaryContact.phone}" required>
                            </div>
                        </div>
                    </div>

                    <!-- Secondary Emergency Contact (Optional) -->
                    <div style="background:#f8fafc; border:1px solid #e2e8f0; border-radius:8px; padding:16px; margin-bottom:24px;">
                        <h4 style="color:#0f172a; font-size:0.95rem; margin-bottom:10px;">
                            Additional Emergency Contact <span style="color:#64748b; font-weight:normal;">(Optional backup)</span>
                        </h4>
                        <div class="form-grid-3">
                            <div class="form-group">
                                <label for="contact2Name">Backup Contact Name</label>
                                <input type="text" id="contact2Name" name="contact2Name" class="form-control" placeholder="e.g. Robert Doe" value="${secondaryContact.contactName}">
                            </div>
                            <div class="form-group">
                                <label for="contact2Relationship">Relationship</label>
                                <input type="text" id="contact2Relationship" name="contact2Relationship" class="form-control" placeholder="e.g. Friend / Colleague" value="${secondaryContact.relationship}">
                            </div>
                            <div class="form-group">
                                <label for="contact2Phone">Phone Number</label>
                                <input type="tel" id="contact2Phone" name="contact2Phone" class="form-control" placeholder="e.g. +91 9876505678" value="${secondaryContact.phone}">
                            </div>
                        </div>
                    </div>

                    <!-- SUBMIT BUTTON -->
                    <button type="submit" class="btn btn-primary btn-block" style="padding:15px; font-size:1.1rem;">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/><polyline points="17 21 17 13 7 13 7 21"/><polyline points="7 3 7 8 15 8"/></svg>
                        Complete Registration &amp; Secure My Profile
                    </button>

                    <p style="text-align:center; margin-top:18px; color:#64748b; font-size:0.9rem;">
                        Already registered? <a href="${pageContext.request.contextPath}/login" style="font-weight:700; color:#102a43;">Log in to your dashboard here</a>.
                    </p>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
