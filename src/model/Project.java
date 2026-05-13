package model;

import java.time.LocalDate;

public class Project {
    private int projectId;
    private String studentName;
    private String projectTitle;
    private String description;
    private LocalDate submissionDate; 
    private String status;

    // Constructor
    public Project(int projectId, String studentName, String projectTitle, String description) {
        this.projectId = projectId;
        this.studentName = studentName;
        this.projectTitle = projectTitle;
        this.description = description;
        this.submissionDate = LocalDate.now(); // AUTO DATE
        this.status = "Submitted";
    }

    // Getters
    public int getProjectId() { return projectId; }
    public String getStudentName() { return studentName; }
    public String getProjectTitle() { return projectTitle; }
    public String getDescription() { return description; }
    public LocalDate getSubmissionDate() { return submissionDate; }
    public String getStatus() { return status; }

    // Setter
    public void setStatus(String status) {
        this.status = status;
    }

    // Display
    public void displayProject() {
        System.out.println("\nProject ID: " + projectId);
        System.out.println("Student Name: " + studentName);
        System.out.println("Project Title: " + projectTitle);
        System.out.println("Description: " + description);
        System.out.println("Submission Date: " + submissionDate);
        System.out.println("Status: " + status);
    }
}