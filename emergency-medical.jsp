<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Medical Emergency & First Aid — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <!-- CRITICAL MEDICAL DISCLAIMER -->
        <div class="medical-disclaimer">
            <strong>⚠️ CRITICAL MEDICAL DISCLAIMER:</strong>
            ResQNet does not replace professional medical diagnosis, emergency medical technicians (EMTs), or certified hospital treatment. If you or someone nearby is experiencing a life-threatening crisis, dial <strong>108 / 112</strong> immediately.
        </div>

        <div class="section-header" style="text-align:left;">
            <p class="section-tag">Emergency Module 1</p>
            <h2 class="section-title">Medical Emergency &amp; Immediate First-Aid</h2>
            <p class="section-subtitle">Select the medical condition below for validated, step-by-step first-aid protocols, emergency calling, and dispatch reporting.</p>
        </div>

        <!-- FIRST AID INTERACTIVE TABS -->
        <div class="first-aid-container">
            <h3 style="color:#ffffff; margin-bottom:14px; font-size:1.2rem;">Select Specific Medical Situation:</h3>
            <div class="aid-nav-tabs">
                <button type="button" class="aid-tab-btn active" data-target="tab-heart-attack" data-title="Heart Attack Symptoms">
                    ❤️ Heart Attack
                </button>
                <button type="button" class="aid-tab-btn" data-target="tab-snake-bite" data-title="Snake Bite">
                    🐍 Snake Bite
                </button>
                <button type="button" class="aid-tab-btn" data-target="tab-unconscious" data-title="Unconscious Person">
                    😵 Unconscious Person
                </button>
                <button type="button" class="aid-tab-btn" data-target="tab-breathing" data-title="Breathing Difficulties">
                    🫁 Breathing Difficulties
                </button>
                <button type="button" class="aid-tab-btn" data-target="tab-other-med" data-title="Other Medical Emergencies">
                    ➕ Other Medical Crisis
                </button>
            </div>

            <!-- TAB 1: Heart Attack -->
            <div id="tab-heart-attack" class="aid-tab-content active">
                <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:10px; margin-bottom:12px;">
                    <h4 style="color:#ef4444; font-size:1.15rem;">Heart Attack Symptoms &amp; First Aid Protocol</h4>
                    <a href="tel:108" class="btn btn-primary btn-sm" data-name="Ambulance Service">📞 Call Ambulance 108</a>
                </div>
                <p style="color:#cbd5e1; font-size:0.95rem;">
                    <strong>Common Symptoms:</strong> Crushing pressure or tightness in center of chest, pain radiating to left arm, neck, jaw or back, shortness of breath, cold sweat, nausea.
                </p>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. Call Ambulance Immediately:</strong> Dial 108 or 112 before doing anything else. Every second matters.</li>
                    <li class="first-aid-step"><strong>2. Rest in W-Position:</strong> Have the patient sit on the floor, leaning back against a wall with knees bent to ease cardiac workload.</li>
                    <li class="first-aid-step"><strong>3. Aspirin Administration:</strong> If the patient is not allergic and conscious, give one adult chewable Aspirin (300mg) or have them chew it slowly.</li>
                    <li class="first-aid-step warning-step"><strong>4. Loosen Clothing:</strong> Unbutton collar, belt, and restrictive ties to promote free breathing.</li>
                    <li class="first-aid-step do-not-step"><strong>DO NOT:</strong> Allow the patient to walk around, exert themselves, or drive themselves to hospital.</li>
                </ul>
            </div>

            <!-- TAB 2: Snake Bite -->
            <div id="tab-snake-bite" class="aid-tab-content">
                <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:10px; margin-bottom:12px;">
                    <h4 style="color:#f59e0b; font-size:1.15rem;">Snake Bite First Aid Protocol</h4>
                    <a href="tel:108" class="btn btn-primary btn-sm" data-name="Ambulance Service">📞 Call Ambulance 108</a>
                </div>
                <p style="color:#cbd5e1; font-size:0.95rem;">
                    <strong>Immediate Action:</strong> Keep the victim calm and still. Movement accelerates venom distribution through the lymphatic system.
                </p>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. Immobilize the Limb:</strong> Keep the bitten limb completely still, positioned at or slightly below heart level. Use a splint if available.</li>
                    <li class="first-aid-step"><strong>2. Remove Constrictive Items:</strong> Remove rings, watches, bracelets, and tight clothing before swelling begins.</li>
                    <li class="first-aid-step"><strong>3. Note Snake Appearance:</strong> Safely observe color, head shape, and size (or take a photo from safe distance) to assist antivenom selection.</li>
                    <li class="first-aid-step do-not-step"><strong>DO NOT CUT OR SUCK:</strong> Never cut the bite wound, attempt suction, apply a tourniquet, or apply ice/chemicals.</li>
                </ul>
            </div>

            <!-- TAB 3: Unconscious Person -->
            <div id="tab-unconscious" class="aid-tab-content">
                <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:10px; margin-bottom:12px;">
                    <h4 style="color:#38bdf8; font-size:1.15rem;">Unconscious / Unresponsive Person Protocol</h4>
                    <a href="tel:108" class="btn btn-primary btn-sm" data-name="Ambulance Service">📞 Call Ambulance 108</a>
                </div>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. Check Responsiveness:</strong> Tap the person's shoulders firmly and shout loudly: "Are you okay?".</li>
                    <li class="first-aid-step"><strong>2. Check Airway &amp; Breathing:</strong> Tilt head back slightly, lift chin, look for chest rise for 10 seconds.</li>
                    <li class="first-aid-step warning-step"><strong>3. If Breathing Normally:</strong> Place the person into the <em>Recovery Position</em> (on their side with airway open) to prevent choking on saliva or vomit.</li>
                    <li class="first-aid-step warning-step"><strong>4. If NOT Breathing:</strong> Immediately begin CPR: 30 hard chest compressions (100-120 bpm) followed by 2 rescue breaths. Use an AED if nearby.</li>
                    <li class="first-aid-step do-not-step"><strong>DO NOT:</strong> Give food, water, or try to sit an unconscious person upright.</li>
                </ul>
            </div>

            <!-- TAB 4: Breathing Difficulties -->
            <div id="tab-breathing" class="aid-tab-content">
                <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:10px; margin-bottom:12px;">
                    <h4 style="color:#34d399; font-size:1.15rem;">Severe Breathing Difficulties Protocol</h4>
                    <a href="tel:108" class="btn btn-primary btn-sm" data-name="Ambulance Service">📞 Call Ambulance 108</a>
                </div>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>1. Position Comfortably:</strong> Keep the person sitting upright, leaning slightly forward. Do not let them lie flat.</li>
                    <li class="first-aid-step"><strong>2. Assist with Inhaler:</strong> If they have prescribed asthma medication (e.g. Salbutamol / Albuterol), help them take 4 puffs with a spacer.</li>
                    <li class="first-aid-step"><strong>3. Fresh Air:</strong> Open windows or move away from smoke, dust, chemicals, or crowds.</li>
                    <li class="first-aid-step warning-step"><strong>4. Look for Blue Lips (Cyanosis):</strong> Blue discoloration of lips or fingernails indicates oxygen crisis; call emergency services immediately.</li>
                </ul>
            </div>

            <!-- TAB 5: Other Medical Crisis -->
            <div id="tab-other-med" class="aid-tab-content">
                <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:10px; margin-bottom:12px;">
                    <h4 style="color:#c084fc; font-size:1.15rem;">Other Acute Medical Emergencies</h4>
                    <a href="tel:108" class="btn btn-primary btn-sm" data-name="Ambulance Service">📞 Call Ambulance 108</a>
                </div>
                <ul class="first-aid-steps">
                    <li class="first-aid-step"><strong>Severe Bleeding:</strong> Apply direct, firm pressure with a clean cloth. Elevate the wound above the heart if possible.</li>
                    <li class="first-aid-step"><strong>Seizures / Epilepsy:</strong> Clear sharp objects. Protect their head with a soft jacket. Do NOT place anything inside their mouth.</li>
                    <li class="first-aid-step"><strong>Severe Allergic Reaction (Anaphylaxis):</strong> Look for swelling of tongue/throat or hives. Use EpiPen auto-injector in outer thigh if available.</li>
                </ul>
            </div>
        </div>

        <!-- MEDICAL EMERGENCY REPORT SUBMISSION FORM -->
        <div class="form-shell">
            <div class="form-card">
                <div class="form-header">
                    <h3>Submit Medical Emergency Incident Report</h3>
                    <p style="color:#64748b; font-size:0.9rem;">
                        This form transmits your incident details, GPS coordinates, and patient condition to the assigned trauma hospital and logs notification to your registered emergency contact.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/emergency/medical" method="POST">
                    <input type="hidden" id="selectedSubCategoryInput" name="subCategory" value="Heart Attack Symptoms">

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label for="severity">Severity Level <span class="req">*</span></label>
                            <select id="severity" name="severity" class="form-control" required>
                                <option value="Critical" selected>🔴 Critical (Immediate Life Hazard)</option>
                                <option value="High">🟠 High (Urgent Attention Required)</option>
                                <option value="Medium">🟡 Medium (Serious Condition)</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="patientCondition">Patient Condition <span class="req">*</span></label>
                            <select id="patientCondition" name="patientCondition" class="form-control" required>
                                <option value="Conscious &amp; Breathing">Conscious &amp; Breathing</option>
                                <option value="Unconscious but Breathing">Unconscious but Breathing</option>
                                <option value="Unconscious - NOT Breathing (CPR Needed)">Unconscious - NOT Breathing (CPR Needed)</option>
                                <option value="Severe Bleeding / Trauma">Severe Bleeding / Trauma</option>
                                <option value="Chest Pain / Cardiac Signs">Chest Pain / Cardiac Signs</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Emergency Description &amp; Symptoms <span class="req">*</span></label>
                        <textarea id="description" name="description" class="form-control" placeholder="Describe symptoms, patient age, onset time, and known medical history..." required></textarea>
                    </div>

                    <!-- GEOLOCATION SECTION (EXPLICIT PERMISSION REQUEST) -->
                    <div class="form-group">
                        <label for="locationInput">Incident Location / Address <span class="req">*</span></label>
                        <div style="display:flex; gap:10px; margin-bottom:8px; flex-wrap:wrap;">
                            <input type="text" id="locationInput" name="location" class="form-control" style="flex:1;" placeholder="Enter address, landmark, or click GPS button" required>
                            <button type="button" class="geo-btn btn-fetch-location">
                                📍 Share My GPS Location
                            </button>
                        </div>
                        <input type="hidden" id="latitudeInput" name="latitude">
                        <input type="hidden" id="longitudeInput" name="longitude">
                        <span id="geoStatusBadge" class="geo-status-badge"></span>
                    </div>

                    <div class="form-group">
                        <label for="hospitalId">Assign Nearest Trauma Hospital</label>
                        <select id="hospitalId" name="hospitalId" class="form-control">
                            <c:forEach var="h" items="${hospitals}">
                                <option value="${h.hospitalId}">
                                    ${h.hospitalName} (${h.city}) — Helpline: ${h.emergencyHelpline}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- REPORTING BUTTON -->
                    <button type="submit" class="btn btn-primary btn-block" style="padding:15px; font-size:1.1rem; margin-top:14px;">
                        🚨 Submit Medical Emergency Report &amp; Alert Team
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
