<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="resq-navbar">
    <div class="nav-container">
        <!-- Brand Title & Logo -->
        <a href="${pageContext.request.contextPath}/" class="brand-link">
            <div class="brand-logo-icon">
                <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 2v20M2 12h20"/>
                </svg>
            </div>
            <div class="brand-text-block">
                <span class="brand-title">ResQ<span>Net</span></span>
                <span class="brand-subtitle">Smart Emergency System</span>
            </div>
        </a>

        <!-- Navigation Links -->
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>

            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <li><a href="${pageContext.request.contextPath}/dashboard" class="nav-link">Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/profile" class="nav-link">My Details</a></li>
                    <li><a href="${pageContext.request.contextPath}/my-reports" class="nav-link">My Reports</a></li>
                    <li><a href="${pageContext.request.contextPath}/emergency-contacts" class="nav-link">Contacts &amp; Hospitals</a></li>
                    <li><a href="${pageContext.request.contextPath}/hospital-portal" class="nav-link">Hospital Portal</a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout" class="nav-link" style="color:#f87171;">
                            Logout (${sessionScope.userName})
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/emergency/medical" class="nav-link">First Aid</a></li>
                    <li><a href="${pageContext.request.contextPath}/emergency/accident" class="nav-link">Report Incident</a></li>
                    <li><a href="${pageContext.request.contextPath}/hospital-portal" class="nav-link">Hospital Portal</a></li>
                    <li><a href="${pageContext.request.contextPath}/login" class="nav-link">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-sm">Register Free</a></li>
                </c:otherwise>
            </c:choose>

            <li>
                <a href="tel:112" class="nav-btn-emergency" data-name="National Emergency Helpline">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                    </svg>
                    SOS 112
                </a>
            </li>
        </ul>
    </div>
</nav>
