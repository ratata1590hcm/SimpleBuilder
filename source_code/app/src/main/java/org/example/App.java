package com.example;

public class App {
    public static void main(String[] args) {
        while (true) {
            System.out.println("Hello, World!");
            try {
                // Sleep for 15 minutes (15 minutes * 60 seconds * 1000 milliseconds)
                Thread.sleep(15 * 60 * 1000);
            } catch (InterruptedException e) {
                // Handle exception if the thread is interrupted
                System.err.println("Thread was interrupted: " + e.getMessage());
            }
        }
    }
}
