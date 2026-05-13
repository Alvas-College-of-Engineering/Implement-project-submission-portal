package servlet;

import service.Portal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ViewProjectsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Portal portal = (Portal) getServletContext().getAttribute("portal");
        req.setAttribute("projects", portal.getProjects());
        req.getRequestDispatcher("/WEB-INF/views/view.jsp").forward(req, resp);
    }
}
