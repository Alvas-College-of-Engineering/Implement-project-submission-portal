package main;

import model.Project;
import service.Portal;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Portal portal = new Portal();

        while (true) {
            System.out.println("\n===== Project Submission Portal =====");
            System.out.println("1. Submit Project");
            System.out.println("2. View Projects");
            System.out.println("3. Update Status");
            System.out.println("4. Exit");
            System.out.print("Enter choice: ");

            int choice = sc.nextInt();
            sc.nextLine();

            switch (choice) {
                case 1:
                    System.out.print("Project ID: ");
                    int id = sc.nextInt();
                    sc.nextLine();

                    System.out.print("Student Name: ");
                    String name = sc.nextLine();

                    System.out.print("Project Title: ");
                    String title = sc.nextLine();

                    System.out.print("Description: ");
                    String desc = sc.nextLine();

                    Project project = new Project(id, name, title, desc);
                    portal.submitProject(project);
                    break;

                case 2:
                    portal.viewProjects();
                    break;

                case 3:
                    System.out.print("Enter Project ID: ");
                    int pid = sc.nextInt();
                    sc.nextLine();

                    System.out.print("Enter New Status: ");
                    String status = sc.nextLine();

                    portal.updateStatus(pid, status);
                    break;

                case 4:
                    System.out.println("Exiting...");
                    sc.close();
                    return;

                default:
                    System.out.println("Invalid choice!");
            }
        }
    }
}