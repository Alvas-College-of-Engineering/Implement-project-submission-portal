package service;

import model.Project;

import java.util.ArrayList;
import java.util.List;

/**
 * Singleton service that manages the in-memory list of projects.
 * The instance is stored in the ServletContext so it survives
 * across requests for the lifetime of the web application.
 */
public class Portal {

    private final List<Project> projectList = new ArrayList<>();

    /** Submit a new project. */
    public void submitProject(Project project) {
        projectList.add(project);
    }

    /** Return an unmodifiable view of all projects. */
    public List<Project> getProjects() {
        return java.util.Collections.unmodifiableList(projectList);
    }

    /** Update the status of a project by ID. Returns true if found. */
    public boolean updateStatus(int id, String status) {
        for (Project p : projectList) {
            if (p.getProjectId() == id) {
                p.setStatus(status);
                return true;
            }
        }
        return false;
    }

    /** Check whether a project ID already exists. */
    public boolean exists(int id) {
        for (Project p : projectList) {
            if (p.getProjectId() == id) return true;
        }
        return false;
    }
}
