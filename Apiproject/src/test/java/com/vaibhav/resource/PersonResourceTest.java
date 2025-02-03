/*package com.vaibhav.resource;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;

@QuarkusTest
public class PersonResourceTest {

    // Test for GET /persons
    @Test
    public void testGetPersons() {
        given()
          .when().get("/persons") // Ensure this matches the path in your PersonResource
          .then()
             .statusCode(200)  // HTTP status code
             .body(notNullValue()); // Ensure the response body is not empty
    }

    // Test for GET /persons/{id}
    @Test
    public void testGetPersonById() {
        // Assuming you have a person with ID 1 in the database
        given()
          .when().get("/persons/1") // Ensure this matches the path in your PersonResource
          .then()
             .statusCode(200)
             .body("id", is(1)) // Check if the person ID is 1
             .body("name", notNullValue()) // Ensure the name field is not null
             .body("email", notNullValue()); // Ensure the email field is not null
    } 

    // Test for POST /persons
    @Test
    public void testCreatePerson() {
        String newPersonJson = "{\"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}";

        given()
          .contentType("application/json")
          .body(newPersonJson) // Provide the JSON payload
          .when().post("/persons")
          .then()
             .statusCode(201) // Expecting HTTP 201 (Created)
             .body("name", is("John Doe"))
             .body("email", is("john.doe@example.com"));
    }

    // Test for PUT /persons/{id}
    @Test
    public void testUpdatePerson() {
        String updatedPersonJson = "{\"name\": \"John Updated\", \"email\": \"john.updated@example.com\"}";

        given()
          .contentType("application/json")
          .body(updatedPersonJson) // Provide the JSON payload
          .when().put("/persons/1") // Ensure the ID matches an existing person
          .then()
             .statusCode(200) // Expecting HTTP 200 (OK)
             .body("name", is("John Updated"))
             .body("email", is("john.updated@example.com"));
    }

    // Test for DELETE /persons/{id}
    @Test
    public void testDeletePerson() {
        given()
          .when().delete("/persons/1") // Ensure the ID matches an existing person
          .then()
             .statusCode(204); // HTTP 204 (No Content) on successful deletion
    }


}
*/

