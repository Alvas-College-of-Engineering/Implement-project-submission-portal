<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Status – Project Submission Portal</title>
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
            max-width: 480px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,.1);
            overflow: hidden;
        }
        .container header {
            background: #2c3e50;
            color: #fff;
            padding: 20px 28px;
        }
        .container header h1 { font-size: 1.4rem; }
        .form-body { padding: 28px; }
        .form-group { margin-bottom: 18px; }
        label {
            display: block;
            font-size: .875rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 6px;
        }
        input[type="number"],
        select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: .95rem;
            color: #111827;
            background: #fff;
            transition: border-color .15s;
        }
        input:focus, select:focus {
            outline: none;
            border-color: #2c3e50;
        }
        .btn {
            display: inline-block;
            padding: 10px 24px;
            background: #2c3e50;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: .95rem;
            cursor: pointer;
            transition: background .15s;
        }
        .btn:hover { background: #1a252f; }
        .alert {
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 18px;
            font-size: .9rem;
        }
        .alert-success { background: #d1fae5; color: #065f46; border: 1px solid #6ee7b7; }
        .alert-error   { background: #fee2e2; color: #991b1b; border: 1px solid #fca5a5; }
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
        <header><h1>&#9999;&#65039; Update Project Status</h1></header>
        <div class="form-body">

            <%-- Success / error messages --%>
            <% if (request.getAttribute("message") != null) { %>
                <div class="alert alert-success"><%= request.getAttribute("message") %></div>
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error"><%= request.getAttribute("error") %></div>
            <% } %>

            <form action="updateStatus" method="post" novalidate>
                <div class="form-group">
                    <label for="projectId">Project ID</label>
                    <input type="number" id="projectId" name="projectId"
                           placeholder="Enter project ID" required min="1">
                </div>
                <div class="form-group">
                    <label for="status">New Status</label>
                    <select id="status" name="status" required>
                        <option value="" disabled selected>-- Select status --</option>
                        <option value="Submitted">Submitted</option>
                        <option value="Under Review">Under Review</option>
                        <option value="Approved">Approved</option>
                        <option value="Rejected">Rejected</option>
                    </select>
                </div>
                <button type="submit" class="btn">Update Status</button>
            </form>

            <a href="${pageContext.request.contextPath}/" class="back-link">&#8592; Back to Home</a>
        </div>
    </div>
</body>
</html>
