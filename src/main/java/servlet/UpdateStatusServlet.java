package servlet;

import service.Portal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class UpdateStatusServlet extends HttpServlet {

    /** Show the update form. */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/update.jsp").forward(req, resp);
    }

    /** Process the status update. */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String idParam = req.getParameter("projectId");
        String status  = req.getParameter("status");

        if (idParam == null || idParam.isBlank() ||
            status  == null || status.isBlank()) {

            req.setAttribute("error", "Project ID and status are required.");
            req.getRequestDispatcher("/WEB-INF/views/update.jsp").forward(req, resp);
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam.trim());
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Project ID must be a valid integer.");
            req.getRequestDispatcher("/WEB-INF/views/update.jsp").forward(req, resp);
            return;
        }

        Portal portal = (Portal) getServletContext().getAttribute("portal");
        boolean updated = portal.updateStatus(id, status.trim());

        if (updated) {
            req.setAttribute("message", "Status updated successfully!");
        } else {
            req.setAttribute("error", "No project found with ID " + id + ".");
        }

        req.getRequestDispatcher("/WEB-INF/views/update.jsp").forward(req, resp);
    }
}
