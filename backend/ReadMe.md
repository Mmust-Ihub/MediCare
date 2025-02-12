# Admin API Endpoints

This document outlines the API endpoints for the admin role in the system.

## Base URL



## Authentication

### Admin Registration
- **Endpoint:** `/admin/register`
- **Method:** `POST`
- **Description:** Registers a new admin.
- **Request Body:**
  ```json
  {
    "username": "admin123",
    "email": "admin@example.com",
    "password": "securepassword"
  }
