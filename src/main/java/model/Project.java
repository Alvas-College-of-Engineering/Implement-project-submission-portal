package model;

import java.io.Serializable;
import java.time.LocalDate;

public class Project implements Serializable {

    private static final long serialVersionUID = 1L;

    private int projectId;
    private String studentName;
    private String projectTitle;
    private String description;
    private LocalDate submissionDate;
    private String status;

    public Project(int projectId, String studentName, String projectTitle, String description) {
        this.projectId     = projectId;
        this.studentName   = studentName;
        this.projectTitle  = projectTitle;
        this.description   = description;
        this.submissionDate = LocalDate.now();
        this.status        = "Submitted";
    }

    // Getters
    public int       getProjectId()      { return projectId; }
    public String    getStudentName()    { return studentName; }
    public String    getProjectTitle()   { return projectTitle; }
    public String    getDescription()    { return description; }
    public LocalDate getSubmissionDate() { return submissionDate; }
    public String    getStatus()         { return status; }

    // Setter
    public void setStatus(String status) { this.status = status; }
}
