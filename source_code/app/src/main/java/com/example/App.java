package com.example;

import java.util.logging.Logger;

public class App {
    private static final Logger logger = Logger.getLogger(App.class.getName());

    // Private constructor to prevent instantiation
    private App() {
        throw new UnsupportedOperationException("Utility class");
    }

    public static void main(String[] args) {
        boolean running = true;
        while (running) {
            logger.info("Hello, World!");
            try {
                // Sleep for 15 minutes
                Thread.sleep(15L * 60 * 1000);
            } catch (InterruptedException e) {
                // Properly re-interrupt the thread to preserve the interrupt status
                Thread.currentThread().interrupt();
                logger.severe("Thread was interrupted: " + e.getMessage());
                running = false;  // Optionally stop the running loop
            }
        }
    }
}