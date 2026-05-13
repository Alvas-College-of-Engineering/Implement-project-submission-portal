package servlet;

import model.Project;
import service.Portal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class SubmitProjectServlet extends HttpServlet {

    /** Show the submission form. */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/submit.jsp").forward(req, resp);
    }

    /** Process the submitted form. */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String idParam    = req.getParameter("projectId");
        String name       = req.getParameter("studentName");
        String title      = req.getParameter("projectTitle");
        String desc       = req.getParameter("description");

        // Basic validation
        if (idParam == null || idParam.isBlank() ||
            name    == null || name.isBlank()    ||
            title   == null || title.isBlank()   ||
            desc    == null || desc.isBlank()) {

            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("/WEB-INF/views/submit.jsp").forward(req, resp);
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam.trim());
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Project ID must be a valid integer.");
            req.getRequestDispatcher("/WEB-INF/views/submit.jsp").forward(req, resp);
            return;
        }

        Portal portal = (Portal) getServletContext().getAttribute("portal");

        if (portal.exists(id)) {
            req.setAttribute("error", "A project with ID " + id + " already exists.");
            req.getRequestDispatcher("/WEB-INF/views/submit.jsp").forward(req, resp);
            return;
        }

        Project project = new Project(id, name.trim(), title.trim(), desc.trim());
        portal.submitProject(project);

        req.setAttribute("message", "Project submitted successfully!");
        req.getRequestDispatcher("/WEB-INF/views/submit.jsp").forward(req, resp);
    }
}
