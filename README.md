# TEST CASES

## Quarkus API

### Submitted By
Vaibhav

### Submitted To
Vipin Tripathi

### Test Case Version
1

### Reviewer Name
Anjali Manocha

---

## Goal
The goal of this project is to create a CRUD API (Create, Read, Update, Delete) using the Quarkus Java framework that interacts with a MySQL database and is set up with an Nginx load balancer for scalability and high availability.

**Example:**
Imagine you are building a User Management System for a small company. They want a backend API that allows their team to manage employee information. They can create, update, delete, and read employee information using this API.

---

## Table of Contents

- [Test Environment](#test-environment)
- [TC1: Add a new user](#tc1-add-a-new-user)
- [TC2: Delete a particular user](#tc2-delete-a-particular-user)
- [TC3: Update user details](#tc3-update-user-details)
- [TC4: Fetch All Users](#tc4-fetch-all-users)
- [TC5: Fetch a user by ID](#tc5-fetch-a-user-by-id)
- [TC6: Delete all users](#tc6-delete-all-users)

---

## Test Environment
Ubuntu Linux, MySQL, and Nginx container (using Podman), Browser

---

## TC1: Add a new user

### Scenario
**Remarks:** We can add a user using CRUD operation.

**Given:**
- Ubuntu Installed
- API in running state
- Valid Credentials
- Access to the internet

**When:** User writes a `POST` command with credentials in the terminal and presses enter.

**Then:** A user will be added and saved.

**Test Run:**
- **Date:** 18-01-2025
- **Result:** Pass

---

## TC2: Delete a particular user

### Scenario
**Remarks:** We can also delete a particular user if required.

**Given:**
- Ubuntu Installed
- API in running state
- Access to the internet
- Already saved user with ID

**When:** We run `DELETE` command with the user ID in the terminal and press enter.

**Then:** That particular user will be deleted.

**Test Run:**
- **Date:** 18-01-2025
- **Result:** Pass

---

## TC3: Update user details

### Scenario
**Remarks:** A user’s information can be updated also.

**Given:**
- Ubuntu Installed
- API in running state
- Access to the internet
- Already saved User with ID

**When:** We run `PUT` command with user ID and new credentials in our terminal and press enter.

**Then:** User information will be updated.

**Test Run:**
- **Date:** 18-01-2025
- **Result:** Pass

---

## TC4: Fetch All Users

### Scenario
**Remarks:** We can see a list of all the users currently registered.

**Given:**
- Ubuntu Installed
- API in running state
- Access to the internet
- Already saved user

**When:** You run `GET` command in terminal and press enter.

**Then:** All the users which were saved will appear on the terminal.

**Test Run:**
- **Date:** 18-01-2025
- **Result:** Pass

---

## TC5: Fetch a user by ID

### Scenario
**Remarks:** We can also fetch a particular user if required.

**Given:**
- Ubuntu Installed
- API in running state
- Access to the internet
- Already saved user with ID

**When:** You run `GET` command in terminal with the user ID and press enter.

**Then:** That particular user will appear on terminal.

**Test Run:**
- **Date:** 18-01-2025
- **Result:** Pass

---

## TC6: Delete all users

### Scenario
**Remarks:** All users' information can be deleted also.

**Given:**
- Ubuntu Installed
- API in running state
- Access to the internet
- Already saved users

**When:** You run `DELETE` command with `all` path in terminal and press enter.

**Then:** All the users will be deleted.

**Test Run:**
- **Date:** 18-01-2025
- **Result:** Pass
