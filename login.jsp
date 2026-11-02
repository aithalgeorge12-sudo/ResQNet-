<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="User Login — ResQNet" />
<!DOCTYPE html>
<html lang="en">
<jsp:include page="/common/header.jsp" />
<body>
    <jsp:include page="/common/navbar.jsp" />

    <main class="main-container">
        <div class="form-shell">
            <div class="form-card compact">
                <div class="form-header" style="text-align:center;">
                    <div style="font-size:36px; margin-bottom:8px;">🔒</div>
                    <h2>ResQNet Citizen Login</h2>
                    <p style="color:#64748b; font-size:0.9rem; margin-top:4px;">
                        Access your emergency dashboard, medical records, and SOS reporting history.
                    </p>
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

                <c:if test="${not empty infoMessage}">
                    <div class="alert alert-warning">
                        <span>ℹ️ ${infoMessage}</span>
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="POST">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="your.email@example.com" value="${email}" required autofocus>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block" style="padding:14px; margin-top:8px;">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" y1="12" x2="3" y2="12"/></svg>
                        Log In to Dashboard
                    </button>

                    <div style="margin-top:24px; padding-top:16px; border-top:1px solid #e2e8f0; text-align:center; font-size:0.9rem; color:#64748b;">
                        <p>Don't have an account yet? <a href="${pageContext.request.contextPath}/register" style="color:#dc2626; font-weight:700;">Register here</a></p>
                        <p style="margin-top:10px;">Are you hospital emergency personnel? <a href="${pageContext.request.contextPath}/hospital-portal" style="color:#0284c7; font-weight:600;">Open Hospital Intake Portal &rarr;</a></p>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
