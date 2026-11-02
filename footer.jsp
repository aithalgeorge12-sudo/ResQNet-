<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="resq-footer">
    <div class="footer-container">
        <div class="footer-col">
            <h4>ResQNet</h4>
            <p style="color:#94a3b8; font-size:0.9rem; margin-bottom:12px;">
                Smart Emergency Response &amp; Assistance System. Fast, synchronized crisis management connecting citizens, emergency contacts, and regional hospitals.
            </p>
            <p style="color:#ef4444; font-size:0.85rem; font-weight:600;">
                ⚠️ In immediate life-threatening situations, dial 112 / 108 immediately.
            </p>
        </div>

        <div class="footer-col">
            <h4>Quick Emergency Modules</h4>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/emergency/medical">Medical Emergency &amp; First Aid</a></li>
                <li><a href="${pageContext.request.contextPath}/emergency/fire">Fire &amp; Rescue Alerts</a></li>
                <li><a href="${pageContext.request.contextPath}/emergency/accident">Road &amp; Vehicle Accidents</a></li>
                <li><a href="${pageContext.request.contextPath}/emergency/crime">Crime &amp; Personal Safety</a></li>
                <li><a href="${pageContext.request.contextPath}/emergency/disaster">Natural Disaster Relief</a></li>
                <li><a href="${pageContext.request.contextPath}/emergency/other">Other Emergencies</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Official Emergency Helplines</h4>
            <ul class="footer-links">
                <li><a href="tel:112" data-name="National Emergency">National Emergency: <strong>112</strong></a></li>
                <li><a href="tel:108" data-name="Ambulance Service">Ambulance &amp; Medical: <strong>108</strong></a></li>
                <li><a href="tel:101" data-name="Fire Control">Fire &amp; Rescue: <strong>101</strong></a></li>
                <li><a href="tel:100" data-name="Police Control">Police Emergency: <strong>100</strong></a></li>
                <li><a href="tel:1078" data-name="Disaster Management">Disaster Management: <strong>1078</strong></a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h4>Account &amp; Hospital Portal</h4>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/login">User Login</a></li>
                <li><a href="${pageContext.request.contextPath}/register">Create ResQNet Account</a></li>
                <li><a href="${pageContext.request.contextPath}/profile">My Medical Details</a></li>
                <li><a href="${pageContext.request.contextPath}/hospital-portal">Hospital Staff Intake Portal</a></li>
            </ul>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; <%= java.time.Year.now().getValue() %> ResQNet — Smart Emergency Response &amp; Assistance System. All rights reserved. Designed for prompt citizen safety.</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/js/resqnet.js"></script>
