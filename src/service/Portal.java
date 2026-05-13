package service;

import model.Project;
import java.util.ArrayList;

public class Portal {
    private ArrayList<Project> projectList = new ArrayList<>();

    // Submit Project
    public void submitProject(Project project) {
        projectList.add(project);
        System.out.println("Project submitted successfully!");
    }

    // View All Projects
    public void viewProjects() {
        if (projectList.isEmpty()) {
            System.out.println("No projects found.");
            return;
        }

        for (Project p : projectList) {
            p.displayProject();
        }
    }

    // Update Status
    public void updateStatus(int id, String status) {
        for (Project p : projectList) {
            if (p.getProjectId() == id) {
                p.setStatus(status);
                System.out.println("Status updated successfully!");
                return;
            }
        }
        System.out.println("Project not found!");
    }
}