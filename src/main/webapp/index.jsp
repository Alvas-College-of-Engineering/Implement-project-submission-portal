<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Submission Portal</title>
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
        header {
            background: #2c3e50;
            color: #fff;
            width: 100%;
            max-width: 800px;
            padding: 24px 32px;
            border-radius: 8px 8px 0 0;
            text-align: center;
        }
        header h1 { font-size: 1.8rem; }
        header p  { margin-top: 6px; opacity: .8; font-size: .95rem; }
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            width: 100%;
            max-width: 800px;
            background: #fff;
            padding: 32px;
            border-radius: 0 0 8px 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,.1);
        }
        .card {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 24px;
            text-align: center;
            text-decoration: none;
            color: #2c3e50;
            transition: transform .15s, box-shadow .15s;
        }
        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0,0,0,.12);
        }
        .card .icon { font-size: 2.4rem; margin-bottom: 12px; }
        .card h2   { font-size: 1.1rem; margin-bottom: 6px; }
        .card p    { font-size: .85rem; color: #64748b; }
        footer {
            margin-top: 32px;
            font-size: .8rem;
            color: #94a3b8;
        }
    </style>
</head>
<body>
    <header>
        <h1>&#128196; Project Submission Portal</h1>
        <p>Manage student project submissions with ease</p>
    </header>

    <div class="card-grid">
        <a href="submitProject" class="card">
            <div class="icon">&#128221;</div>
            <h2>Submit Project</h2>
            <p>Add a new student project to the portal</p>
        </a>

        <a href="viewProjects" class="card">
            <div class="icon">&#128202;</div>
            <h2>View Projects</h2>
            <p>Browse all submitted projects and their status</p>
        </a>

        <a href="updateStatus" class="card">
            <div class="icon">&#9999;&#65039;</div>
            <h2>Update Status</h2>
            <p>Change the review status of a project</p>
        </a>
    </div>

    <footer>&copy; 2026 Project Submission Portal</footer>
</body>
</html>
