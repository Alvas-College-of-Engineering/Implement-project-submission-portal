<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error – Project Submission Portal</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .card {
            background: #fff;
            padding: 48px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,.1);
            text-align: center;
            max-width: 420px;
        }
        .icon  { font-size: 3rem; margin-bottom: 16px; }
        h1     { font-size: 1.5rem; color: #991b1b; margin-bottom: 8px; }
        p      { color: #6b7280; font-size: .95rem; margin-bottom: 24px; }
        a {
            display: inline-block;
            padding: 10px 24px;
            background: #2c3e50;
            color: #fff;
            border-radius: 6px;
            text-decoration: none;
            font-size: .9rem;
        }
        a:hover { background: #1a252f; }
    </style>
</head>
<body>
    <div class="card">
        <div class="icon">&#9888;&#65039;</div>
        <h1>Something went wrong</h1>
        <p>
            <% Integer code = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
               if (code != null && code == 404) { %>
                The page you are looking for could not be found.
            <% } else { %>
                An unexpected error occurred. Please try again.
            <% } %>
        </p>
        <a href="${pageContext.request.contextPath}/">&#8592; Back to Home</a>
    </div>
</body>
</html>
