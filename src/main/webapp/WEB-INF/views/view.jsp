<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Projects – Project Submission Portal</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 40px 16px;
        }
        .container {
            background: #fff;
            width: 100%;
            max-width: 900px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,.1);
            overflow: hidden;
        }
        .container header {
            background: #2c3e50;
            color: #fff;
            padding: 20px 28px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container header h1 { font-size: 1.4rem; }
        .body { padding: 28px; }
        .empty {
            text-align: center;
            padding: 48px;
            color: #6b7280;
            font-size: 1rem;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: .9rem;
        }
        thead tr { background: #f1f5f9; }
        th, td {
            padding: 12px 14px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }
        th { font-weight: 600; color: #374151; }
        tbody tr:hover { background: #f8fafc; }
        .badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 12px;
            font-size: .78rem;
            font-weight: 600;
        }
        .badge-submitted  { background: #dbeafe; color: #1e40af; }
        .badge-approved   { background: #d1fae5; color: #065f46; }
        .badge-rejected   { background: #fee2e2; color: #991b1b; }
        .badge-review     { background: #fef3c7; color: #92400e; }
        .badge-default    { background: #e5e7eb; color: #374151; }
        .back-link {
            display: inline-block;
            margin-top: 16px;
            font-size: .875rem;
            color: #2c3e50;
            text-decoration: none;
        }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>&#128202; All Projects</h1>
            <span style="font-size:.9rem; opacity:.8;">
                Total: <strong>${projects.size()}</strong>
            </span>
        </header>
        <div class="body">
            <c:choose>
                <c:when test="${empty projects}">
                    <div class="empty">
                        <p>&#128193; No projects have been submitted yet.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Student Name</th>
                                <th>Project Title</th>
                                <th>Description</th>
                                <th>Submission Date</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${projects}">
                                <tr>
                                    <td>${p.projectId}</td>
                                    <td><c:out value="${p.studentName}"/></td>
                                    <td><c:out value="${p.projectTitle}"/></td>
                                    <td><c:out value="${p.description}"/></td>
                                    <td>${p.submissionDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p.status == 'Submitted'}">
                                                <span class="badge badge-submitted">${p.status}</span>
                                            </c:when>
                                            <c:when test="${p.status == 'Approved'}">
                                                <span class="badge badge-approved">${p.status}</span>
                                            </c:when>
                                            <c:when test="${p.status == 'Rejected'}">
                                                <span class="badge badge-rejected">${p.status}</span>
                                            </c:when>
                                            <c:when test="${p.status == 'Under Review'}">
                                                <span class="badge badge-review">${p.status}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-default">${p.status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>

            <a href="${pageContext.request.contextPath}/" class="back-link">&#8592; Back to Home</a>
        </div>
    </div>
</body>
</html>
